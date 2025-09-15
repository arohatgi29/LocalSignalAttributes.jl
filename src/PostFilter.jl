function postfilter3(c::Vector{T}) where T <: Real
    "convert cubic spline coefficients to function samples"
    n = length(c)
    x = similar(c)
    b0, b1 = 2/3, 1/6
    x[1] = b0*c[1] + b1*c[2] 
    for i in 2:n-1
        x[i] = b0*c[i] + b1*(c[i - 1] +  c[i + 1])
    end
    x[n] = b0*c[n] + b1*c[n-1] 
    return x
end