#import "template.typ": *

#set page(margin: (
    top: 0.125in,
))
#set page(
    margin: 0.25in, // Reccomended to have 0.5in margin on all sides
    paper: "us-letter",
)

// Put your personal information here, replacing mine
#let name = "Rajeev Atla"
#let email = "rajeevatla101@gmail.com"
#let github = "github.com/RajeevAtla"
#let linkedin = "linkedin.com/in/rajeev-atla"
#let phone = "732-209-3995"
#let personal-site = "rajeevatla.com"

#show: resume.with(
    author: name,
    // All the lines below are optional.
    // For example, if you want to to hide your phone number:
    // feel free to comment those lines out and they will not show.
    visa: "US Citizen",
    email: email,
    github: github,
    linkedin: linkedin,
    phone: phone,
    personal-site: personal-site,
    accent-color: "#000000",
    font: "New Computer Modern",
    paper: "us-letter",
    author-position: center,
    personal-info-position: center,
)

#set list(
    indent: 0in,
    body-indent: 0.125em,
)

== Education

#let position = sys.inputs.at("position", default: "default")

#if position == "default" {
    edu(
        institution: "Rutgers University - School of Engineering",
        location: "New Brunswick, NJ",
        dates: dates-helper(start-date: "Sep 2025", end-date: "Present"),
        degree: [*Master of Science* in Computer Engineering (Specialization in Machine Learning)],
        consistent: true,
    )
} else if position == "intern" {
    edu(
        institution: "Rutgers University - School of Engineering",
        location: "New Brunswick, NJ",
        dates: dates-helper(start-date: "Sep 2025", end-date: "Dec 2026"),
        degree: [*Master of Science* in Computer Engineering (Specialization in Machine Learning)],
        consistent: true,
    )
} else if position == "fulltime" {
    edu(
        institution: "Rutgers University - School of Engineering",
        location: "New Brunswick, NJ",
        dates: dates-helper(start-date: "Sep 2025", end-date: "May 2026"),
        degree: [*Master of Science* in Computer Engineering (Specialization in Machine Learning)],
        consistent: true,
    )
}

#if position != "BS" {
    [#link("https://www.linkedin.com/in/rajeev-atla/details/education/")[Coursework]:
        Reinforcement Learning,
        Multimodal AI,
        High Performance/Distributed Computing]
}

#edu(
    institution: "Rutgers University - School of Engineering",
    location: "New Brunswick, NJ",
    dates: dates-helper(start-date: "Sep 2021", end-date: "May 2025"),
    degree: [*Bachelor of Science* (Triple Major) in Computer Engineering, Computer Science, and Data Science],
    consistent: true,
)

Recipient of the Eleanor and Samuel Sneath Endowed Merit Scholarship for Engineering Students

#link("https://www.linkedin.com/in/rajeev-atla/details/education/")[Coursework]:
AI,
Distributed Deep Learning,
Data Science,
Statistical Learning,
Computer Vision

== Skills

- *Programming Languages*: Python, R, SQL, Java, C/C++/CUDA, JavaScript/TypeScript, Rust, Bash
- *AI/ML*: NumPy, PyTorch, JAX, TensorFlow, Keras, Pandas, Scikit-Learn, Transformers, LangChain/LangGraph, DSPy, RAG
- *Data Visualization*: Matplotlib, Seaborn, Plotly, Tableau
- *Cloud & DevOps*: AWS, Microsoft Azure, OCI (Oracle Cloud Infrastructure), GitHub Actions, Docker, Kubernetes
- *Tools & Databases*: Jupyter Notebooks, Apache Kafka, Git, Linux (Ubuntu), PostgreSQL, MongoDB, Jira

== Certifications

