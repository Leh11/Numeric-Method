using LinearAlgebra

function fatLU(A)
    U = copy(A)
    n = size(U)[1]
    L = Matrix(1.0I, n, n)
    for j in range(1, n)
        for i in range(j + 1, n)
            L[i,j] = U[i, j] / U[j, j]
            for k in range(j + 1, n)
                U[i, k] = U[i, k] - L[i, j]*U[j, k]
            end
            U[i, j] = 0
        end
    return L, U
    end
end 

A = [1 1 1;
    2 1 -1;
    2 -1 1]
L, U = fatLU(A)

L, U, P = lu(A)
