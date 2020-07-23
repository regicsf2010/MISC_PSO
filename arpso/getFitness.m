function [ fit ] = getFitness( X, N, f )
    fit = zeros(1, size(X, 1));
    for i = 1 : size(X, 1)
        fit(i) = f(X(i, :));
    end
end

