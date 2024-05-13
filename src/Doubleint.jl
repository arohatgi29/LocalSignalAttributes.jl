function doubint!(x::Vector{T}) where T <: Real
    "causal and anticausal integration in place"
    n = length(x)  
    for range in (1:n, n:-1:1)
        t = zero(T)
        for i in range
            t += x[i]
            x[i] = t
        end
    end
end