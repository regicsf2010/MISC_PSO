function [h3] = vishis(rads, nbins, it, h3)
    if(it == 1)
        figure
        hold on, box on, grid on;
        xlim([0 2 * pi])
        xticks(0 : pi / 4 : 2 * pi)
%         xticklabels({'0', '\pi/2', '\pi', '3/2\pi', '2\pi'})
        xticklabels({'0\circ', '45\circ', '90\circ', '135\circ', '180\circ', '225\circ', '270\circ', '315\circ', '360\circ'})
    else
        delete(h3)
    end
    h3 = histogram(rads(1 : it, :), nbins);
    title(['i = ' num2str(it)])
    drawnow;
end

