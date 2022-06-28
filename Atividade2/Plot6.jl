include("Bissection.jl")
include("Newton.jl")

function plotF(x, y, f, a, b, lab)
    plot(f, a, b, lab="$lab", lw=0.5, m=:circle, c="green")
    plot!(x, y, lab="(pn, f(pn))", lw=3, m=:circle, c="red")
end
# questão 6

# a) para método de newton
begin
    f(y) = map(x -> cos(exp(x) - 2) - exp(x) + 2, y)
    df(y) = map(x -> -exp(x) - exp(x) * sin(exp(x) - 2), y)
    lab = "cos(exp(x) - 2) - exp(x) + 2"
    a, b = 0.5, 1.5
    x = y = 0.0
    x, y = newton(f, df, 1.1, 0.1, 5)
    print("Valor P: $(x[end])")
    plotNewton(x, y, f, a, b, lab)
end
#a) para método de bisseção
begin
    f(y) = map(x -> cos(exp(x) - 2) - exp(x) + 2, y)
    df(y) = map(x -> -exp(x) - exp(x) * sin(exp(x) - 2), y)
    lab = "cos(exp(x) - 2) - exp(x) + 2"
    a, b = 0.5, 1.5
    x = y = 0.0
    x, y = bissection(f, a, b, 0.1, 9)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 

#b) para método de newton
begin
    f(y) = map(x -> x^2 - 2x + 4 - log(x), y)
    df(y) = map(x -> 2x - 2 - (1 / x), y)
    lab = "x^2 - 2x + 4 - log(x)"
    a, b, p0, TOL = 1, 2, 1.5, 0.021
    #x = y = 0.0
    #x, y = newton(f, df, p0, TOL, 5)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 

#b) para método de bissection
begin
    f(y) = map(x -> x^2 - 2x + 4 - log(x), y)
    df(y) = map(x -> 2x - 2 - (1 / x), y)
    lab = "x^2 - 2x + 4 - log(x)"
    a, b, TOL = 1, 2, 1.5, 0.021
    x = y = 0.0
    x, y = bissection(f, a, b, TOL, 9)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 

#c) para método de newton
begin
    f(y) = map(x -> 2x * cos(2x) - (x + 1)^2, y)
    df(y) = map(x -> -2x + 2(-2x * sin(2x) + cos(2x)) - 2, y)
    lab = "2x*cos(2x) - (x + 1)^2"
    a, b, p0, TOL = -3, -2, -1.0, 0.00021
    x = y = 0.0
    x, y = newton(f, df, p0, TOL, 10)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end


#c) para método de bissection
begin
    f(y) = map(x -> 2x * cos(2x) - (x + 1)^2, y)
    df(y) = map(x -> -2x + 2(-2x * sin(2x) + cos(2x)) - 2, y)
    lab = "2x*cos(2x) - (x + 1)^2"
    a, b, p0, TOL = -3.0, -2.0, -1.5, 0.00468
    x = y = 0.0
    x, y = bissection(f, a, b, TOL, 13)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 

#d) para método de newton
begin
    f(y) = map(x -> x - 0.8 - 0.2sin(x), y)
    df(y) = map(x -> 1 - 0.2cos(x), y)
    lab = "x - 0.8 - 0.2sen(x)"
    a, b, p0, TOL = 0, π/2, π/4, 0.00034
    x = y = 0.0
    x, y = newton(f, df, p0, TOL, 10)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 


#d) para método de bissection
begin
    f(y) = map(x -> x - 0.8 - 0.2sin(x), y)
    df(y) = map(x -> 1 - 0.2cos(x), y)
    lab = "x - 0.8 - 0.2sen(x)"
    a, b, TOL = 0, π / 2, 0.00034
    x = y = 0.0
    x, y = bissection(f, a, b, TOL, 13)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end 

#d) para método de bissection
begin
    f(y) = map(x -> x^3 - 25, y)
    df(y) = map(x -> 2x, y)
    lab = "x^3 - 25"
    a, b, TOL = 2.5, 3, 0.0045
    x = y = 0.0
    x, y = bissection(f, a, b, TOL, 13)
    print("Valor P: $(x[end])")
    plotF(x, y, f, a, b, lab)
end



