using using Interpolations

function warp1(inp, time, gamma)
	n1, n2 = size(inp)
	warped = similar(inp)
	
	for i2 in 1:n2 # loop over traces
		intp = cubic_spline_interpolation(time, inp[:, i2])
		for i1 in 1:n1
			τ = time[i1]*gamma[i1,i2]
			if time[1] <= τ <= time[n1]
				warped[i1, i2] = intp(τ)
			else
				warped[i1, i2] = zero(eltype(inp))
			end
		end
	end

	return warped
end	