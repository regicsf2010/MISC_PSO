function q = quadrant(x, y)    
    if x >= 0
        if y >= 0
            q = 1;
        else
            q = 4;
        end
    else
        if y >= 0
            q = 2;
        else
            q = 3;
        end
    end
end

