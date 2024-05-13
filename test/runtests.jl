using LocalAttributes
using Test

@testset "LocalAttributes.jl" begin

    # Test case for ricker
    input = [0, 0, 0, 1, 0, 0, 0]  
    dt = 0.1                        
    f = 10.0                       

    expected_output_ricker = [-0.003977750622246395, 0.01791785195573209,  -0.11027749899418056, 
    0.19267479532138973, -0.11027749899418057, 0.017917851955732096,-0.003977750622246393 ]
    @test ricker(input, dt, f) ≈ expected_output_ricker

    # Test case for conjgrad
    forward(x) = x  
    adjoint(x) = x 
    shaping(x) = x  
    ϵ = 0.1         
    d = [0, 0, 0, 1, 0, 0, 0]  
    p0 = [0, 0, 0, 0, 0, 0, 0]  
    niter = 100    
    tolerance = 1e-6  

    expected_output_conj = [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
    @test conjgrad(forward, adjoint, shaping, ϵ, d, p0, niter, tolerance) ≈ expected_output_conj



end