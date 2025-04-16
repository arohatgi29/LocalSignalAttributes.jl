using LinearAlgebra

function conjgrad(forward::Function, adjoint::Function, shaping::Function, ϵ::Float64, d::Array, p0::Array, niter::Int; tol=1.0e-6)
  "Conjugate-gradient algorithm for shaping regularization"
  p = deepcopy(p0)
  x = shaping(p)
  r = forward(x) .- d      
  sp, sx, sr = similar(p), similar(x), similar(r)
  g0 = gnp = zero(eltype(x))
  for iter in 1:niter
      gx = adjoint(r) - ϵ*x
      gp = shaping(gx) + ϵ*p
      gx = shaping(gp)
      gr = forward(gx)
      
      gn = gp ⋅ gp
      @show iter, gn 
      
      if iter==1
          sp, sx, sr = gp, gx, gr
    g0 = gn
      else
          β = gn/gnp
    γ = gn/g0
    if (β < tol || gn/g0 < tol)
      println("converged: β=$(β) γ=$(γ)")
      break
    end
          sp = gp + β*sp
          sx = gx + β*sx
          sr = gr + β*sr
      end
      gnp = gn
      
      α = sr ⋅ sr + ϵ*(sp ⋅ sp -  sx ⋅ sx)
      α = - gn/α
      
      p = p + α*sp
      x = x + α*sx
      r = r + α*sr
  end
  return x
end