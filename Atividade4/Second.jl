using LinearAlgebra, Random
Random.seed!(0)
n = 20
x = range(-1, 1, length=n)
y = 1 ./ (1 .+ 15 * x.^2) + randn(n) * 0.1
real(x) = 1 ./ (1 .+ 15 * x.^2)


function quadmin(x, y, n)
    n = length(x)
    p = n
    M = zeros(p, p)
    c = zeros(p)
    for j = 1:p
        for k = 1:p
            M[j, k] = sum(n*(x[i]) * n*(x[i]) for i = 1:n)
        end
        c[j] = sum(y[i] * n*(x[i]) for i = 1:n)
    end
    β = M \ c
    h(x) = sum(n*(x) * β[j] for j = 1:p)
    return β, h
end

F = [x -> 1 / (1 + 15x^2)]
β, modelo = quadmin(x, y, 5)
r = y - modelo.(x)
SQR = norm(r)^2
plot!(modelo, extrema(x)..., c=:red, lw=2)
plot!(real, extrema(x)..., c=:blue)
title!("SQR = $SQR")

scatter(x, y)
#plot(modelo)