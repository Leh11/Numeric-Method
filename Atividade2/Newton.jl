
function newton(f, df, p0::Float64, TOL, n0::Int)
    i = 1
    #= pList = Float64[]
    fpList = Float64[] =#

    while i ≤ n0

        fp = f(p0)
        dfp = df(p0)
        #println(dfp)
        if dfp != 0
            p = p0 - (fp / dfp)
            #= push!(pList, p0)
            push!(fpList, fp)  =#
        end

        #println("(Iteração: $i \nP valor: $p \nP0 Valor $p0")
        if abs(p) < TOL
            return p
        end
        i += 1
        p0 = p
    end
    return false
    #= pList, fpList =#
end

f(y) = map(x -> cos(x) - x, y)
df(y) = map(x -> -sin(x) - 1, y)

newton(f, df, π / 4, 0.01, 5)
