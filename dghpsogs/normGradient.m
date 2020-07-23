function D = normGradient(D, n)    
    for i = 1 : size(D, 1)
        D(i, :) = D(i, :) ./ norm(D(i, :));
    end
end