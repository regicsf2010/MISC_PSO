function [d] = h_function(x, y, l, d_old)
    d = norm(x - y);
    if d == 0
        d = l * d_old;
    else
        d = l * d;
    end
end

