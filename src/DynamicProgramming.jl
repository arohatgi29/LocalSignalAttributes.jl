# dynamic programming
function dynprog(i0, scan; an=1.0, gate=3)
	n1, n2 = size(scan)
	# pseudo-slowness
	weight = exp.(-scan') # transpose
	T = eltype(scan)
	dist = Array{T}(undef, n2)
	prev = similar(dist)
	next = similar(dist)
	what = similar(weight)
	prob = Array{T}(undef, 2*gate-1)
	time = similar(weight)
	
	for i2 in 1:n2
		dist[i2] = sqrt((i2-1)^2+an^2)
	end

	for i2 in 1:n2
		w = 0.5*(weight[i2,1]+weight[i0,1])
		time[i2,1] = abs(i2-i0)*w
	end
	
	for i2 in 1:n2
		w = 0.5*(weight[i2,2]+weight[i0,1])
		prev[i2] = dist[1+abs(i2-i0)]*w
		what[i2,2] = i0
		time[i2,2] = prev[i2]
	end
	
    for i1 in 3:n1
		for i2 in 1:n2
		    w = weight[i2, i1]
		    ib = max(i2-gate,0)
		    ie = min(i2+gate,n2+1)
		    c = typemax(T) # infinity
	    	ic = 0
	    	for i in ib+1:ie-1
				w2 = 0.5*(w+weight[i,i1-1])
				d = dist[1+abs(i2-i)]*w2+prev[i]
				it = i-ib
				if (d < c) 
		    		c =	d
				    ic = it
				end
				prob[it]=d
			end
	    	next[i2], what[i2, i1] = find_minimum(ic,ie-ib-1,ib,c,prob)
		end
		prev = deepcopy(next)
		time[:,i1] = prev
	end
	return next, what, time
end