
function toDecimal(binary)
    binary = split(binary, " ")
    s = digits(parse(Int, binary[1]))[1] 
    e = digits(parse(Int, binary[2]))
    m = digits(parse(BigInt, binary[3]))
    print(eltype(s))
    𝔢 = 0
    ℯ = 0
    𝔣 = 0

    for bit in e
        𝔢 += bit * (2^ℯ)
        ℯ += 1
    end

    ℯ = 1
    for bit in reverse(m)
        if bit != 0
            𝔣 += (1/2)^ℯ
        end
        ℯ += 1
    end

    return resul::BigInt = (-1)^s * 2^(𝔢 - 1023) * (1 + 𝔣)
end

binary = readline()

println(@time toDecimal(binary))

