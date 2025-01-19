using LocalSignalAttributes
using Documenter

DocMeta.setdocmeta!(LocalSignalAttributes, :DocTestSetup, :(using LocalSignalAttributes); recursive=true)

makedocs(;
    modules=[LocalSignalAttributes],
    authors="Akshika Rohatgi",
    sitename="LocalSignalAttributes.jl",
    format=Documenter.HTML(;
        canonical="https://arohatgi29.github.io/LocalSignalAttributes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Reference" => "reference.md",
    ],
)

deploydocs(
    repo = "https://github.com/arohatgi29/LocalSignalAttributes.jl",  # Full HTTPS URL
    devbranch = "main",  
)

