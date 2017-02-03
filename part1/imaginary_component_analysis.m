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
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% real component of FFT
figure(1);
s=stem(f,real(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([-10 15])
set(gca,'fontsize',axis_font_size);
title('Real Component of DTFT','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_x_real','-depsc')
end

%%
% imaginary component of fft
figure(2);
s=stem(f,imag(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
set(gca,'fontsize',axis_font_size);
title('Imaginary Component of DTFT','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_x_imag','-depsc')
end

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
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% real component of FFT
figure(3);
s=stem(f,real(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([-10 15])
set(gca,'fontsize',axis_font_size);
title('Real Component of DTFT','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_z_real','-depsc')
end

%%
% imaginary component of fft
figure(4);
s=stem(f,imag(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([-10 15])
set(gca,'fontsize',axis_font_size);
title('Imaginary Component of DTFT','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_z_imag','-depsc')
end
%%
% Asymmetrical ACF, Imaginary Component Excluded from psd
figure(5);
s=stem(f,abs(real(p)),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 15])
set(gca,'fontsize',axis_font_size);
title('PSD with Imaginary Component Excluded','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/acf_z_psd_without_imag','-depsc')
end
%%
% Asymmetrical ACF, Imaginary Component Included from psd
figure(6);
s=stem(f,abs(p),'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 15])
set(gca,'fontsize',axis_font_size);
title(' PSD with Imaginary Component Included','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/acf_z_psd_with_imag','-depsc')
end