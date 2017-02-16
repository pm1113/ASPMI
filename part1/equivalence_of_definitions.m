% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Short Signal Comparison

N=1;
K=2048;
x=bartlett(N)';

% length of fft
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=xf.^2/(N*2*pi);
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs,Pxx,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Using FFT','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_1');

% calculating Periodogram using acf
x_acf=xcorr(x,'unbiased');
[~,I] = max(abs(x_acf));
x_acf=[x_acf(I:end) zeros(1,K-(2*N-1)) fliplr(x_acf(I+1:end))];
Pxx=abs(fftshift(fft(x_acf)))./(2*pi);
fs=-1:2/K:1-1/K;

figure(2)
plot(fs,Pxx,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Using ACF','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_1');

%% Long Signal Comparison

K=2048;
N=512;
x=ones(1,N);

% length of fft
xf=abs(fftshift(fft([x zeros(1, K-N)])));
Pxx=xf.^2/(N*2*pi);
fs=-1:2/K:1-1/K;

% plot periodogram
figure(3)
plot(fs,Pxx,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Using FFT','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_1');

% calculating Periodogram using acf
x_acf=xcorr(x,'unbiased');
one_sided_acf=x_acf(N:end);
x_acf=[x_acf(N:end) zeros(1,K-(2*length(one_sided_acf)-1)) fliplr(x_acf(N+1:end))];
Pxx=abs(fftshift(fft(x_acf)))./(2*pi);
fs=-1:2/length(Pxx):1-1/length(Pxx);

figure(4)
plot(fs,Pxx,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Using ACF','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_1');


