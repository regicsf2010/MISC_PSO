function [ V ] = getVelocity( X, V, P, G, params, dir, n, d)
%     on = ones(1, d);
%     
%     V = params.IW * V + dir * ( ...
%         params.CC * (rand(n, 1) * on) .* (P - X) + ...
%         params.SC * (rand(n, 1) * on) .* bsxfun(@minus, G.X, X));

    V = params.IW * V + dir * ( ...
        params.CC * rand * (P - X) + ...
        params.SC * rand * (G.X - X));


end