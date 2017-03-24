% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 d
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% n=30;

K=128;
n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

Pxx=fft([x zeros(1,K-length(x))])./(1*length(n));
fs=0:1/K:1-1/K;
figure(1);
plot(fs,pow2db(abs(Pxx)),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
axis([0 1 -30 5]);
title('Periodogram with n=30, K=128','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/complex_psd_n_30');

%% n=50;

K=128;
n = 0:50;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

Pxx=fft([x zeros(1,K-length(x))])./(1*length(n));
fs=0:1/K:1-1/K;
figure(2);
plot(fs,pow2db(abs(Pxx)),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
axis([0 1 -30 5]);
title('Periodogram with n=50, K=128','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/complex_psd_n_50');

%% n=70;

K=128;
n = 0:70;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

Pxx=fft([x zeros(1,K-length(x))])./(1*length(n));
fs=0:1/K:1-1/K;
figure(3);
plot(fs,pow2db(abs(Pxx)),'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
axis([0 1 -30 5]);
title('Periodogram with n=70, K=128','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/Hz)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/complex_psd_n_70');