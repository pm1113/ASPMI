% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Trial 1

load('../data/trial1.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI1);
x=x.*hann(length(x))';
N=length(x);
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=pow2db(xf.^2/(N*2*pi));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
axis([0 2 -100 0])
set(gca,'fontsize',axis_font_size);
title('Standard Periodogram, Trail 1','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_1_standard');

%% Trial 2

load('../data/trial2.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI2);
x=x.*hann(length(x))';
K=2048;
N=length(x);
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=pow2db(xf.^2/(N*2*pi));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(2)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
axis([0 2 -100 0])
set(gca,'fontsize',axis_font_size);
title('Standard Periodogram, Trail 2','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_2_standard');

%% Trial 3

load('../data/trial3.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI3);
x=x.*hann(length(x))';
N=length(x);
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=pow2db(xf.^2/(N*2*pi));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(3)
plot(fs*fsRRI./2,Pxx,'LineWidth',line_width);
axis([0 2 -100 0])
set(gca,'fontsize',axis_font_size);
title('Standard Periodogram, Trail 3','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_3_standard');