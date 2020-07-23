function [x] = h_function(c, r)
%% Return a multidimensional point inside a hypersphere defined by
% c: center
% r: radius

    z = randn(1, length(c));
    z = z ./ norm(z);
    a = rand * r;
    
    x = c + a * z;
end

