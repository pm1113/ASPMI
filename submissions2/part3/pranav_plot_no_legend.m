function pranav_plot_no_legend(title_str, x, y, axis_labels, multiplier)
    % Pre Plotting Variable Checking
    run('../utility_functions/pre_plotting_variables_checker.m')
    axis(axis_labels)
    set(gca,'fontsize',axis_font_size);
    title(title_str,'FontSize',title_font_size*multiplier);
    xlabel(x, 'FontSize', x_axis_font_size);
    ylabel(y, 'FontSize', y_axis_font_size);
    run('../utility_functions/scale_graph.m');
end