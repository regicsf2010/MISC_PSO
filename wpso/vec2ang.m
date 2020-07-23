function [a, r] = vec2ang(x, y)
    q = quadrant(x, y);
    a = atan2d(y, x);
    a = (q > 2) * (360 + a) + (1 - (q > 2)) * a; % angle
    r = deg2rad(a); % radian
end

