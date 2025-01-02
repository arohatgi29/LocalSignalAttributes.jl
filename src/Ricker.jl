using FFTW
 
function ricker(input::Array; dt=1.0, f=0.2)  
    # Fourier transform
    fourier = rfft(input)
    nt = length(input)
    freq = rfftfreq(nt, 1/dt)

    # Ricker wavelet
    freq = freq/f
    freq = freq .* freq
    @. fourier *= freq * exp(1 - freq)
    return irfft(fourier, nt)
end