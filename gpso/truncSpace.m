function [ X ] = truncSpace( X, r)    
    
%% Position
    iddown = X < r(1);
    idup = X > r(2);

%     X(iddown) = 2 * r(1) - X(iddown);
%     X(idup) = 2 * r(2) - X(idup);    
    
    X(iddown) = r(1);
    X(idup) = r(2);

end

