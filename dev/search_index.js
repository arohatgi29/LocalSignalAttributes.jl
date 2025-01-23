var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = LocalSignalAttributes","category":"page"},{"location":"#LocalSignalAttributes","page":"Home","title":"LocalSignalAttributes","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for LocalSignalAttributes.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Local attributes measure signal characteristics not instantaneously at each signal point and not globally across a data window but locally in the neighborhood of each point. We define local attributes with the help of regularized inversion and demonstrate their usefulness for measuring local frequencies of signals and local similarity between different datasets. We use shaping regularization for controlling the locality and smoothness of local attributes. We return to the definition of simple data attributes to learn how to turn them from global to localized measures using linear estimation tools and shaping regularization.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"julia> using Pkg\n\njulia> Pkg.add(\"LocalSignalAttributes\")","category":"page"},{"location":"Tutorial/generate_synthetics/#Generating-Synthetics-with-the-LocalSignalAttributes.jl-Package","page":"Generate Synthetics","title":"Generating Synthetics with the LocalSignalAttributes.jl Package","text":"","category":"section"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"The LocalSignalAttributes.jl package provides tools to generate synthetic seismic signals. This guide demonstrates how to generate a Ricker wavelet using the ricker function and visualize it.","category":"page"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"","category":"page"},{"location":"Tutorial/generate_synthetics/#Function:-ricker","page":"Generate Synthetics","title":"Function: ricker","text":"","category":"section"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"ricker(input::Array; dt=1.0, f=0.2)\n\nThe ricker function generates a Ricker wavelet (commonly used in seismic studies) from an input array.\nParameters:\ninput::Array: Input array (e.g., spike signal).\ndt=1.0: Time sampling interval in seconds (default = 1.0).\nf=0.2: Dominant frequency of the Ricker wavelet in Hz (default = 0.2).","category":"page"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"Below is an example of how to use the ricker function to generate a Ricker wavelet from a spike signal and plot it using the Plots.jl library.","category":"page"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"using LocalSignalAttributes\nusing Plots\n\n# Define parameters\nnt = 201               # Number of time samples\ndt = 0.004             # Time sampling interval (seconds)\n\n# Create a spike signal (impulse in the middle)\nspike = zeros(Float32, nt)\nspike[1 + (nt - 1) ÷ 2] = one(Float32)\n\n# Generate time axis\nt = range(start=0, step=dt, length=nt)\n\n# Generate the Ricker wavelet\nricker1 = ricker(spike; dt=dt, f=25.0)\n\n# Plot the Ricker wavelet\nplot(t, ricker1, xlabel=\"Time (s)\", ylabel=\"Amplitude\", lw=2, legend=\"Ricker Wavelet\")\n","category":"page"},{"location":"Tutorial/generate_synthetics/#Output:","page":"Generate Synthetics","title":"Output:","text":"","category":"section"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"The plot will display the Ricker wavelet with its amplitude versus time, providing an intuitive visualization of this synthetic signal.","category":"page"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"(Image: Ricker Wavelet)","category":"page"},{"location":"Tutorial/generate_synthetics/#Generating-Toy-Seismic-Synthetic-(A-Flat-Event)","page":"Generate Synthetics","title":"Generating Toy Seismic Synthetic (A Flat Event)","text":"","category":"section"},{"location":"Tutorial/generate_synthetics/#Code:","page":"Generate Synthetics","title":"Code:","text":"","category":"section"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"using LocalSignalAttributes\nusing Plots\n\n# Generate a Ricker wavelet\nnt = 201               # Number of time samples\ndt = 0.004             # Time sampling interval (seconds)\nspike = zeros(Float32, nt)\nspike[1 + (nt - 1) ÷ 2] = one(Float32)\nt = range(start=0, step=dt, length=nt)\nricker1 = ricker(spike; dt=dt, f=25.0)\n\n# Create a flat event (multiple identical traces)\nntraces = 4096\ntraces = repeat(ricker1, 1, ntraces)\n\n# Add noise to the flat event\nnoisy_traces = traces .+ randn(size(traces)) * 0.1\n# noisy_traces = traces  # Uncomment to visualize without noise\n\n# Plot the noisy flat event as a heatmap\nheatmap(1:ntraces, t, noisy_traces, \n        yflip=true, cmap=:grays, \n        title=\"Input\", ylabel=\"Time (s)\", xlabel=\"Trace\")","category":"page"},{"location":"Tutorial/generate_synthetics/","page":"Generate Synthetics","title":"Generate Synthetics","text":"(Image: Seismic Synthetic with one flat event)","category":"page"}]
}
