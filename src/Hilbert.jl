function hilbert(x::Vector{T}, order::Int) where T <: Real
    "digital Hilbert transform"
    n = length(x) # nt
    t, y = deepcopy(x), similar(x) # h, trace2
    c = 1/2
    c2 = c*c
    for it in order:-1:1
        y[1] = t[1] + (t[3]-2*t[2]+t[1])*c2
        y[2] = t[2] + (t[4]-3*t[2]+2*t[1])*c2        
        for i in 3:n-2
            y[i] = t[i]+(t[i+2]-2*t[i]+t[i-2])*c2
        end
        y[n-1] = t[n-1] + (t[n-3]-3*t[n-1]+2*t[n])*c2
        y[n] = t[n] + (t[n-2]-2*t[n-1]+t[n])*c2
        for i in 1:n
            t[i] = x[i] + y[i]*(2*it-1)/(2*it)
        end
    end
    y[1] = 2*(t[1]-t[2])*c
    for i in 2:n-1
        y[i] = (t[i-1]-t[i+1])*c
    end
    y[n] = 2*(t[n-1]-t[n])*c
    return y
end