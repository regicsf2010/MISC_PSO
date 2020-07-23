function [ V ] = getVelocity( X, V, P, G, params)
    
    V = V + params.CC * rand * (P - X) + params.SC * rand * (G.X - X);
    
end
