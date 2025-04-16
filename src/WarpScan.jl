using LocalSignalAttributes

function warpscan(inp, oth, time, gamma; radius=[1,1,1])
	n1, n2 = size(inp)
	ng = length(gamma)
	
	warp = zeros(eltype(inp), n1, ng, n2)
	other = similar(warp)
	
	for i2 in 1:n2 # loop over traces
		intp = cubic_spline_interpolation(time, inp[:, i2])
		for ig in 1:ng # loop over stretch/squeeze
			for i1 in 1:n1
				τ = time[i1]*gamma[ig]
				if time[1] <= τ <= time[n1]
					warp[i1, ig, i2] = intp(τ)
				end
				other[i1, ig, i2] = oth[i1, i2]
			end
		end
	end

	return local_similarity(warp, other, radius)
end