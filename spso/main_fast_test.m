close, clear, clc

%% General parameters
D = 10;
idf = 25;
faux = str2func('cec17_func');
STOPC = 1e-8;

f = @(z) faux(z', idf);
g = load('g_opt.mat'); g_opt = g.g_opt;
RANGE = [-100, 100];

%% PSO parameters
N = 20;
T = 1000;
params = struct('n', N, 'd', D, 'w', .721, 'cc', 1.193, 'sc', 1.193, 'r', RANGE);
sr = 0;

%% Main loop
[X, P, V, G] = init(N, D, RANGE, f);
tic
for i = 1 : T    
    for j = 1 : N
        V(j, :) = velocity(X.X(j, :), P.X(j, :), V(j, :), G.X, params);
        X.X(j, :) = move(X.X(j, :), V(j, :), params);
        X.FIT(j) = f(X.X(j, :));
        [P.X(j, :), P.FIT(j), G] = updates(X.X(j, :), X.FIT(j), P.X(j, :), P.FIT(j), G);       
    end
    
    X.OLD = X.X;
    
    if((G.FIT - g_opt(idf)) <= STOPC)
        sr = 1;
        break
    end
end
time = toc;
err = G.FIT - g_opt(idf);
disp(err)