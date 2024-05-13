function smooth(x::Array, nb::Vector{Int}) 
    "multidimensional smoothing"
    y = deepcopy(x)
    # loop over dimensions
    for dim in 1:length(nb)
        y = mapslices(slice -> smooth(slice, nb[dim]), y; dims=dim)
    end
    return y
end