function [p] = init(N, DIM, RANGE, VMAX, f)
    X = initialization(N, DIM, RANGE);
    XFIT = getFitness(X, N, f);
    
    V = initialization(N, DIM, [-VMAX, VMAX]);
    G = getGrad(X, N, DIM, f);
    
    p = struct('X', X, ... % particles position
               'XFIT', XFIT, ... % fitness
               'V', V, ... % velocity
               'P', X, ...
               'PFIT', XFIT, ...
               'G', G ); % initialize gradient
end