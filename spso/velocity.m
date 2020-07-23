function [V] = velocity(X, P, V, G, params)
    % update velocities
    C = center(X, P, G, params);
    V = params.w * V + h_function(C, norm(C - X)) - X;   
end