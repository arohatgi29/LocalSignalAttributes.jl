function partial_sum(input, inter)
	n1, n2 = size(input)
	nt = n2÷inter+1
	output = zeros(eltype(input), n1, nt)
	for it in 1:nt
		for ik in 1:inter
			i2 = (it-1)*inter + ik
			if i2 > n2 
				break
			end
			for i1 in 1:n1
				output[i1, it] += input[i1, i2]
			end
		end
	end
	output /= inter
	return output
end