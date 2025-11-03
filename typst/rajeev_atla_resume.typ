#import "template.typ": *

#set page(margin: (
    top: 0cm,
))

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
        degree: "MS in Computer Engineering (Specialization in Machine Learning)",
        consistent: true,
    )
} else if position == "intern" {
    edu(
        institution: "Rutgers University - School of Engineering",
        location: "New Brunswick, NJ",
        dates: dates-helper(start-date: "Sep 2025", end-date: "Dec 2026"),
        degree: "MS in Computer Engineering (Specialization in Machine Learning)",
        consistent: true,
    )
} else if position == "fulltime" {
    edu(
        institution: "Rutgers University - School of Engineering",
        location: "New Brunswick, NJ",
        dates: dates-helper(start-date: "Sep 2025", end-date: "May 2026"),
        degree: "MS in Computer Engineering (Specialization in Machine Learning)",
        consistent: true,
    )
}

#if position != "BS" {
    [Coursework:
        Reinforcement Learning,
        Multimodal AI,
        High Performance/Distributed Computing]
}

#edu(
    institution: "Rutgers University - School of Engineering",
    location: "New Brunswick, NJ",
    dates: dates-helper(start-date: "Sep 2021", end-date: "May 2025"),
    degree: "BS (Triple Major) in Computer Science, Computer Engineering, and Data Science",
    consistent: true,
)

Eleanor and Samuel Sneath Endowed Scholarship (awarded to 10 engineering students/year)

Coursework:
AI,
Distributed Deep Learning,
Data Science,
Statistical Learning,
Computer Vision

== Skills
- *Programming Languages*: Python, R, SQL, Java/Scala, C/C++, Rust, Elixir, MATLAB, Bash
- *Libraries/Frameworks*: NumPy, PyTorch, TensorFlow, Keras, Pandas, Scikit-Learn, NLTK, LangChain/LangGraph
- *Data Visualization*: Matplotlib, Seaborn, Plotly, Tableau
- *Cloud & DevOps*: AWS, Microsoft Azure, Vercel, GitHub Actions, Docker, Kubernetes
- *Tools & Databases*: Jupyter, Apache Kafka, Git, Linux (Ubuntu), PostgreSQL, MongoDB, Jira

== Work Experience

#work(
    title: "Software Engineering Intern",
    location: "Remote",
    company: "Atlait Inc.",
    dates: dates-helper(start-date: "May 2024", end-date: "September 2024"),
)
- Developed a Python-SQL compression script for form data, *reducing storage costs by 7%* for enterprise clients
- Integrated PyTorch inference into Kafka-microservices architecture, *improving mean response time by 96 milliseconds*
- Updated codebase from ES5 to ES7 using HTML, CSS, and TypeScript, resulting in *23% faster mean page loads*
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
    name: "SuperconGAN",
    url: "https://bit.ly/3z7JaqZ",
)
- Built a PyTorch-based GAN to model superconductivity data, enhancing generative AI applications
- Extracted and processed *80,000+ dataset entries* from the UCI ML Repository using Pandas efficiently
- Released Python package on PyPI, achieving over *63,000+ downloads* and widespread adoption
- Authored a LaTeX paper on findings and future scope, *incorporating 500,000+ data points* effectively

#project(
    name: "Cityscape (2nd Overall at HackExeter 2021)",
    url: "https://bit.ly/3OZjJ07",
)
- Led a *team of 4* in designing and implementing a city tour mobile app, resulting in *100+ vivid city tours* for users
- Wrote controllers and models for MongoDB using MongooseORM to store *30+ kB of geographic data* in NoSQL schema
- Built mobile user interface allowing users to search, review, rank, and explore *100+ tours* using Flutter/Dart
- Constructed REST API using Express.js and nodemon to *increase development velocity by 20%* with hot-reloading

#project(
    name: "EyeQ",
    url: "https://bit.ly/3RsAyBL",
)
- Developed Elixir-Rust NIF application to transcribe images and documents *up to 1 GB in size*
- *Reduced Docker image size by 53%*, accelerating the build pipeline
- Improved and streamlined Phoenix server and React dashboard to ensure *average latency is < 3s*

== Certifications

#list(
    [*Oracle (OCI)*:
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=13B424A52FAC66888CE002F8FDFD03FE72573248AD549080F85BC11D522388E6")[AI Foundations Associate],
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=4E6A2DD94215E77B8B87E4525DF387411A640BAB65D7201AB0B1D2D24CED0B6A")[Generative AI Professional],
        #link("https://catalog-education.oracle.com/ords/certview/sharebadge?id=D6DF3AA55B1FD67438560857EFA59468400814337EAD29CD74174A68C3AD9DF1")[Data Science Professional],
        #link(
            "https://catalog-education.oracle.com/ords/certview/sharebadge?id=7D830D9EAD09139AEF50FBE30832C50E40C736425C432E7E1407F397FA3B76A8",
        )[Vector AI Search Professional]],
)

- *AWS*: Certified Cloud Practitioner

