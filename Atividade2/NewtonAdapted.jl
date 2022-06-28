using Random
include("Newton.jl")

Random.seed!(1234)
p0 = rand()
flag = true
while flag != false
    TOL = 1.343e-8
    f(t) = map(x -> exp(x) * sin(x + 30) + 1, t)
    df(t) = map(x -> exp(x) * sin(x + 30) + exp(x) * cos(x + 30), t)
    R = newton(f, df, p0, TOL, 5)

    if R != false
        flag = false
        print("Valor de P: $R")
    else
        Random.seed!(1234)
        p0 = rand()
    end
end

TOL = 1.343e-8
f(t) = map(x -> exp(x) * sin(x + 30) + 1, t)
df(t) = map(x -> exp(x) * sin(x + 30) + exp(x) * cos(x + 30), t)
R = newton(f, df, p0, TOL, 5)

if R != false
    flag = false
    print("Valor de P: $R")
else
    Random.seed!(1234)
    p0 = rand()
end