function local_frequency1(trace::Array, radius::Int; order=100, niter=100, dt=1.0)
    hilb = hilbert(trace; order=order)
    dtrace = deriv(trace, order)
    dhilb = deriv(hilb, order)
    n = length(trace)
    num, den = similar(trace), similar(trace)
    for i=1:n
        if i < order || i > n-order
            num[i] = den[i] = zero(eltype(trace))
        else
            num[i] = trace[i]*dhilb[i] - hilb[i]*dtrace[i]
            den[i] = trace[i]*trace[i] + hilb[i]*hilb[i]
        end
    end
    phase = smooth_division(num, den, [radius]; niter=niter)
    return phase / (2*π*dt) # convert to Hertz
end
