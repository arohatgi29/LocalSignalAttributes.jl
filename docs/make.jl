using Plus
using Documenter

DocMeta.setdocmeta!(Plus, :DocTestSetup, :(using Plus); recursive=true)

makedocs(;
    modules=[Plus],
    authors="Akshika Rohatgi",
    sitename="Plus.jl",
    format=Documenter.HTML(;
        canonical="https://arohatgi29.github.io/LocalSignalAttributes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Tutorial" => "tutorial.md",
    ],
)

deploydocs(;
    repo="github.com/arohatgi29/LocalSignalAttributes.jl",
    devbranch="main",
)
