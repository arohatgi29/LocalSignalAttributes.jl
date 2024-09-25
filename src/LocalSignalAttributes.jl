module LocalSignalAttributes

# Imports
using FFTW
using LinearAlgebra

# Includes
include("Conjgrad.jl")
include("Doubleint.jl")
include("Fold.jl")
include("Ricker.jl")
include("Smooth.jl")
include("Smooth1D.jl")
include("SmoothDivision.jl")
include("Hilbert.jl")

# Exports
export conjgrad, 
       ricker, 
       smooth, 
       smooth_division

end