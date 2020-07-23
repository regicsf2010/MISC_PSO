% clear, clc, close
function [err, sr, time, i] = main(idf, T, D, STOPC)
%% Parameters
% DIM = 10;
% FNAME = 'levi';
% RANGE = [-10, 10];
faux = str2func('cec17_func');
f = @(z) faux(z', idf);
g = load('g_opt.mat'); g_opt = g.g_opt;
RANGE = [-100, 100];

%PSO parameters
N = 20;
% MAXITER = 5000;
% STOPC = 1e-10;
k = 1;
DT = 1e-6;
IWMAX = .9; IWMIN = .4;
params = struct('IW', IWMAX, 'CC1', 2, 'SC1', 2, 'SC2', 2.1, 'GC', 2.1);
% dir = 1;

%% Main iteration
L = norm(ones(1, D) * (RANGE(2) - RANGE(1))); % diagonal length of the space
VMAX = k * (RANGE(2) - RANGE(1)) / 2; % maximum velocity
iw = IWMAX - (1:T) * (IWMAX - IWMIN) / T;
p = init(N, D, RANGE, VMAX, f);
G = getBestGlobal(p);
diversity = getDiversity(p.X, L, N);
sr = 0;

tic
for i = 1 : T
    
    p.G = getGrad(p.X, N, D, f);
    p.G = truncGrad(p.G, VMAX);
    
    p.V = getVelocity(p.X, p.V, p.P, p.G, G, params, diversity, DT, N, D);
    p.V = truncVel(p.V, VMAX);
    
    p.X = p.X + p.V;
    p.X = truncSpace(p.X, RANGE);
    
    p.XFIT = getFitness(p.X, N, f);
    [p.P, p.PFIT, G] = updateBest(p.X, p.XFIT, p.P, p.PFIT, G);    
    
    diversity = getDiversity(p.X, L, N);
    params.IW = iw(i);

    if((G.XFIT - g_opt(idf)) <= STOPC)
        sr = 1;
        break
    end
end
time = toc;
err = G.XFIT - g_opt(idf);
end
