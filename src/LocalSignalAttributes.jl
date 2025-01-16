module LocalSignalAttributes

# Imports
using FFTW
using LinearAlgebra

# Includes
include("Ai2refl.jl")
include("Conjgrad.jl")
include("Deriv.jl")
include("Doubleint.jl")
include("Fold.jl")
include("Ricker.jl")
include("Smooth.jl")
include("Smooth1D.jl")
include("SmoothDivision.jl")
include("Hilbert.jl")
include("LocalFrequency.jl")

# Exports
export conjgrad, 
       ricker, 
       smooth, 
       smooth_division,
       hilbert,
       deriv,
       local_frequency     
end