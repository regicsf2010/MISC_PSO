function [V] = velocity(X, P, V, G, params)
    % update velocities
    M1 = m_function(params);
    M2 = m_function(params);
    V = params.w * V + (params.cc * rand * M1 * (P - X)' + params.sc * rand * M2 * (G - X)')';   
end