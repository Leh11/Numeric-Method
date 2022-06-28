
function is_convergent(A)
    stop = size(A)[1]
    for indexI in range(1, stop)
        TOL = (sum(abs.(A[indexI, :])) - abs(A[indexI, indexI])) // abs(A[indexI, indexI])
        if TOL > 1
            break
        end
        print("$TOL ")
    end
end

A = [8 1 -1;
    1 -7 2;
    2 1 9]
b = [8, -4, 12]

is_convergent(A)