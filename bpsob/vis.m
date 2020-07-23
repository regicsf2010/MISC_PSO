function [h1, h2] = vis(f, it, X, G, RANGE, h1, h2)
    if(it == 1)
        [X, Y] = meshgrid(RANGE(1) : .1 : RANGE(2), RANGE(1) : .1 : RANGE(2));
        l = size(X, 1);
        fxy = zeros(l, l);
        for i = 1 : l
            fxy(i, :) = arrayfun(@(j) f([X(i, j) Y(i, j)]), 1 : l);
        end
        contour(X, Y, fxy, 50);
        hold on, box on, grid on;
        xlim(RANGE), ylim(RANGE);
    else
        delete(h1), delete(h2);
    end
    
    
    h1 = plot(X(:, 1), X(:, 2), '.k', 'linewidth', 2, 'markersize', 10);
    h2 = plot(G(1, 1), G(1, 2), 'xr', 'linewidth', 2, 'markersize', 10);
    title(['i = ' num2str(it)])
    drawnow;
end

