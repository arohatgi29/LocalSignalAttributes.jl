To generate the synthetics using the LocalSignalAttribute package

###ricker(input::Array; dt=1.0, f=0.2)  

```julia-repl
using LocalSignalAttributes
using Plots

nt = 201
dt = 0.004
# spike in the middle
spike = zeros(Float32, nt)
spike[1 + (nt-1) ÷ 2] = one(Float32);
t = range(start=0, step=dt, length=nt)
ricker1 = ricker(spike)
plot(t, ricker1, title="Ricker Wavelet", xlabel="Time (s)")
```