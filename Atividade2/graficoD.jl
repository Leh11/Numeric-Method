using Plots


function plotarD(f, a::Float64, b::Float64, Δ::Float64)
    x = collect(a:Δ:b)
    plot(x, f(x), lw = 3, m = :circle, lab="e^-x")
    #return x, y
end

f(y) = map(x -> MathConstants.e^-x, y)
a = 0.0
b = 100.0
Δ = 1.3
plotarD(f, a, b, Δ)