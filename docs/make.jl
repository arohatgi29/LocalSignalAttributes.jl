using LocalSeismicAttributes
using Documenter

DocMeta.setdocmeta!(LocalSeismicAttributes, :DocTestSetup, :(using LocalSiesmicAttributes); recursive=true)

makedocs(;
    modules=[LocalSeismicAttributes],
    authors="Akshika Rohatgi",
    sitename="LocalSeismicAttributes.jl",
    format=Documenter.HTML(;
        canonical="https://arohatgi29.github.io/LocalSeismicAttributes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Reference" => "reference.md",
    ],
)

deploydocs(;
    repo="github.com/arohatgi29/LocalSeismicAttributes.jl",
    devbranch="main",
)
