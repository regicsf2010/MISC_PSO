function [V, dxp, dxg] = velocity(X, P, V, G, params, DXP, DXG)
    % update velocities
    dxp = h_function(X, P, params.l, DXP);
    dxg = h_function(X, G, params.l, DXG);
    
    V = params.w * V + ...
        params.cc * rand * (mvnrnd(P, dxp * params.i) - X) + ...
        params.sc * rand * (mvnrnd(G, dxg * params.i) - X);   
end