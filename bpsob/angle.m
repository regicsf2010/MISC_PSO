function r = angle(X, OLD)
    Z = X - OLD;
    [~, r] = arrayfun(@(i) vec2ang(Z(i, 1), Z(i, 2)), 1 : size(Z, 1));
end