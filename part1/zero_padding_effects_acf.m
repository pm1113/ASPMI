% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.2 a
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% DTFT, M=10, L=256 [No Zero Padding]

% length of autocovariance function
M=10;
% length of vector
L=20;
% generate x vector
x=acf_x(M,L);
% get psd of x
p=abs(fftshift(fft(x)));
% frequency resolution
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% plotting and formatting plots
figure(1);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 20])
set(gca,'fontsize',axis_font_size);
title('DTFT, M=10, L=20, No Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_m_10_l_20','-depsc')
end
%% DTFT, M=10, L=256 [With Zero-Padding]

% length of autocovariance function
M=10;
% length of vector
L=256;
% generate x vector
x=acf_x(M,L);
% get psd of x
p=abs(fftshift(fft(x)));
% frequency resolution
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% plotting and formatting plots
figure(2);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 20])
set(gca,'fontsize',axis_font_size);
title('DTFT, M=10, L=256, With Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_m_10_l_256','-depsc')
end

%% DTFT, M=128, L=256 [No Zero Padding]

% length of autocovariance function
M=128;
% length of vector
L=256;
% generate x vector
x=acf_x(M,L);
% get psd of x
p=abs(fftshift(fft(x)));
% frequency resolution
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% plotting and formatting plots
figure(3);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 200])
set(gca,'fontsize',axis_font_size);
title('DTFT, M=128, L=256, No Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_m_128_l_256','-depsc')
end
%% DTFT, M=128, L=256 [No Zero Padding]

% length of autocovariance function
M=128;
% length of vector
L=2048;
% generate x vector
x=acf_x(M,L);
% get psd of x
p=abs(fftshift(fft(x)));
% frequency resolution
df=1;
% generate frequency vector
f=-L/2:df:L/2-df;

% plotting and formatting plots
figure(4);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 200])
set(gca,'fontsize',axis_font_size);
title('DTFT, M=128, L=2048, With Zero-Padding','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_acf_m_128_l_2048','-depsc')
end