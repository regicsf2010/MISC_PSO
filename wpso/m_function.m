function [M] = m_function(p)
    A = -.5 + rand(p.d);
    M = p.i + p.a * (A - A');
end

