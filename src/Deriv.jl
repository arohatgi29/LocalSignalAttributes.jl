function deriv(x::Vector{T}; order=6) where T <: Real
    "derivative filter"
    n = length(x) # nt
    t, y = deepcopy(x), similar(x) # h, trace2
    for it in order:-1:1
        for i in 2:n-1
            y[i] = t[i]-(t[i+1]+t[i-1])/2
        end
        y[1], y[n] = y[2], y[n-1]
        for i in 1:n
            t[i] = x[i] + y[i]*it/(2*it+1)
        end
    end
    y[1] = t[2]-t[1]
    for i in 2:n-1
        y[i] = (t[i+1]-t[i-1])/2
    end
    y[n] = t[n]-t[n-1]
    return y
end