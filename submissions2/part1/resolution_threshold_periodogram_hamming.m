% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 c
%% Zero-Padded Periodogram for alpha=1, with Hamming Window
N=256;
f0=0.2;
var=0;
alpha=1;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% window the singal
x=x.*hamming(N)';

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs,pow2db(xf.^2./K),'LineWidth',line_width);
axis([0.20 0.60 -80 10]);
set(gca,'fontsize',axis_font_size);
title('Windowed x(n), \alpha=1','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/periodogram_windowed_xn_alpha_1');

%% Zero-Padded Periodogram for alpha=0.80

N=256;
f0=0.2;
var=0;
alpha=0.75;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% window the singal
x=x.*hamming(N)';

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(2)
plot(fs,pow2db(xf.^2./K),'LineWidth',line_width);
axis([0.20 0.60 -60 15]);
set(gca,'fontsize',axis_font_size);
title('Windowed x(n), \alpha=0.75','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
graph_saving('../report/images/part1/periodogram_windowed_xn_alpha_point_75');

%% Zero-Padded Periodogram for alpha=0.75

N=256;
f0=0.2;
var=0;
alpha=0.70;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% window the singal
x=x.*hamming(N)';

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(3)
plot(fs,pow2db(xf.^2./K),'LineWidth',line_width);
axis([0.20 0.60 -60 15]);
set(gca,'fontsize',axis_font_size);
title('Windowed x(n), \alpha=0.70','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/periodogram_windowed_xn_alpha_point_70');
