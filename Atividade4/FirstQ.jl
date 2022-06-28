using LinearAlgebra
function is_convergent(A, B)
    len = size(B)[1]
    for indexI in range(1, len)
        if A[indexI, indexI] != 0
            xi = abs.(B[indexI]) // abs(A[indexI, indexI])
            println("$xi ")
        else
            break
        end
    end
end

function gaus_jacobi(A, b, N::Int=100, tol::Float64=1.0e-8)
    nrows = size(A)[1]
    aux = ones(nrows) + (1.0e-4) * rand(nrows, 1)

    result = deepcopy(aux)
    iterate = 0

    while iterate < N
        iterate += 1
        Δx = b - A * result
        for i = 1:nrows
            Δx[i] = Δx[i] / A[i, i]
        end

        result += Δx
        if norm(Δx) <= tol
            return (result, iterate, false)
        end
    end
    return (result, iterate, true)
end

is_convergent(A, b)

function gauss_seidel(A, b, N::Int=100, tol::Float64=1.0e-8)
    nrows, ncols = size(A)
    aux = ones(nrows) + (1.0e-4) * rand(nrows, 1)

    result = deepcopy(aux)
    iterate = 0

    Δx = zeros(nrows, 1)
    iterate = 0

    while iterate < N
        iterate += 1
        for i = 1:nrows
            Δx[i] = b[i]
            for j = 1:ncols
                Δx[i] = Δx[i] - A[i, j] * result[j]
            end
            Δx[i] = Δx[i] / A[i, i]
            result[i] = result[i] + Δx[i]
        end

        if norm(Δx) <= tol
            return (result, iterate, false)
        end
    end
    return (result, iterate, true)
end

begin
    A = [4 -1 0 -1 0 0
        -1 4 -1 0 -1 0
        0 -1 4 0 0 -1
        -1 0 0 4 -1 0
        0 -1 0 -1 4 -1
        0 0 -1 0 -1 4]
    b = [0, 5, 0, 6, -2, 6]
    #gaus_jacobi(A, b)
    gauss_seidel(A, b)
end

begin
    A = [2 -1 1
        2 2 2
        -1 -1 2]
    b = [-1, 4, -5]
    #gaus_jacobi(A, b)
    gauss_seidel(A, b)
end

begin
    A = [4 1 -1 1
        1 4 -1 -1
        -1 -1 5 1
        1 -1 1 3]
    b = [-2, -1, 0, 1]
    #gaus_jacobi(A, b)
    gauss_seidel(A, b)
end
begin
    A = [10 -1 2 0
        -1 11 -1 3
        2 -1 10 -1
        0 3 -1 8]
    b = [6, 25, -11, 15]
    #gaus_jacobi(A, b)
    gauss_seidel(A, b)
end


begin
    A = [10 2 1
        1 5 1
        2 3 10]
    b = [7, -8, 6]
    #gaus_jacobi(A, b)
    gauss_seidel(A, b)
end
