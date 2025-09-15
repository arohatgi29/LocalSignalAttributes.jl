function regularization3(n, ϵ)
    "derivative regularization for cubic splines"
    A = BandedMatrix{Float64}(undef, (n, n), (3, 3))
    A[band(0)] .= 2ϵ/3
    A[band(1)] .= A[band(-1)] .= -ϵ/8
    A[band(2)] .= A[band(-2)] .= -ϵ/5
    A[band(3)] .= A[band(-3)] .= -ϵ/120
    return A
end