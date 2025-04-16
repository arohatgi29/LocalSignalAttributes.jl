using LocalSignalAttributes

function local_similarity(one, two, radius)
	n = length(one)
	sim = similar(one)
	
	rat1 = smooth_division(one, two, radius)
	rat2 = smooth_division(two, one, radius)

	# make it sharper
	for i in 1:n
		p = sqrt(abs(rat1[i]*rat2[i]))
		if (rat1[i] > 0.0 && rat2[i] < 0.0 && -rat2[i] >= rat1[i]) ||
	       (rat1[i] < 0.0 && rat2[i] > 0.0 && rat2[i] >= -rat1[i])
	    	p = -p
		end
	    p += 1.0
		p *= p
		p *= p/16
		sim[i] = p
	end

	return sim
end