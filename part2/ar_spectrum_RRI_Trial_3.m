% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Determine Coefficients
clear magnitudes;

load('../data/trial3.mat');
load('../data/fsRRI.mat');

models=[2,13,35];

x=detrend(xRRI3);

% plot standard periodogram
x=x.*hann(length(x))';
N=length(x);
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=pow2db(xf.^2/(N*2*pi));
fs=-1:2/K:1-1/K;

for i = 1:length(models)
    % use aryule function to determine coefficients as well as estimated error
    [a_predicted, noise_var] = aryule(x, models(i));

    % generate model based estimate of PSD
    [magnitudes(:, i), w] = freqz(noise_var^(1/2), a_predicted, length(x),fsRRI);
    
    % create string for legend
    legend_str{1, i+1} = char(sprintf('Model - Based Method: Order %d', models(i))); 
    
end

%% Model 2

figure(1)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
hold on;
plot(w, pow2db(abs(magnitudes(:, 1)).^2), 'LineWidth', line_width);
legend({'Standard Periodogram', 'Model-Based Method'}, 'FontSize', 30);
hold off;
axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Trial 3, Order 2','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/ar_spectrum_eeg_trial_3_order_2');

%% Model 13

figure(2)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
hold on;
plot(w, pow2db(abs(magnitudes(:, 2)).^2), 'LineWidth', line_width, 'Color', [0.9290 0.6940 0.1250]);
legend({'Standard Periodogram', 'Model-Based Method'}, 'FontSize', 30);
hold off;
axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Trial 3, Order 13','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/ar_spectrum_eeg_trial_3_order_13');

%% Model 35

figure(3)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
hold on;
plot(w, pow2db(abs(magnitudes(:, 3)).^2), 'LineWidth', line_width, 'Color', [0.4940 0.1840 0.5560]);
legend({'Standard Periodogram', 'Model-Based Method'}, 'FontSize', 30);
hold off;
axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Trial 3, Order 35','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/ar_spectrum_eeg_trial_3_order_35');