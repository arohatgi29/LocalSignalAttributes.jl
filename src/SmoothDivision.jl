function smooth_division(numerator::Array, denominator::Array, radius::Vector{Int}; niter=100)
    n = length(numerator)
    p0 = similar(numerator)
    fill!(p0, zero(eltype(p0)))
    # normalization
    norm = denominator ⋅ denominator
    if norm == 0.0
        return p0
    end
    norm = sqrt(n/norm)
    @show norm
    # weighting function
    weight(x) = x .* denominator * norm
    return conjgrad(weight, weight, x -> smooth(x, radius), numerator * norm, p0; ϵ=1.0, niter=niter, tolerance=1.0e-7)
end 
