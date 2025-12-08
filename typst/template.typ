#let resume(
    author: "",
    author-position: left,
    personal-info-position: left,
    visa: "",
    location: "",
    email: "",
    github: "",
    linkedin: "",
    phone: "",
    personal-site: "",
    description: "",
    accent-color: "#000000",
    font: "New Computer Modern",
    paper: "us-letter",
    author-font-size: 20pt,
    font-size: 10pt,
    body,
) = {
    // Sets document metadata
    set document(author: author, title: "Rajeev Atla's Resume")

    // Document-wide formatting, including font and margins
    set text(
        // LaTeX style font
        font: font,
        size: font-size,
        lang: "en",
        // Disable ligatures so ATS systems do not get confused when parsing fonts.
        ligatures: false,
    )


    // Link styles
    show link: underline

    show link: set text(
        fill: rgb("0000FF"),
    )

    // Small caps for section titles
    show heading.where(level: 2): it => [
        #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
        #line(length: 100%, stroke: 1pt)
    ]


    // Accent Color Styling
    show heading: set text(
        fill: rgb(accent-color),
    )

    show link: set text(
        fill: rgb("0000FF"),
    )


    // Name will be aligned left, bold and big
    show heading.where(level: 1): it => [
        #set align(author-position)
        #set text(
            weight: 700,
            size: author-font-size,
        )
        #pad(it.body)
    ]

    show heading.where(level: 3): it => [
        #set align(author-position)
        #set text(
            weight: 600,
            size: font-size,
        )
        #pad(it.body)
    ]

    // Heading (author and description)
    [
        = #(author)
        === #(description)
    ]

    // Personal Info Helper
    let contact-item(value, prefix: "", link-type: "") = {
        if value != "" {
            if link-type != "" {
                link(link-type + value)[#(prefix + value)]
            } else {
                value
            }
        }
    }

    // Personal Info
    pad(
        top: 0.25em,
        align(personal-info-position)[
            #{
                let items = (
                    contact-item(visa),
                    contact-item(phone, link-type: "tel:"),
                    contact-item(location),
                    contact-item(email, link-type: "mailto:"),
                    contact-item(github, link-type: "https://"),
                    contact-item(linkedin, link-type: "https://"),
                    contact-item(personal-site, link-type: "https://"),
                )
                items.filter(x => x != none).join(" | ")
            }
        ],
    )

    // Main body.
    set par(justify: true)

    body
}

// Generic two by two component for resume
#let generic-two-by-two(
    top-left: "",
    top-right: "",
    bottom-left: "",
    bottom-right: "",
) = {
    [
        #top-left #h(1fr) #top-right \
        #bottom-left #h(1fr) #bottom-right
    ]
}

// Generic one by two component for resume
#let generic-one-by-two(
    left: "",
    right: "",
) = {
    [
        #left #h(1fr) #right
    ]
}

// Normalizes URLs to include a scheme before linking.
#let ensure-url(url) = if url == "" {
    none
} else if "://" in url {
    url
} else {
    "https://" + url
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
    start-date: "",
    end-date: "",
) = {
    start-date + " " + $dash.em$ + " " + end-date
}

// Section components below
#let edu(
    institution: "",
    dates: "",
    degree: "",
    gpa: "",
    location: "",
    // Makes dates on upper right like rest of components
    consistent: false,
) = {
    if consistent {
        // edu-constant style (dates top-right, location bottom-right)
        generic-two-by-two(
            top-left: strong(institution),
            top-right: dates,
            bottom-left: emph(degree),
            bottom-right: emph(location),
        )
    } else {
        // original edu style (location top-right, dates bottom-right)
        generic-two-by-two(
            top-left: strong(institution),
            top-right: location,
            bottom-left: emph(degree),
            bottom-right: emph(dates),
        )
    }
}

#let work(
    title: "",
    dates: "",
    company: "",
    location: "",
) = {
    generic-two-by-two(
        top-left: strong(title),
        top-right: dates,
        bottom-left: company,
        bottom-right: emph(location),
    )
}

#let project(
    role: "",
    name: "",
    url: "",
    dates: "",
) = {
    let resolved-url = ensure-url(url)
    generic-one-by-two(
        left: {
            if role == "" {
                [*#name* #if resolved-url != none and dates != "" [ (#link(resolved-url)[#url])]]
            } else {
                [*#role*, #name #if resolved-url != none and dates != "" [ (#link(resolved-url)[#url])]]
            }
        },
        right: {
            if dates == "" and resolved-url != none {
                link(resolved-url)[#url]
            } else {
                dates
            }
        },
    )
}

#let certificates(
    name: "",
    issuer: "",
    url: "",
    date: "",
) = {
    let resolved-url = ensure-url(url)
    [
        *#name*, #issuer
        #if resolved-url != none {
            [ (#link(resolved-url)[#url])]
        }
        #h(1fr) #date
    ]
}

#let extracurriculars(
    activity: "",
    dates: "",
) = {
    generic-one-by-two(
        left: strong(activity),
        right: dates,
    )
}
