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
        "Tutorial" => [generate_synthetics.md],
    ],
)

deploydocs(;
    repo="github.com/arohatgi29/LocalSignalAttributes.jl",
    devbranch="main",
)
