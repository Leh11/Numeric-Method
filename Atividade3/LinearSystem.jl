

A = [1.0 1 1
    4 4 2
    2 1 -1]
b = [1.0, 2, 0]

A = [3.0 1 2; -1 2 1; 1 1 4]
b = A * ones(3)

B = [2.0 1 1 0;
    4 3 3 1;
    8 7 9 5;
    6 7 9 8]
b = [1.0, 2, 4, 5]


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

function resolve_tri_sup(U, c) # Ux = c
    m, n = size(U)
    if m != n
        error("Dimensões de U devem ser iguais")
    end
    x = zeros(n)
    for j = n:-1:1
        # xⱼ = (bⱼ - ∑ₖ₌ⱼ₊₁ⁿ uⱼₖ xₖ ) / uⱼⱼ
        x[j] = b[j]
        for k = j+1:n
            x[j] -= U[j, k] * x[k]
        end
        x[j] = x[j] / U[j, j]
    end
    return x
end

function gaussian!(A, b)
    m, n = size(A)
    for i in range(1, n)
        col = i+1:n
        for i in range(i + 1, m)
            pii = A[i, i] / A[i, i]
            A[i, col] -= A[i, col] * pii
            b[i] -= pii * b[i]
            A[i, i] = 0.0
        end
    end
end



#matriz positiva
function define_matriz(n)
    A = rand(n, n)
    A = 0.5 * (A + A)
    A = A + n * In
end



gaussian!(B, b)
sys_pivo!(B, b)
resolve_tri_sup(B, b)
tri!(B)