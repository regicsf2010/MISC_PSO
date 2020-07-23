function [P, PFIT, G] = updates(X, XFIT, P, PFIT, G)
    if(XFIT <= PFIT)
        P = X;
        PFIT = XFIT;
        if(PFIT <= G.FIT)
            G.X = P;
            G.FIT = PFIT;
        end
    end   
end