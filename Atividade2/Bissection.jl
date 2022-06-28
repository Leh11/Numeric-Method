
function bissection(f, a, b, TOL, N::Int)
    fa = f(a)
    i = 1

    pList = Float64[]
    fpList = Float64[]
    while i <= N
        p = a + (b - a) / 2
        fp = f(p)

        push!(pList, p)
        push!(fpList, fp)
        #println("($i, $p, $fp)")
        if (fp == 0) || (((b - a) / 2) < TOL)

            return pList, fpList
        end
        
        i += 1
        if (fa * fp) > 0
            a = p
            fa = fp
        else
            b = p
        end
    end
end

#f(y) = map(x -> x^3 + 4x^2 - 10, y)
#bissection(f, 0, 1, 0.01, 13)


