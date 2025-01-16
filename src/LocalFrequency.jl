using LocalSignalAttributes

function local_frequency(section::Array, radius::Vector{Int}; order=100, niter=100, dt=1.0)
    n, n2 = ndims(section) == 1 ? (length(section), 1) : size(section)
    num, den = similar(section), similar(section)
    for i2 in 1:n2
        trace = section[:,i2]
        hilb = hilbert(trace; order)
        dtrace = deriv(trace; order)
        dhilb = deriv(hilb; order)
        for i=1:n
            if i < order || i > n-order
                num[i,i2] = den[i,i2] = zero(eltype(trace))
            else
                num[i,i2] = trace[i]*dhilb[i] - hilb[i]*dtrace[i]
                den[i,i2] = trace[i]*trace[i] + hilb[i]*hilb[i]
            end
        end
    end
    phase = smooth_division(num, den, radius; niter)
    return phase / (2*π*dt) # convert to Hertz
end