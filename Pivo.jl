function sys_pivo!(A, b)
    m, n = size(A)
    for i = range(1, n)
        col = i+1:n
        k = argmax(abs.(A[i:n, i])) + i - 1
        if k != i
            A[[i, k], :] = A[[k, i], :]
            b[[i, k]] = b[[k, i]]
        end
        for j = i+1:m
            pii = A[j, i] / A[i, i]
            A[j, col] -= pii * A[i, col]
            b[j] -= pii * b[i]
            A[j, i] = 0.0
        end
    end
end


function tri!(W)
    n = size(W)[1]
    x = zeros(n)

    for i = reverse(range(1, n))
        x[i] = b[i]
        for k = i+1:n
            x[i] -= W[i, k] * x[k]
        end
        x[i] = x[i] / W[i, i]
    end
    return x
end

B = [2.0 1 1 0
    4 3 3 1
    8 7 9 5
    6 7 9 8]
b = [1.0, 2, 4, 5]


sys_pivo!(B, b)
round.(tri!(B)) 


