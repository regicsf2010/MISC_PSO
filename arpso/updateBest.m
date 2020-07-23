function [P, PFIT, G] = updateBest( X, XFIT, P, PFIT, G )
    idx = XFIT < PFIT;    
    P(idx, :) = X(idx, :); % update best local position
    PFIT(idx) = XFIT(idx); % update best local fitness
    
    [vB, idB] = min(XFIT);    
    if(vB < G.XFIT) % update best global fitness and position
        G.X = X(idB, :);
        G.XFIT = vB;        
    end    
end

