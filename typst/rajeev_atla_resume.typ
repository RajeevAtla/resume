#import "template.typ": *

#set page(margin: (
    top: 0.125in,
))
#set page(
    margin: 0.25in, // Recommended to have 0.5in margin on all sides
    paper: "us-letter",
)

// Put your personal information here, replacing mine
#let name = "Rajeev Atla"
#let email = "rajeev.atla@gmail.com"
#let github = "github.com/RajeevAtla"
#let linkedin = "linkedin.com/in/rajeev-atla"
#let phone = "732-209-3995"
#let personal-site = "rajeevatla.com"

#let domain = sys.inputs.at("domain", default: "default")
#let description = state("domain", "Hard-working and Motivated Builder")

#description.update(
    if domain == "aiml" {
        "AI/ML Engineer and Data Scientist Building Scalable, Secure, Smart Systems"
    } else if domain == "dataeng" {
        "AI/ML and Data Engineer Building Scalable, Secure, Smart Systems"
    } else if domain == "swe" {
        "AI-Native Software Engineer Building Secure Backend Systems, using Automated Cloud Infrastructure"
    } else { "Hard-working and Motivated Builder" },
)

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
    description: context description.get(),
)

#set list(
    indent: 0in,
    body-indent: 0.125em,
)

== Education

#let term = sys.inputs.at("term", default: "default")
#let end-date-val = state("end-date", "Present")

#end-date-val.update(
    if term == "default" { "Present" } else if term == "intern" {
        "Dec 2026"
    } else if term == "newgrad" { "May 2026" } else { "Present" },
)

#edu(
    institution: "Princeton University (Exchange Student)/Rutgers University - School of Engineering",
    location: "Princeton/New Brunswick, NJ",
    dates: dates-helper(
        start-date: "Sep 2025",
        end-date: context end-date-val.get(),
    ),
    degree: [*Master of Science* in Computer Engineering (Specialization in Machine Learning)],
    consistent: true,
)

#link("https://www.linkedin.com/in/rajeev-atla/details/education/")[Coursework]:
Multimodal AI,
LLMs,
Reinforcement Learning,
Machine Vision,
AI for Precision Health,
High Performance Computing


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
ML,
Distributed Deep Learning,
Data Science,
Robotics and Computer Vision,
Info and Network Security

== Skills

#list(
    [*Programming Languages*: Python, R, SQL, Java, C/C++/CUDA, JavaScript/TypeScript, Rust, Bash, Go],
    [*AI/ML*: NumPy, PyTorch, JAX, TensorFlow, Keras, Pandas, Scikit-Learn, OpenAI API, LangChain/LangGraph, OpenCV, DSPy, RAG,
        HuggingFace (Transformers, Tokenizers, Datasets, Diffusers), vLLM, pgvector, Pydantic, FastAPI, NLTK, spaCy],
    [*Visualization*: Matplotlib, Seaborn, Plotly, Tableau, PowerBI, React],
    [*Cloud & DevOps*: AWS, Microsoft Azure, OCI, GCP, GitHub Actions, Docker, Kubernetes, Slurm],
    [*Tools & Databases*: Jupyter, PySpark, Hadoop/Hive, Git, Linux, PostgreSQL, Kafka, Jira, PyTest, Codex, Claude Code],
)

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
- Integrated DevSecOps within GitHub Actions, *improving risk mitigation by 13%* for production
- Engineered PyTorch inference models for real-time predictions, *optimizing latency by 96ms* and enabling faster decision-making
- Created a *> 1TB* RAG-PySpark system, utilizing A/B testing to optimize AI-powered search and recommendation accuracy
- Optimized Airflow-Hadoop data pipeline to *speed up analytics delivery by 13%* in a cross-functional Agile environment

== Projects

#project(
    name: "DocuMint",
    url: "https://bit.ly/DocuMint",
)
- Built a 5-agent LangGraph + Gemini API doc-modernizer with Gradio,
    achieved *90%+ modernization coverage* on sample docs,
    *cut manual edit time by 50%* with a *4-tab UX*,
    hardened with *8 deterministic Pytest cases* and network-safe skips
- Authored a modular multi-agent system with structured prompts and severity-prioritized research,
    *lifting modernization accuracy by 35%* and *trimming LLM API spend by 20%*

#project(
    name: "dexMCP",
    url: "https://bit.ly/dexmcp",
)
- Engineered Model Context Protocol (MCP) server exposing *5+ reusable tools* and *5+ Pydantic models*
- Implemented parameter validation across *20+ typed fields* and *100% of tool inputs* using Pydantic
- Built asynchronous clients using *DSPy* and *LangChain* to auto-discover tools and execute multi-step agentic workflows

#project(
    name: "SuperconGAN",
    url: "https://bit.ly/3z7JaqZ",
)
- Built a PyTorch-based GAN to create synthetic superconductivity data of various materials, enhancing generative AI applications
- Extracted and processed *80,000+ dataset entries* from the UCI ML Repository using Pandas efficiently
- Released Python package on PyPI, achieving over #link("https://pepy.tech/projects/supercongan?timeRange=threeMonths&category=version&includeCIDownloads=true&granularity=daily&viewType=stacked&versions=0.2.5%2C0.2.4%2C0.2.3")[*80,000 downloads*] and widespread adoption

#if domain == "swe" {
    project(
        name: "Cityscape Mobile Tour App (Won 2nd Overall at HackExeter 2021)",
        url: "https://bit.ly/3OZjJ07",
    )
    [
        - Wrote controllers and models for MongoDB using Mongoose ODM to store *30+ kB of geographic data* in NoSQL schema
        - Built mobile user interface allowing users to search, review, rank, and explore *100+ tours* using Flutter/Dart
        - Constructed REST API using Express.js and nodemon to *increase development velocity by 20%* with hot-reloading
    ]
} else {
    project(
        name: "raceformer",
        url: "https://bit.ly/raceformer",
    )
    [
        - Engineered a high-fidelity "Real-to-Sim" validation CUDA pipeline processing *30GB of multimodal sensor data*
            (LiDAR, camera, radar) on 4xA100s,
            utilizing JAX-based vision-language model to generate ground truth scenarios for intelligent systems
        - Achieved a *95% pass rate on safety metrics* by leveraging geometric priors to fine-tune RL policies,
            establishing clear performance baselines and *outperforming standard models by 35%* in neural path planning and risk avoidance
    ]
}
