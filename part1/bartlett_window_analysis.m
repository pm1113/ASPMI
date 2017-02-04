% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 b
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Generating Barlett Window For N=128, linear scales

N=128;
K=2048;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(1)
% hold on;
plot(fs,bwf);
% plot(fs,y);
% hold off;
grid on;
grid minor;
axis([-1/4 1/4 0 1])
set(gca,'fontsize',axis_font_size);
title('Magnitude Spectrum of Bartlett Window, N=128','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
% if(exist('save','var'))
%     print('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_window_N_128_linear','-depsc');
% end

%% Generating Barlett Window For N=128, dB scales

N=128;
K=2048;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(2)
% hold on;
plot(fs,mag2db(bwf));
% plot(fs,mag2db(y));
% hold off;
grid on;
grid minor;
axis([-1/2 1/2 -100 10])
set(gca,'fontsize',axis_font_size);
title('Magnitude Spectrum of Bartlett Window, N=128','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude (dB)', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
% if(exist('save','var'))
%     print('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_window_N_128_dB','-depsc');
% end

%% Generating Barlett Window For N=512, linear scales

N=512;
K=2048;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(3)
% hold on;
plot(fs,bwf);
% plot(fs,y);
% hold off;
grid on;
grid minor;
axis([-1/4 1/4 0 1])
set(gca,'fontsize',axis_font_size);
title('Magnitude Spectrum of Bartlett Window, N=512','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
% if(exist('save','var'))
%     print('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_window_N_512_linear','-depsc');
% end

%% Generating Barlett Window For N=512, dB scales

N=512;
K=2048;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(4)
% hold on;
plot(fs,mag2db(bwf));
% plot(fs,mag2db(y));
% hold off;
grid on;
grid minor;
axis([-1/2 1/2 -100 10])
set(gca,'fontsize',axis_font_size);
title('Magnitude Spectrum of Bartlett Window, N=512','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude (dB)', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
% if(exist('save','var'))
%     print('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_window_N_512_dB','-depsc');
% end



