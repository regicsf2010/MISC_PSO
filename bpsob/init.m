function [X, P, V, G] = init(N, D, R, f)
    % particles
    X.X = R(1) + (R(2) - R(1)) .* rand(N, D);

    X.FIT = fitness(X.X, f);
    X.OLD = X.X;
    
    % best previous positions
    P.X  = X.X;
    P.FIT = X.FIT;
    
    % velocities
    V = zeros(N, D);
%     V = ((R(2) - R(1)) / 2) .* rand(N, D);
    
    % best globlal position
    [G.FIT, i] =  min(P.FIT);
    G.X = P.X(i, :);
    
    % distances
    X.DXP = arrayfun(@(i) norm(X.X(i, :) - P.X(i, :)), 1 : N);
    X.DXG = arrayfun(@(i) norm(X.X(i, :) - G.X), 1 : N);
end