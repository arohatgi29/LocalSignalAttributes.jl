function smooth(x::Array, nb::Vector{Int}, der=false) 
    "multidimensional smoothing"
    y = deepcopy(x)
    # loop over dimensions
    for dim in 1:length(nb)
        y = mapslices(slice -> smooth(slice, nb[dim], der), y; dims=dim)
    end
    return y
end