% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 b and c
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Imaginary Component Included in PSD

% length of autocovariance function
M=10;
% length of vector
L=128;
% generate x vector
x=acf_x(M,L);
% get psd of x
p=fftshift(fft(x));
% frequency resolution
df=2*pi/L;
% generate frequency vector
f=-pi:df:pi-df;

% real component of FFT
figure(1);
s=stem(f,real(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
ylim([-10 15]);
xlim([-pi pi]);
set(gca,'fontsize',axis_font_size);
title('Real Component of DFT','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_x_real');

%%
% imaginary component of fft
figure(2);
s=stem(f,imag(p),'LineWidth',line_width);
xlim([-pi pi]);
set(s, 'Marker', 'none');
set(gca,'fontsize',axis_font_size);
title('Imaginary Component of DFT','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m')
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_x_imag');

%% Imaginary Removed from PSD using real

% length of autocovariance function
M=10;
% length of vector
L=128;
% generate x vector
z=acf_z(M,L);
% get psd of x
p=fftshift(fft(z));
% frequency resolution
df=2*pi/L;
% generate frequency vector
f=-pi:df:pi-df;

% real component of FFT
figure(3);
s=stem(f,real(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
ylim([-10 15])
xlim([-pi pi]);
set(gca,'fontsize',axis_font_size);
title('Real Component of DFT','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m')
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_z_real');

%%
% imaginary component of fft
figure(4);
s=stem(f,imag(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
ylim([-10 15])
xlim([-pi pi]);
set(gca,'fontsize',axis_font_size);
title('Imaginary Component of DFT','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m')
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_z_imag');

%%
% Asymmetrical ACF, Imaginary Component Excluded from psd
figure(5);
s=stem(f,abs(real(p)),'LineWidth',line_width);
set(s, 'Marker', 'none');
ylim([0 15])
xlim([-pi pi]);
set(gca,'fontsize',axis_font_size);
title('PSD without Imaginary Component','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m')
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/acf_z_psd_without_imag');

%%
% Asymmetrical ACF, Imaginary Component Included from psd
figure(6);
s=stem(f,abs(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
ylim([0 15])
xlim([-pi pi]);
set(gca,'fontsize',axis_font_size);
title(' PSD with Imaginary Component','FontSize',title_font_size);
xlabel('Frequency (rad/s)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m')
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/acf_z_psd_with_imag');
