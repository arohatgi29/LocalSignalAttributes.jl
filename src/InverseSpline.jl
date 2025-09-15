function inverse_spline3(irreg::Vector{T}, coord, n::Int; 
                         d=1, o=0, ϵ=0.01) where T <: Real
    nd = length(coord)
    reg = zeros(T, n)
    A = regularization3(n, ϵ)
    for id in 1:nd
        x = (coord[id] - o)/d - 1
        i = floor(Int, x) # nearest integer less or equal to x
        w = spline3(x-i)
        j1, j2 = max(1,1-i), min(4,n-i)
        for j in j1:j2
             reg[i+j] += w[j] * irreg[id]
             A[i+j, i+j] += w[j] * w[j]
             for k in 1:j2-j
                A[i+j, i+j+k] += w[j] * w[j+k]
                A[i+j+k, i+j] += w[j] * w[j+k]
            end
        end
    end
    c = A \ reg
    trim!(c, A[band(0)], 2ϵ/3)
    reg = postfilter3(c)
    trim!(reg, A[band(0)], 2ϵ/3)
    return reg
end