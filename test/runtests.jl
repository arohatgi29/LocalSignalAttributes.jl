using LocalSignalAttributes
using Test

@testset "LocalSignalAttributes.jl" begin

# [TEST CASE 1]:  Test case for ricker function
    input = [0, 0, 0, 1, 0, 0, 0]  
    dt = 0.1                        
    f = 10.0                       

    expected_output_ricker = [-0.003977750622246395, 0.01791785195573209,  -0.11027749899418056, 
    0.19267479532138973, -0.11027749899418057, 0.017917851955732096,-0.003977750622246393 ]
    @test ricker(input; dt, f) ≈ expected_output_ricker

# [TEST CASE 2]: Test case for conjgrad function
   forward(x) = x  
   adjoint(x) = x.^2
   shaping(x) = x  
   ϵ = 0.1         
   d = [-1, 2, 1, 1, 0, 2, 0]  
   p0 = [0, 0, 2, 0, 1, 0, 0]  
   niter = 10    
   tolerance = 1e-6  

   expected_output_conj = [-7.373967719272078, -34.70109831720396, -5.373967719272078, -7.869552947935355, 
                           -6.373967719272078,  -34.70109831720396, 0.0]

   @test conjgrad(forward, adjoint, shaping, d, p0; ϵ, niter, tolerance) ≈ expected_output_conj

# [TEST CASE 3]: Test for smooth function
   input_smooth = [1 2 3; 4 5 6; 7 8 9]
   nb = [1, 1]
   expected_output_smooth = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]
   output_smooth = smooth(input_smooth, nb)
   @test output_smooth == expected_output_smooth

# [TEST CASE 4]: Test for Smooth Division function
   numerator = [1.0, 2.0, 3.0, 4.0]
   denominator = [0.1, 0.2, 0.3, 0.4]
   radius = [5]
   niterations = 10
   expected_output_smooth_division = [9.99999999483288, 10.00000001181633, 9.999999990811466, 10.000000002537154]
   output_smooth_division = smooth_division(numerator, denominator, radius; niterations)
   @test output_smooth_division ≈ expected_output_smooth_division atol=1e-6

# [TEST CASE 5]: Test for Hilbert
   time= range(start=-0.8, step=0.004, length=10)
   signal = cos.(10*π*time .* (1 .+ 0.5*time));
   order = 200

   expected_output_hilbert = 
   [-0.2874437040916611
    -0.2885828660794889
    -0.29088594524740863
    -0.2936094264330329
    -0.2967589011785119
    -0.29994399158363105
    -0.30316175842461224
    -0.30600529028484935
    -0.30846513336674164
    -0.30970403176420547]
 
    output_hilbert = hilbert(signal; order)
    @test output_hilbert ≈ expected_output_hilbert atol=1e-6

end