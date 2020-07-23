function [x0, fx, iters] = bfgs(x0, maxIter, f)
% Broyden-Fletcher-Goldfarb-Shanno method.

% Input
% x0 - array of initial guesses
% maxIter - maximum number of iterations
% f - name of the optimized function

% Output
% x0 - array of optimized variables
% f - function value at optimum
% Iters - number of iterations

%% Start initial parameters
    n = length(x0);
    iters = 0;
    I = eye(n);
    idx = I~= 0;

    B = eye(n, n); % start with identity
    grad1 = getGradient(x0, f); % initial gradient
    grad1 = grad1';
    
    while iters < maxIter
        B(idx) = abs(B(idx)); % always minimize! abs must be used.

        S = -1 * B * grad1; % first iteration is gradient descent (-1)
        S = S' / norm(S); % normalize vector S
        
        lambda = 1e-3; % 1e-3
        lambda = linsearch(x0, lambda, S, f);
        % calculate optimum X() with the given Lambda
        d = lambda * S;
        x0 = x0 + d;
        % get new gradient
        grad2 =  getGradient(x0, f);
        grad2 = grad2';
        g = grad2 - grad1;
        grad1 = grad2;
        
        % test for convergence
        if f(x0) < 1e-5
            break;
        end

        d = d';
        x1 = g' * B * g;        
        x2 = d' * g;
        x3 = d * d';
        x4 = d * g' * B;
        x5 = B * g * d';
        
        B = B + (1 + x1 / x2) * x3 / x2 - x4 / x2 - x5 / x2; % BFGS: inverse hessian update 

        iters = iters + 1;
    end

    fx = f(x0);    
end

%% Newton-Raphison method for unidimensional function
function lambda = linsearch(X, lambda, D, f)

    MaxIt = 100;
    Toler = 1e-6;
    iter = 0;
    bGoOn = true;
    
    while bGoOn
        iter = iter + 1;
        if iter > MaxIt
%           lambda = 0;
          break
        end

        h = 0.01 * (1 + abs(lambda));
        f0 = f(X + lambda * D);
        fp = f(X + (lambda + h) * D);
        fm = f(X + (lambda - h) * D);
        deriv1 = (fp - fm) / 2 / h;
        deriv2 = (fp - 2 * f0 + fm) / h^2;
        if deriv2 == 0
          break
        end
        diff = deriv1 / abs(deriv2); % always minimize! abs must be used.
        lambda = lambda - diff;
        if abs(diff) < Toler
          bGoOn = false;
        end
    end
end