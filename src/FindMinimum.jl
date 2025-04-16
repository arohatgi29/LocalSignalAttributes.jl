function find_minimum(ic, nc, jc, c, prob::Vector)    
    if 1==ic
		ic += 1
		fm, f0, fp = c, prob[ic], prob[ic+1]
	elseif nc==ic
		ic -= 1
		fm, f0, fp = prob[ic-1], prob[ic], c
    else
		fm, f0, fp = prob[ic-1], c, prob[ic+1]
	end

	ic += jc
    a = fm+fp-2*f0
	
    if a <= 0.0 # /* no minimum 
		if fm < f0 && fm < fp
		    return fm, ic-1
		end 
		if fp < f0 && fp < fm
		    return fp, ic+1
		end 
		return f0, ic
	end
	
    b = 0.5*(fm-fp)
    a = b/a
	
    if a > 1.0
		return fp, ic+1
	end
    if a < -1.0
		return fm, ic-1
	end
    if f0 < 0.5*b*a
		return f0, ic
	end
	
    f0 -= 0.5*b*a
    return f0, ic+a
end