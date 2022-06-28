
#= definição de funções =#
begin
    f1(t) = map(x -> cos(x), t)
    f2(t) = map(x -> x^2, t)
    f3(t) = map(x -> -exp(x) - exp(x) * sin(exp(x) - 2), t)
    f4(t) = map(x -> (x^2)*exp(x^2), t)
    f5(t) = map(x -> 3*sin(x).^3, t)
end


#= Questão 3
    a) dado f(a) -> retorna valor de f no ponto
=#
function valueoF(f, a)
    return f(a)
end

#= funçao para plotar grafico de f, no [a, b]
dos pontos sample [...] =#
function plotF(f, a, b, sample)
    x = []
    push!(x, a)
    [push!(x, indexI) for indexI in sample]
    push!(x, b)

    plot!(x, f, lw=0.5, m=:circle, c="green")
end

function sympson(f, a, b, n)
    h = (b - a) / (2 * n)
    aux = LinRange(0, π, 2 * n + 1)
    y = aux[1]
    for indexI in range(1, n - 1)
        y = y + 2 * f(aux[2*indexI+1])
    end
    for indexI in range(1, n)
        y = y + 4 * f(aux[2*indexI])
    end

    y = y + f(aux[2*n+1])

    return (h * y / 3)
end

function apximate_df()
    
end


U = [1, 2, 3, 6, 12, 24, 48, 96]
for i in U
    v = sympson(f5, π, 4, i)
    println("$v -> $(round(v))")
end

