# automatic picking
function autopick(scan; an=1.0, gate=3, smooth=true, o2=0.0, d2=1.0, vel0=o2, radius=[1, 1])

    n = size(scan)
    if length(n) < 3
        n1, n2 = n
        n3 = 1
    else
        n1, n2, n3 = n
    end

    pick = Array{eltype(scan)}(undef, n1, n3)
    if smooth
        ampl = similar(pick)
    end

    i0 = min(max(1, round(Int, 1.0 + (vel0 - o2) / d2)), n2)

    for i3 in 1:n3
        slice = scan[:, :, i3] # 2D slice
        next, what = dynprog(i0, slice; an=an, gate=gate)
        pick[:, i3] = dynprog_traj(next, what)

        if smooth
            for i1 in 1:n1
                ct = pick[i1, i3]
                it = floor(Int, ct)

                if it >= n2
                    ampl[i1, i3] = slice[i1, n2]
                elseif it < 1
                    ampl[i1, i3] = slice[i1, 1]
                else
                    ct -= it
                    ampl[i1, i3] = slice[i1, it] * (1.0 - ct) + slice[i1, it + 1] * ct
                end
            end
        end
    end

    pick = (pick .- 1) * d2 .+ o2

    if smooth
        pick = (pick .- vel0) .* ampl
        pick = smooth_division(pick, ampl, radius) .+ vel0
    end

    return pick
end
