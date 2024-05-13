function fold(t::Vector{T}, nb::Integer) where T <: Real 
    "reflecting boundary conditions for smoothing"
    nt = length(t)
    n = nt - 2*nb
    # copy middle
    x = t[1+nb:n+nb]
    # reflections from the right side 
    for j in nb+n:2*n:nt
        for i in 1:min(n,nt-j); x[n+1-i] += t[j+i]; end
        for i in 1:min(n,nt-j-n); x[i] += t[j+n+i]; end
    end
    # reflections from the left side
    for j in nb+1:-2*n:1
        for i in 1:min(n,j-1); x[i] += t[j-i]; end
        for i in 1:min(n,j-1-n); x[n+1-i] += t[j-i-n]; end
    end
    return x
end