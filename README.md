# LocalAttributes

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://arohatgi29.github.io/LocalAttributes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://arohatgi29.github.io/LocalAttributes.jl/dev/)
[![Build Status](https://github.com/arohatgi29/LocalAttributes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/arohatgi29/LocalAttributes.jl/actions/workflows/CI.yml?query=branch%3Amain)

Local seismic attributes measure seismic signal characteristics not instantaneously at each signal point and not globally across a data window but locally in the neighborhood of each point. We define local attributes with the help of regularized inversion and demonstrate their usefulness for measuring local frequencies of seismic signals and local similarity between different datasets. We use shaping regularization for controlling the locality and smoothness of local attributes. We return to the definition of simple data attributes to learn how to turn them from global to localized measures using linear estimation tools and shaping regularization.
