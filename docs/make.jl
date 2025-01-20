using Documenter
using LocalSignalAttributes

makedocs(
    sitename = "LocalSignalAttributes",
    format = Documenter.HTML(),
    modules = [LocalSignalAttributes]
)

deploydocs(
    repo = "<github.com/arohatgi29/LocalSignalAttributes.jl>"
)
