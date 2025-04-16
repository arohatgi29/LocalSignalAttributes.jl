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
include("LocalSimilarity.jl")
include("WarpScan.jl")
include("AmplitudeBalance.jl")
include("FindMinimum.jl")
include("DynamicProgramming.jl")
include("interpolate.jl")
include("DynamicProgTrajectory.jl")
include("AutoPicking.jl")
include("PartialSum.jl")
include("InterLeave.jl")
include("LocalFrequency1D.jl")

# Exports
export conjgrad, 
       ricker, 
       smooth, 
       smooth_division,
       hilbert,
       local_frequency,
       local_similarity,
       warpscan,
       autopick          
end