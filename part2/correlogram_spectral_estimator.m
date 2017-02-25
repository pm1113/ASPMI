% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% WGN - Biased and Unbiased Correlogram
rng(0);

N=1024;
pxx=1;

% generate WGN
x_wgn=wgn(N,1,pxx);
[acf_biased,~,pxx_biased,~]=correlation_pranav(x_wgn,'biased');
[acf_unbiased,lag,pxx_unbiased,fs]=correlation_pranav(x_wgn,'unbiased');

figure(1)
plot(lag,acf_unbiased,lag,acf_biased,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('WGN: Autocorrelation Function','FontSize',title_font_size);
xlabel('k', 'FontSize', x_axis_font_size);
ylabel('r(k)', 'FontSize', y_axis_font_size);
axis([lag(1)-1 lag(end)+1 -1 2]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/wgn_biased_and_unbiased_estimates');

figure(2)
plot(fs,real(pxx_unbiased),fs,real(pxx_biased),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('WGN: Correlogram','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
axis([-1 1 -3 5]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/wgn_correlogram');

%% Sinewave - Biased and Unbiased Correlogram
rng(0);

N=1024;

% generate sinewace
x_sine=sin(2*pi*1:N);
[acf_biased,~,pxx_biased,~]=correlation_pranav(x_sine,'biased');
[acf_unbiased,lag,pxx_unbiased,fs]=correlation_pranav(x_sine,'unbiased');

figure(3)
plot(lag,acf_unbiased,lag,acf_biased,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Sinewave: Autocorrelation Function','FontSize',title_font_size);
xlabel('k', 'FontSize', x_axis_font_size);
ylabel('r(k)', 'FontSize', y_axis_font_size);
axis([lag(1)-1 lag(end)+1 -1 1]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/sinewave_biased_and_unbiased_estimates');

figure(4)
plot(fs,real(pxx_unbiased),fs,real(pxx_biased),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Sinewave: Correlogram','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
axis([-1 1 -2 4]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/sinewave_correlogram');

%% Filtered WGN - Biased and Unbiased Correlogram
rng(0);

N=1024;
pxx=1;

a = 1;
b = [1/4 1/4 1/4 1/4];

% generate sinewace
x_wgn=wgn(N,1,pxx);
x_filt=filter(b,a,x_wgn);
[acf_biased,~,pxx_biased,~]=correlation_pranav(x_filt,'biased');
[acf_unbiased,lag,pxx_unbiased,fs]=correlation_pranav(x_filt,'unbiased');

figure(5)
plot(lag,acf_unbiased,lag,acf_biased,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Filt WGN: Autocorrelation Function','FontSize',title_font_size);
xlabel('k', 'FontSize', x_axis_font_size);
ylabel('r(k)', 'FontSize', y_axis_font_size);
axis([lag(1)-1 lag(end)+1 -0.3 0.5]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/filt_wgn_biased_and_unbiased_estimates');

figure(6)
plot(fs,real(pxx_unbiased),fs,real(pxx_biased),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Filt WGN: Correlogram','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
axis([-1 1 -2 4]);
run('../utility_functions/scale_graph.m');
legend({'Unbiased Estimator','Biased Estimate'}, 'Fontsize', 25);
% graph_saving('../report/images/part2/filt_wgn_correlogram');

