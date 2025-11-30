use std::{fs, path::PathBuf, sync::Arc};
use anyhow::Result;
use clap::Parser;
use harper_core::{
    Dialect,
    Document,
    linting::LintGroup,
    spell::{FstDictionary, MutableDictionary, MergedDictionary, DictWordMetadata},
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

fn main() -> Result<()> {
    let args = Args::parse();

    let text = fs::read_to_string(&args.file)?;

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
            // Lint implements Debug; easiest is just:
            println!("{lint:#?}");
        }
    }

    Ok(())
}