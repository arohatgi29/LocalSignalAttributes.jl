function doubint!(x::Vector{T}, der=false) where T <: Real
    "causal and anticausal integration in place"
    n = length(x)  
    ranges = der ? (1:n, ) : (1:n, n:-1:1)
    for range in ranges
        t = zero(T)
        for i in range
            t += x[i]
            x[i] = t
        end
    end
end