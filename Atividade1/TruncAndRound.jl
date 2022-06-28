
function round3(x)
    x = split(x, ".")
    fPart = reverse(digits(parse(Int, x[2])))

    if length(fPart) > 3
        if (fPart[4] > 5) || ((fPart[4] == 5) && (fPart[3] % 2 != 0))
            fPart[3] += 1
            fPart = fPart[1:3] 
        end
    end
    fPart = join(fPart)
    x = parse(Float64, x[1] * "." * fPart)
    return x
end

function round4(x)
    x = split(x, ".")
    fPart = reverse(digits(parse(Int, x[2])))

    if length(fPart) > 4
        if (fPart[5] > 5) || ((fPart[5] == 5) && (fPart[4] % 2 != 0))
            fPart[4] += 1
        end
    end
    fPart = fPart[1:4]
    fPart = join(fPart)
    x = parse(Float64, x[1] * "." * fPart)
    return x
end

function trunk3(x)
    x = split(x, ".")
    fPart = reverse(digits(parse(Int, x[2])))
    fPart = fPart[1:3]
    fPart = join(fPart)
    x = parse(Float64, x[1] * "." * fPart)
    return x
end

function trunk4(x)
    x = split(x, ".")
    fPart = reverse(digits(parse(Int, x[2])))
    fPart = fPart[1:4]
    fPart = join(fPart)
    x = parse(Float64, x[1] * "." * fPart)
    return x
end

x = readline()

println("Arredonda - 3:  $(round3(x))")
println("Arredonda - 4:  $(round4(x))")
println("Trunca - 3 : $(trunk3(x))")
println("Trunca - 4 : $(trunk4(x))")