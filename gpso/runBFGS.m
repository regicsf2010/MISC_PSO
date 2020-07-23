function G = runBFGS(G, maxIter, f)
    
    [g, fx] = bfgs(G.X, maxIter, f);
    if(fx < G.XFIT)
        G.X = g;
        G.XFIT = fx;
    end
    
end