#list(
    [*AWS*:
        #link("https://cp.certmetrics.com/amazon/en/public/verify/credential/2a24b581901e4be197fee427ddb182b7")[Certified Cloud Practitioner],
        #link("https://cp.certmetrics.com/amazon/en/public/verify/credential/c50dee26623044ebae5fb1fcea7eacbe")[Certified Machine Learning Specialist],
        #link(
            "https://cp.certmetrics.com/amazon/en/public/verify/credential/f462323f53414e4bae42b76f9623fbe7",
        )[Certified AI Practitioner]
    ],
    [*Oracle (OCI)*:
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=13B424A52FAC66888CE002F8FDFD03FE72573248AD549080F85BC11D522388E6")[AI Foundations Associate],
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=4E6A2DD94215E77B8B87E4525DF387411A640BAB65D7201AB0B1D2D24CED0B6A")[Generative AI Professional],
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=D6DF3AA55B1FD67438560857EFA59468400814337EAD29CD74174A68C3AD9DF1")[Data Science Professional],
        #link(
            "https://catalog-education.oracle.com/ords/certview/sharebadge?id=7D830D9EAD09139AEF50FBE30832C50E40C736425C432E7E1407F397FA3B76A8",
        )[Vector AI Search Professional]
    ],
)

== Work Experience

#work(
    title: "AI Engineering Intern",
    location: "Remote",
    company: "Atlait Inc.",
    dates: dates-helper(start-date: "May 2024", end-date: "Sep 2024"),
)
- Developed a Python-SQL compression script for form data, *reducing storage costs by 7%* for enterprise clients
- *Accelerated mean response time by 96 milliseconds* by integrating PyTorch inference models into Kafka microservices
- Created a *> 1TB* RAG system, utilizng A/B testing to evaluate and optimize AI-powered search accuracy
- Optimized CI/CD pipeline to *speed up build times by 13%* ensuring efficient development cycles

== Projects

#project(
    name: "dexMCP",
    url: "https://bit.ly/dexmcp",
)
- Engineered Model Context Protocol (MCP) server exposing *5+ reusable tools* and *5+ Pydantic models*
- Implemented parameter validation across *20+ typed fields* and *100% of tool inputs*
- Built asynchronous clients using DSPy and LangChain to auto-discover tools and execute multi-step requests

#project(
    name: "DocuMint",
    url: "https://bit.ly/DocuMint",
)
- Built a 5-agent LangGraph + Gemini doc-modernizer with Gradio,
    achieved *90%+ modernization coverage* on sample docs,
    *cut manual edit time 50%* with a *4-tab UX*,
    hardened with *8 deterministic pytest cases* and network-safe skips
- Authored modular AI agents
    (fetcher, analyzer, researcher, generator, quality-checker)
    with structured prompts and severity-prioritized research,
    *lifting modernization accuracy by 35%* and *trimming LLM API spend by 20%*

#project(
    name: "SuperconGAN",
    url: "https://bit.ly/3z7JaqZ",
)
- Built a PyTorch-based GAN to model superconductivity data of various materials, enhancing generative AI applications
- Extracted and processed *80,000+ dataset entries* from the UCI ML Repository using Pandas efficiently
- Released Python package on PyPI, achieving over #link("https://pepy.tech/projects/supercongan?timeRange=threeMonths&category=version&includeCIDownloads=true&granularity=daily&viewType=stacked&versions=0.2.5%2C0.2.4%2C0.2.3")[*80,000+ downloads*] and widespread adoption
- Authored LaTeX paper detailing experimental design and validation methodology for *500,000+ data points*

#project(
    name: "Cityscape (Won 2nd Overall at HackExeter 2021)",
    url: "https://bit.ly/3OZjJ07",
)
- Designed and implemented a city tour mobile app, resulting in *100+ vivid city tours* for users
- Wrote controllers and models for MongoDB using MongooseORM to store *30+ kB of geographic data* in NoSQL schema
- Built mobile user interface allowing users to search, review, rank, and explore *100+ tours* using Flutter/Dart
- Constructed REST API using Express.js and nodemon to *increase development velocity by 20%* with hot-reloading

