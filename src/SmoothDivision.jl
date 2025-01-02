const DEFAULT_ϵ = 1.0
const DEFAULT_TOLERANCE = 1.0e-7
const DEFAULT_NITER = 100

function smooth_division(numerator::Array, denominator::Array, radius::Vector{Int}; 
                        niter=DEFAULT_NITER, ϵ=DEFAULT_ϵ, tolerance=DEFAULT_TOLERANCE)
    n = length(numerator)
    p0 = similar(numerator)
    fill!(p0, zero(eltype(p0)))
    # normalization
    norm = denominator ⋅ denominator
    if norm == 0.0
        return zeros(n, eltype(numerator))
    end
    norm = sqrt(n / norm)
    @show norm
    # weighting function
    weight = x -> x .* denominator .* norm
    return conjgrad(weight, weight, x -> smooth(x, radius), numerator * norm, p0; 
                    ϵ=ϵ, niter=niter, tolerance=tolerance)
end