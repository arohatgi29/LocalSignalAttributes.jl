# LocalSignalAttributes

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://arohatgi29.github.io/LocalSignalAttributes.jl/dev/)
[![Build Status](https://github.com/arohatgi29/LocalSignalAttributes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/arohatgi29/LocalSignalAttributes.jl/actions/workflows/RunTest.yml?query=branch%3Amain)


# LocalSignalAttributes.jl

## Introduction
Local attributes measure signal characteristics not instantaneously at each signal point and not globally across a data window but locally in the neighborhood of each point. We define local attributes with the help of regularized inversion and demonstrate their usefulness for measuring local frequencies of signals and local similarity between different datasets. We use shaping regularization for controlling the locality and smoothness of local attributes. We return to the definition of simple data attributes to learn how to turn them from global to localized measures using linear estimation tools and shaping regularization.


## Installation

```julia
julia> using Pkg

julia> Pkg.add("LocalSignalAttributes")

julia> using LocalSignalAttributes
```

## Documentation

More information is available through the Julia package ecosystem:
https://juliahub.com/ui/Packages/LocalSignalAttributes

### hilbert

- Digital Hilbert transform using  `(x::Vector{T}, order::Int)`

