% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.1 b and c
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% DFT, f=20, N=100, Fs=1000, K=100

N=100;
Fs=1000;
f=20;
x=0:1/Fs:(N-1)/Fs;
y=sin(2*pi*f*x);
ydft=abs(fftshift(fft(y)));
% frequency axis in Hz
df=Fs/N;
f=-Fs/2:df:Fs/2-df;

figure(1);
s=stem(f,ydft,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('f=20, N=100, Fs=1000, K=100','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50 50 0 100]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_f_20_n_100_Fs_1000_k_100');
%% DTFT, f=20, N=100, Fs=1000, ndft=1000 [Zero-Padded]

K=1000;
N=100;
Fs=1000;c
f=20;
x=0:1/Fs:(N-1)/Fs;
y=sin(2*pi*f*x);
y=[y zeros(1,K-N)];
ydft=abs(fftshift(fft(y)));
df=Fs/(K);
f=-Fs/2:df:Fs/2-df;

figure(2);
s=stem(f,ydft,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('f=20, N=100, Fs=1000, K=1000','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50 50 0 100]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_f_20_n_100_Fs_1000_k_1000');
%% DTFT, f=24, N=100, Fs=1000, K=100

N=100;
Fs=1000;
f=24;
x=0:1/Fs:(N-1)/Fs;
y=sin(2*pi*f*x);
ydft=abs(fftshift(fft(y)));
df=Fs/N;
f=-Fs/2:df:Fs/2-df;

figure(3);
s=stem(f,ydft,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('f=24, N=100, Fs=1000, K=100','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50 50 0 100]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_f_24_n_100_Fs_1000_k_100');
%% DTFT, f=24, N=100, Fs=1000, K=1000

K=2^16;
N=100;
Fs=1000;
f=24;
x=0:1/Fs:(N-1)/Fs;
y=sin(2*pi*f*x);
y=[y zeros(1,K-N)];
ydft=abs(fftshift(fft(y)));
df=Fs/K;
f=-Fs/2:df:Fs/2-df;

figure(4);
s=plot(f,ydft,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('f=24, N=100, Fs=1000, K=65536','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50 50 0 100]);

% to super impose circles to show the points that were sampled
f=24;
x_sampled_points=0:1/Fs:(N-1)/Fs;
y_sampled_points=sin(2*pi*f*x_sampled_points);
y_sampled_points_dft=abs(fftshift(fft(y_sampled_points)));
df=Fs/N;
f=-Fs/2:df:Fs/2-df;
hold on;
plot(f,y_sampled_points_dft,'o','LineWidth',line_width*2,'MarkerSize', marker_size);
hold off;

run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_f_24_n_100_Fs_1000_k_2_to_16');