function [c] = center(x, p, g, params)
    r1 = rand(1, params.d);
    r2 = rand(1, params.d);
    c = x + ((params.cc * r1 .* (p - x) + params.sc * r2 .* (g - x)) / 3);
end

