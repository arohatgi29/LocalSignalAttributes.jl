function interpolate(f, slice)
	# linear interpolation
	n = length(slice)
    k = floor(Int, f)
	
    if (k > n-1) 
		return slice[n]
	end
    if (k < 1) 
		return slice[1]
	end

	w = f-k
    return slice[k]*(1.0-w) + slice[k+1]*w
end