function x = rankingapprox(A, d)
    n = size(A);
    if (n(1) ~= n(2))
        fprintf('Matrisen er ikke kvadratisk')
        return
    end
    n = n(1)
    for k=1:n
        if (A(:,k) == 0)
            fprintf('Matrisen er ikke stokastisk')
            return
        end
    end
    m = 0.1
    S = ones(size(A))/n(1)
    M = (1-m) * A + m * S
    x = ones([n(1) 1])/n(1)
    cont = 1
    while cont
        x_0 = M * x
        if (norm(x_0 - x) < d)
            cont = 0
        end
        x = x_0
    end
    x = x/norm(x)