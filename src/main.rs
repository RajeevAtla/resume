use std::{fs, path::PathBuf, sync::Arc};
use anyhow::Result;
use clap::Parser;
use harper_core::{
    Dialect, DictWordMetadata, Document, linting::LintGroup,
    spell::{FstDictionary, MutableDictionary, MergedDictionary},
};

#[derive(Parser, Debug)]
struct Args {
    /// File to spell check
    file: PathBuf,

    /// Extra dictionary: one word per line
    #[arg(short, long)]
    extra_dict: Option<PathBuf>,
}

fn load_extra_dict(path: &PathBuf) -> Result<MutableDictionary> {
    let contents = fs::read_to_string(path)?;
    let mut dict = MutableDictionary::new();

    // very simple: one word per non-empty line
    let words = contents
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(|word| (word.chars().collect::<Vec<_>>(), DictWordMetadata::default()));

    dict.extend_words(words);
    Ok(dict)
}

fn build_line_starts(text: &str) -> Vec<usize> {
    let mut starts = vec![0];
    for (idx, ch) in text.chars().enumerate() {
        if ch == '\n' {
            starts.push(idx + 1);
        }
    }
    starts
}

fn offset_to_line_col(offset: usize, line_starts: &[usize]) -> (usize, usize) {
    let line_idx = match line_starts.binary_search(&offset) {
        Ok(idx) => idx,
        Err(insert) => insert.saturating_sub(1),
    };
    let col = offset.saturating_sub(line_starts[line_idx]) + 1;
    (line_idx + 1, col)
}

fn main() -> Result<()> {
    let args = Args::parse();

    let text = fs::read_to_string(&args.file)?;
    let line_starts = build_line_starts(&text);
    let lines: Vec<&str> = text.lines().collect();
    let chars: Vec<char> = text.chars().collect();

    // 1) Base curated dictionary (fast spellchecking) 
    let base_dict = Arc::new(FstDictionary::curated());

    // 2) Optional user dictionary
    let mut merged = MergedDictionary::new();
    // Put curated first so it “wins” if a word exists in both
    merged.add_dictionary(base_dict.clone() as Arc<dyn harper_core::spell::Dictionary>);

    if let Some(extra_path) = args.extra_dict.as_ref() {
        let extra = load_extra_dict(extra_path)?;
        merged.add_dictionary(Arc::new(extra) as Arc<dyn harper_core::spell::Dictionary>);
    }

    let merged = Arc::new(merged);

    // 3) Build a Document using our merged dictionary (plain English; use markdown_* if needed) 
    let doc = Document::new_plain_english(&text, merged.as_ref());

    // 4) Build the curated lint group *using the same dictionary* 
    let mut group = LintGroup::new_curated(merged.clone(), Dialect::American);

    // 5) Run lints and pull out just the SpellCheck lints
    let organized = group.organized_lints(&doc);
    if let Some(spell_lints) = organized.get("SpellCheck") {
        for lint in spell_lints {
            let (start_line, start_col) = offset_to_line_col(lint.span.start, &line_starts);
            let (end_line, end_col) =
                offset_to_line_col(lint.span.end.saturating_sub(1), &line_starts);

            println!(
                "\n{}:{}-{}:{} | {} ({:?})",
                start_line, start_col, end_line, end_col, lint.message, lint.lint_kind
            );

            let highlight_len = lint.span.len().max(1);
            if let Some(line) = lines.get(start_line.saturating_sub(1)) {
                println!("    {}", line);
                if start_line == end_line {
                    let padding = " ".repeat(start_col.saturating_sub(1));
                    let marker = "^".repeat(highlight_len);
                    println!("    {}{}", padding, marker);
                } else {
                    let padding = " ".repeat(start_col.saturating_sub(1));
                    println!("    {}^ (spans multiple lines)", padding);
                }
            }

            if !lint.suggestions.is_empty() {
                let suggestions = lint
                    .suggestions
                    .iter()
                    .map(|s| s.to_string())
                    .collect::<Vec<_>>()
                    .join(" | ");
                println!("    suggestions: {suggestions}");
            }

            let offending = lint.span.get_content(&chars).iter().collect::<String>();
            if !offending.is_empty() {
                println!("    offending: \"{offending}\"");
            }
        }
    }

    Ok(())
}
