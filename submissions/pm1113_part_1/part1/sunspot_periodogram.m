% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 f
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Sunspot Series

load sunspot.dat;
year = sunspot(:,1);
relNums = sunspot(:,2);

% length of fft
K=2048;
% no pre-processing
xf=abs(fftshift(fft([relNums' zeros(1, K-length(relNums))])));
Pxx1=pow2db(xf.^2/(length(relNums)*2*pi))';
% removing the mean
relNums_without_mean=relNums-mean(relNums);
xf=abs(fftshift(fft([relNums_without_mean' zeros(1, K-length(relNums_without_mean))])));
Pxx2=pow2db(xf.^2/(length(relNums_without_mean)*2*pi))';
% removing the trend
relNums_without_trend=detrend(relNums);
xf=abs(fftshift(fft([relNums_without_trend' zeros(1, K-length(relNums_without_trend))])));
Pxx3=pow2db(xf.^2/(length(relNums_without_trend)*2*pi))';
% log then subtract mean
relNums=relNums+0.001;
relNums_with_log=log(relNums);
relNums_with_log_without_mean=relNums_with_log-mean(relNums_with_log);
xf=abs(fftshift(fft([relNums_with_log_without_mean' zeros(1, K-length(relNums_with_log_without_mean))])));
Pxx4=pow2db(xf.^2/(length(relNums_with_log_without_mean)*2*pi))';
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs,Pxx1,fs,Pxx2,fs,Pxx3,fs,Pxx4,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
axis([0 1 -40 70])
title('Peridogram of Sunspot Series','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend('\fontsize{25}No Preprocessing','\fontsize{25}Removing Mean','\fontsize{25}Removing Trend','\fontsize{25}Log, Removing Mean')
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/sunspot_periodogram');
