
function findError(x::Float64, y::Float64)
    absError = abs(x - y)
    relError = absError / abs(x)

    return absError, relError
end
print("Entre com p: ")
x = parse(Float64, readline())

print("Entre com p*: ")
y = parse(Float64, readline())


x, y = findError(x, y)
println("O erro abs: $x & rel: $y")
