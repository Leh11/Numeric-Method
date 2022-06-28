using Plots

include("Newton.jl")
include("Bissection.jl")

#= função para plotar sequências de pontos
usando metodo de newton
 =#
function plotNewton(x, f, df)
    #plot(f, 0, 1, lab="y = cos(x) - x", lw=1, m=:circle)
    #plot!(df, 0, 1, lab="-sin(x) - 1", lw=0.8, m=:circle)
    plot!(x, f, lab="(pn, f(pn))", lw=3, m=:circle, c="red")

end

#função para 
f(y) = map(x -> cos(x) - x, y)
df(y) = map(x -> -sin(x) - 1, y)
x = 0.0
y = 0.0
x, y = newton(f, df, π / 4, 0.01, 5)
plotNewton(x, f, df)





#= função para plotar sequências de pontos
usando metodo de bisseção
 =#
function plotBissection(x, f)
    plot(f, 0, 1, lab="y = x³ + 4x² - 10", lw=0.3, m=:circle)
    plot!(x, f, lab="(pn, f(pn))", lw=3, m=:circle)

end


f(y) = map(x -> x^3 + 4x^3 - 10, y)
x = 0.0
y = 0.0
x, y = bissection(f, 0, 1, 0.01, 13)
plotBissection(x, f)