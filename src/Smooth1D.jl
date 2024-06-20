function smooth(x::Vector{T}, nb::Int, der=false) where T <: Real
    "smoothing by triangle filtering with reflecting boundaries"
    n = length(x)
    t = zeros(T,n+2*nb)
    for i in 1:n
        xi = x[i]/(nb*nb)
        t[i] -= xi
        t[i+nb] += 2*xi
        t[i+2*nb] -= xi
    end
    doubint!(t, der)
    return fold(t, nb)
end