function v = ranking(A)
    x = size(A);
    if (x(1) ~= x(2))
        fprintf('Matrisen er ikke kvadratisk')
        return
    end
    x = x(1)
    for k=1:x
        if (A(:,k) == 0)
            fprintf('Matrisen er ikke stokastisk')
            return
        end
    end
    m = 0.1
    S = ones(size(A))/x(1)
    M = (1-m) * A + m * S
    v = null(M - eye(x(1)))
    v = abs(v/norm(v))