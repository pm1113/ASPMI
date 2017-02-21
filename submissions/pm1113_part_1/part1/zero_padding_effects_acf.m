% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% DFT, M=10, L=20 [No Zero Padding]

M=10;
L=20;
x=acf_x(M,L);
p=abs(fftshift(fft(x)));
df=2*pi/L;
f=-pi:df:pi-df;

figure(1);
s=stem(f,p,'LineWidth',line_width);
set(s,'Marker','none');
set(gca,'fontsize',axis_font_size);
title('M=10, L=20, No Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-pi pi 0 20]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_acf_m_10_l_20');

%% DFT, M=10, L=256 [With Zero-Padding]

M=10;
L=256;
x=acf_x(M,L);
p=abs(fftshift(fft(x)));
df=2*pi/L;
f=-pi:df:pi-df;

figure(2);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('M=10, L=256, With Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-pi pi 0 20]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_acf_m_10_l_256');

%% DFT, M=128, L=256 [No Zero Padding]

M=128;
L=256;
x=acf_x(M,L);
p=abs(fftshift(fft(x)));
df=2*pi/L;
f=-pi:df:pi-df;

figure(3);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('M=128, L=256, No Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-pi pi 0 200]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_acf_m_128_l_256');

%% DTFT, M=128, L=256 [No Zero Padding]

M=128;
L=2048;
x=acf_x(M,L);
p=abs(fftshift(fft(x)));
df=2*pi/L;
f=-pi:df:pi-df;

figure(4);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('M=128, L=2048, With Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-pi pi 0 200]);
run('../utility_functions/scale_graph.m')
% graph_saving('../report/images/part1/dft_spectra_acf_m_128_l_2048');
