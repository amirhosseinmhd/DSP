function my_plot(x, y, figureName, plotTitle, x_label, y_label)
    if (~isvector(x) || ~isvector(y) || ~ischar(figureName)|| ~ischar(plotTitle)|| ~ischar(x_label)|| ~ischar(y_label)) 
         error('Input type is wrong!');
    end
    figure('NumberTitle','off','Name',figureName); 
    plot(x, y);
    title(plotTitle);
    xlabel(x_label);
    ylabel(y_label);
end