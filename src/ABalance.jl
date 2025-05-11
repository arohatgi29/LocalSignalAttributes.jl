using LocalSignalAttributes

# amplitude balancing
function abalance(input, other, radius::Vector{Int}; order=100, niter=100)
   # compute envelops
   h_input = mapslices(trace -> hilbert(trace; order=order), input; dims=1)
   h_other = mapslices(trace -> hilbert(trace; order=order), other; dims=1)
   e_input = sqrt.(input .* input + h_input .* h_input)
   e_other = sqrt.(other .* other + h_other .* h_other)
   weight = smooth_division(e_other, e_input, radius; niter=niter)
   return input .* weight, weight
end