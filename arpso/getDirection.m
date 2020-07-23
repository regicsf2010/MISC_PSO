function [ dir ] = getDirection( dir, diversity, t )
    if(dir > 0 && diversity < t(1))
        dir = -1;
    elseif(dir < 0 && diversity > t(2))
        dir = 1;
    end
end

