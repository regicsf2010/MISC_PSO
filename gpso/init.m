function [p] = init(N, DIM, RANGE, VMAX, f)
    X = initialization(N, DIM, RANGE);
    XFIT = initFitness(X, N, f);
    V = initialization(N, DIM, [-VMAX, VMAX]);
        
    p = struct('X', X, ... % particles position
               'XFIT', XFIT, ... % fitness
               'V', V, ... % velocity
               'P', X, ... % best personal
               'PFIT', XFIT); % best personal fitness
end