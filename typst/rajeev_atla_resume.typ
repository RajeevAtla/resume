#import "resume.typ": *

#set page(margin: (
    top: 0cm,
))

// Put your personal information here, replacing mine
#let name = "Rajeev Atla"
#let email = "rajeevatla101@gmail.com"
#let github = "github.com/RajeevAtla"
#let linkedin = "linkedin.com/in/rajeev-atla"
#let phone = "+1 (732) 209-3995"
#let personal-site = "rajeevatla.com"

#show: resume.with(
    author: name,
    // All the lines below are optional.
    // For example, if you want to to hide your phone number:
    // feel free to comment those lines out and they will not show.
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
    indent: -0in,
    body-indent: 0.125em,
)

== Education

#edu(
    institution: "Rutgers University - School of Engineering",
    location: "New Brunswick, NJ",
    dates: dates-helper(start-date: "Sep 2025", end-date: "May 2026"),
    degree: "MS in Computer Engineering (Specialization in Machine Learning)",
    consistent: true,
)

Relevant Coursework: Reinforcement Learning, Multimodal Machine Learning, High Performance & Distributed Computing

#edu(
    institution: "Rutgers University - School of Engineering",
    location: "New Brunswick, NJ",
    dates: dates-helper(start-date: "Sep 2021", end-date: "May 2025"),
    degree: "Triple Major (BS) in Computer Science, Computer Engineering, and Data Science",
    consistent: true,
)

Relevant Coursework:
Machine Learning,
AI,
Deep Learning,
Distributed Deep Learning,
Data Science,
Statistical Learning,
Statistical Inference,
Stochastic Processes,
Algorithms,
Computer Vision
== Skills
- *Programming Languages*: Python, R, SQL, Java, C/C++, Rust, Elixir, MATLAB, Bash
- *Libraries/Frameworks*: NumPy, PyTorch, PyTorch Lightning, TensorFlow, Keras, Pandas, Scikit-Learn, NLTK
- *Data Visualization*: Matplotlib, Seaborn, Plotly, Tableau
- *Cloud & DevOps*: AWS, Microsoft Azure, Vercel, GitHub Actions, Jenkins, Docker, Kubernetes
- *Tools & Databases*: Git, Linux (Ubuntu), PostgreSQL, MongoDB, Jira, Emacs, Zed

== Work Experience

#work(
    title: "Software Engineering Intern",
    location: "Remote",
    company: "Atlait Inc.",
    dates: dates-helper(start-date: "May 2024", end-date: "September 2024"),
)
- Developed a Python-SQL compression script for form data, *reducing storage costs by 7%* for enterprise clients
- Integrated a PyTorch inference system into microservices architecture, *improving mean response time by 96 milliseconds*
- Updated codebase from ES5 to ES7 using HTML, CSS, and TypeScript, resulting in *23% faster mean page loads*
- Optimized CI/CD pipeline to *speed up build times by 13%* ensuring efficient development cycles
== Projects

#project(
    name: "SuperconGAN",
    url: "https://bit.ly/3z7JaqZ",
)
- Built a PyTorch-based GAN to model superconductivity data, enhancing generative AI applications
- Extracted and processed *80,000+ dataset entries* from the UCI ML Repository using Pandas efficiently
- Released Python package on PyPI, achieving over *63,000+ downloads* and widespread adoption
- Authored a LaTeX paper on findings and future scope, *incorporating 500,000+ data points* effectively

#project(
    name: "IMDB Movie Review Sentiment Analysis",
    url: "https://bit.ly/3C3RpWK",
)
- Led *team of 5* to use Scikit-learn and Pandas to classify IMDB movie reviews
- Implemented a F1-based linear term-frequency bigram NLP model to *achieve 90.5% accuracy*
- Extracted data from *25,000+ movie reviews* with Pandas and *removed 20+ stopwords* to improve model performance
- Created confusion matrices and data visualizations for *5+ models* using Seaborn
- Presented results in annual data science competition in local community, *placing 3rd place out of 15+ teams*

#project(
    name: "Cityscape",
    url: "https://bit.ly/3OZjJ07",
)
- Lead a *team of 4* in designing and implementing a city tour mobile app, resulting in *100+ vivid city tours* for users
- Wrote controllers and models for MongoDB using MongooseORM to store *30+ kB of geographic data* in NoSQL schema
- Built mobile user interface allowing users to search, review, rank, and explore *100+ tours* using Flutter/Dart
- Constructed REST API using Express.js and nodemon to *increase development velocity by 20%* with hot-reloading
- Overhauled Google Slides pitch deck to win *2nd overall at HackExeter 2021*

#project(
    name: "EyeQ",
    url: "https://bit.ly/3RsAyBL",
)
- Spearheaded *team of 5* to improve expreriences for visually impaired people
- Developed Elixir-based application to transcribe images and documents *up to 1 GB in size*
- *Reduced Docker image size by 53%*, accerlating the build pipeline
- Improved and streamlined Phoenix server and React dashboard to ensure *average latency is < 3s*
