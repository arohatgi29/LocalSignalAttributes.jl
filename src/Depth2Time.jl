function depth2time(image, vel, depth, nt, t0, dt) 
	nz, n2 = size(vel)
	image_t = Array{eltype(image)}(undef, nt, n2)
	time = Array{eltype(depth)}(undef, nz)
	for i2 in 1:n2
		t = 2*depth[1]/vel[1, i2]
		for iz in 1:nz
			time[iz] = t
			if iz < nz
				t += 2*(depth[iz+1]-depth[iz])/vel[iz, i2]
			end
		end
		image_t[:,i2] = inverse_spline3(image[:,i2], time, nt; d=dt, o=t0) 
	end
	return image_t
end