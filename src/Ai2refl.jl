# AI to reflectivity
function ai2refl(ai::Vector{T}) where T <: Real
    nt = length(ai)
    ref = similar(ai)
    imp1=ai[1]
    for it in 1:nt-1
	    imp2 = ai[it+1]
	    ref[it] = (imp2-imp1)/(imp2+imp1+eps(T))
	    imp1 = imp2
    end
	ref[nt] = zero(T)
    return ref
end