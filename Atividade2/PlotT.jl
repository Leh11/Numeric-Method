using Plots

include("Newton.jl")
include("Bissection.jl")

function plotTx(x, tn, tb)
    plot(x, tn, lab="t(x) - metodo de Newton", lw=1, m=:circle, c="red")
    plot!(x, tb, lab="t(x) - para metodo de Bisseção", lw=0.5, m=:circle, c="green")
end

#funcao definida newton e sua derivada
fn(y) = map(x -> cos(x) - x, y)
dfn(y) = map(x -> -sin(x) - 1, y)

#funcao definida para bisseção
fb(y) = map(x -> x^3 + 4x^2 - 10, y)

tn = zeros(20)
tb = zeros(20)
x = zeros(20)
TOL = 0.01

for i in range(1, 20, step=1)
    tn[i] = @elapsed begin
        newton(fn, dfn, π / 4, TOL, 5)
    end

    tb[i] = @elapsed begin
        bissection(fb, 0, 1, TOL, 13)
    end

    x[i] = TOL += 0.01
end

plotTx(x, tn, tb)
