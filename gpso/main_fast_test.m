% clear, clc, close 
%% Parameters
% function
D = 10;
idf = 25;
% FNAME = 'levi';
% RANGE = [-10, 10];
faux = str2func('cec17_func');
f = @(z) faux(z', idf);
g = load('g_opt.mat'); g_opt = g.g_opt;
RANGE = [-100, 100];

% PSO parameters
N = 20;
T = 5000;
STOPC = 1e-8;
k = 1;
MAXITERBFGS = 5;

params = struct('CC', 2, 'SC', 2);

%% Main iteration
L = norm(ones(1, D) * (RANGE(2) - RANGE(1))); % diagonal length of the space
VMAX = k * (RANGE(2) - RANGE(1)) / 2;
p = init(N, D, RANGE, VMAX, f);
G = getBestGlobal(p);
sr = 0;
tic
for i = 1 : T
    for j = 1 : N
        p.V(j, :) = getVelocity(p.X(j, :), p.V(j, :), p.P(j, :), G, params);
        p.V(j, :) = truncVel(p.V(j, :), VMAX);
        
        p.X(j, :) = p.X(j, :) + p.V(j, :);
        p.X(j, :) = truncSpace(p.X(j, :), RANGE); % trunc space
        
        p.XFIT(j) = f(p.X(j, :));
        [p.P(j, :), p.PFIT(j), G] = updateBest(p.X(j, :), p.XFIT(j), p.P(j, :), p.PFIT(j), G);
    end
    G = runBFGS(G, MAXITERBFGS, f);

    if((G.XFIT - g_opt(idf)) <= STOPC)
        sr = 1;
        break
    end
end
time = toc;
err = G.XFIT - g_opt(idf);
disp(err)

