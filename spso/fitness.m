function F = fitness(X, f)
    F = arrayfun(@(i) f(X(i, :)), 1 : size(X, 1));
end