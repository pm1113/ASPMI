% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.1 b and c
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% DTFT, f=20, N=100, Fs=1000, K=100

% length of sequence
N=100;
% sampling frequence
Fs=1000;
% frequency of sine wave
f=20;
% generate x-axis
x=0:1/Fs:(N-1)/Fs;
% generate sine wave
y=sin(2*pi*f*x);
% calculate power spectrum 
p=abs(fftshift(fft(y)));
% frequency resolution
df=Fs/N;
% generate frequency vector
f=-Fs/2:df:Fs/2-df;

figure(1);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 100])
set(gca,'fontsize',axis_font_size);
title('DFT Spectra, f=20, N=100, Fs=1000, K=100','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_f_20_n_100_Fs_1000_k_100','-depsc')
end
%% DTFT, f=20, N=100, Fs=1000, K=1000 [Zero-Padded]

% length of sequence
N=100;
% sampling frequence
Fs=1000;
% frequency of sine wave
f=20;
% generate x-axis
x=0:1/Fs:(N-1)/Fs;
% generate sine wave
y=sin(2*pi*f*x);
% zero pad the sequence
y=[y zeros(1,900)];
% calculate power spectrum 
p=abs(fftshift(fft(y)));
% frequency resolution
df=Fs/(N*10);
% generate frequency vector
f=-Fs/2:df:Fs/2-df;

figure(2);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 100])
set(gca,'fontsize',axis_font_size);
title('DFT Spectra, f=20, N=100, Fs=1000, K=1000','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_f_20_n_100_Fs_1000_k_1000','-depsc')
end
%% DTFT, f=24, N=100, Fs=1000, K=100

% length of sequence
N=100;
% sampling frequence
Fs=1000;
% frequency of sine wave
f=24;
% generate x-axis
x=0:1/Fs:(N-1)/Fs;
% generate sine wave
y=sin(2*pi*f*x);
% calculate power spectrum 
p=abs(fftshift(fft(y)));
% frequency resolution
df=Fs/N;
% generate frequency vector
f=-Fs/2:df:Fs/2-df;

figure(3);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 100])
set(gca,'fontsize',axis_font_size);
title('DFT Spectra, f=24, N=100, Fs=1000, K=100','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_f_24_n_100_Fs_1000_k_100','-depsc')
end
%% DTFT, f=24, N=100, Fs=1000, K=1000

% length of sequence
N=100;
% sampling frequence
Fs=1000;
% frequency of sine wave
f=24;
% generate x-axis
x=0:1/Fs:(N-1)/Fs;
% generate sine wave
y=sin(2*pi*f*x);
% zero pad the sequence
y=[y zeros(1,900)];
% calculate power spectrum 
p=abs(fftshift(fft(y)));
% frequency resolution
df=Fs/(N*10);
% generate frequency vector
f=-Fs/2:df:Fs/2-df;

figure(4);
s=stem(f,p,'LineWidth',line_width);
set(s, 'Marker', 'none');
grid on;
grid minor;
ylim([0 100])
set(gca,'fontsize',axis_font_size);
title('DFT Spectra, f=24, N=100, Fs=1000, K=1000','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/dft_spectra_f_24_n_100_Fs_1000_k_1000','-depsc')
end