% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Singular Value Decomposition

load('../data/PCR/PCAPCR.mat');

[~,S,~]=svd(X);
S=diag(S(1:10,:));
[~,S_noise,~]=svd(Xnoise);
S_noise=diag(S_noise(1:10,:));

%% X

figure(1)
stem(S,'LineWidth', line_width);
axis([1 10 0 40]);
set(gca,'fontsize',axis_font_size);
title('Singular Values of X','FontSize',title_font_size);
xlabel('Index', 'FontSize', x_axis_font_size);
ylabel('Singular Value Magnitude', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/svd_x');

%% Xnoise

figure(2);
stem(S_noise,'LineWidth', line_width);
axis([1 10 0 40]);
set(gca,'fontsize',axis_font_size);
title('Singular Values of Xnoise','FontSize',title_font_size);
xlabel('Index', 'FontSize', x_axis_font_size);
ylabel('Singular Value Magnitude', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/svd_x_noise');

%% Error in Values

error=(S-S_noise).^2;

stem(error,'LineWidth', line_width);
axis([1 10 0 300]);
set(gca,'fontsize',axis_font_size);
title('Squared Errors','FontSize',title_font_size);
xlabel('Index', 'FontSize', x_axis_font_size);
ylabel('Squared Error Between Singular Values', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/squared_error_svd');
