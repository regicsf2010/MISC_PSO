function [ G ] = getGrad( X, N, D, f )
    G = zeros(size(X));
    for i = 1 : size(X, 1)
        G(i, :) = getGradient(X(i, :), f);
    end
end

