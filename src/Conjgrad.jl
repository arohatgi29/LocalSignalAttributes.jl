using LinearAlgebra

function conjgrad(forward::Function, adjoint::Function, shaping::Function, 
                  d::Array, p0::Array; ϵ=1.0, niter=1, tolerance=1.0e-7)
    "Conjugate-gradient algorithm for shaping regularization"

    p = deepcopy(p0)
    x = shaping(p)
    T = eltype(x)
    r = forward(x) .- d
    λ = T(ϵ)
    sp, sx, sr = similar(p), similar(x), similar(r)
    gnp, g0 = zero(Float64), zero(Float64)

    for iter in 1:niter
        gx = adjoint(r) - λ * x
        gp = shaping(gx) + λ * p
        gx = shaping(gp)
        gr = forward(gx)

        gn = gp ⋅ gp
        @show iter, gn

        if iter == 1
            g0 = gn
            sp = gp
            sx = gx
            sr = gr
        else
            γ = gn / g0
            β = T(gn / gnp)

            if γ < tolerance || β < tolerance
                # converged
                @show γ, β
                break
            end

            sp = gp + β * sp
            sx = gx + β * sx
            sr = gr + β * sr
        end

        gnp = gn

        α = sr ⋅ sr + λ * (sp ⋅ sp - sx ⋅ sx)
        α = -gn / α

        p += α * sp
        x += α * sx
        r += α * sr
    end

    return x
end
