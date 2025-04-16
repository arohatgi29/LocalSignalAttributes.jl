# extract trajectory
function dynprog_traj(next, what)
	n2, n1 = size(what)
	T = eltype(what)
	traj = Array{T}(undef, n1)

    # minimum at the bottom 
	c, fc = findmin(next)

    for i1 in n1:-1:1
		traj[i1]=fc
		fc = interpolate(fc, what[:,i1])
	end
	
	return traj
end