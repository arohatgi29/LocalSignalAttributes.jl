# LocalAttributes

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://arohatgi29.github.io/LocalAttributes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://arohatgi29.github.io/LocalAttributes.jl/dev/)
[![Build Status](https://github.com/arohatgi29/LocalAttributes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/arohatgi29/LocalAttributes.jl/actions/workflows/CI.yml?query=branch%3Amain)


# LocalAttributes.jl

## Introduction
Local attributes measure signal characteristics not instantaneously at each signal point and not globally across a data window but locally in the neighborhood of each point. We define local attributes with the help of regularized inversion and demonstrate their usefulness for measuring local frequencies of signals and local similarity between different datasets. We use shaping regularization for controlling the locality and smoothness of local attributes. We return to the definition of simple data attributes to learn how to turn them from global to localized measures using linear estimation tools and shaping regularization.


## Installation

```julia
julia> using Pkg

julia> add("LocalAttributes")

julia> using LocalAttributes
```


## Features

### conjgrad

- Conjugate-gradient algorithm for shaping regularization using `(forward::Function, adjoint::Function, shaping::Function, ϵ::Float64, d::Array, p0::Array, niter::Int)`

### smooth

- multidimensional smoothing based on triangle filter using `(x::Array, nb::Vector{Int})`


### ricker

- Creates a ricker wavelet using `(input::Array, dt::Float64, f::Float64)`

### smooth_division

- divides two signals, producing a smooth output using `(numerator::Array, denominator::Array, radius::Vector{Int}, niter::Int)`
- It treats division as inversion and regularizes the inversion using shaping regularization. 
  

