function trim(x::Vector{T}, diag::Vector, d) where T <: Real
    "trim ends"
    n = length(x)
    i = 1
    while i < n && diag[i] == d
        i += 1
    end
    x[1:i-1] .= x[i]
    i = n
    while i > 1 && diag[i] == d
        i -= 1
    end
    x[i+1:n] .= x[i]
end