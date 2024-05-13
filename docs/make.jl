using LocalAttributes
using Documenter

DocMeta.setdocmeta!(LocalAttributes, :DocTestSetup, :(using LocalAttributes); recursive=true)

makedocs(;
    modules=[LocalAttributes],
    authors="Akshika Rohatgi",
    sitename="LocalAttributes.jl",
    format=Documenter.HTML(;
        canonical="https://arohatgi29.github.io/LocalAttributes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/arohatgi29/LocalAttributes.jl",
    devbranch="main",
)
