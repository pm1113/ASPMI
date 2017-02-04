% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 b
%% Zero-Padded Periodogram for alpha=1

N=256;
f0=0.2;
var=0;
alpha=1;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs,pow2db(xf.^2./K));
grid on;
grid minor;
axis([0 1 -60 20])
set(gca,'fontsize',axis_font_size);
title('Periodogram PSD Estimate of x(n), \alpha=1','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_1','-depsc');
end

%% Zero-Padded Periodogram for alpha=0.65

N=256;
f0=0.2;
var=0;
alpha=0.65;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(2)
plot(fs,pow2db(xf.^2./K));
grid on;
grid minor;
axis([0.30 0.50 -30 15])
set(gca,'fontsize',axis_font_size);
title('Periodogram PSD Estimate of x(n), \alpha=0.65','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_point_65','-depsc');
end

%% Zero-Padded Periodogram for alpha=0.6

N=256;
f0=0.2;
var=0;
alpha=0.6;
a1=1;
a2=1;
phi_1=0;
phi_2=0;

x=periodogram_signal(N,f0,var,alpha,a1,a2,phi_1,phi_2);

% length of fft
K=2048;
xf=abs(fftshift(fft([x zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(3)
plot(fs,pow2db(xf.^2./K));
grid on;
grid minor;
axis([0.30 0.50 -30 15])
set(gca,'fontsize',axis_font_size);
title('Periodogram PSD Estimate of x(n), \alpha=0.6','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_xn_alpha_point_60','-depsc');
end


