function interleave(pp, ss, inter) 
	psum = partial_sum(pp, inter)
	ssum = partial_sum(ss, inter)
	return reshape(vcat(psum, ssum),
			size(pp, 1), size(psum, 2) + size(ssum, 2))
end