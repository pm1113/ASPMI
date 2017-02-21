% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 b
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Generating Barlett Window For N=128, linear scales

K=2048;
N=256;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(1)
plot(fs,bwf,'LineWidth',line_width);
hold on;
plot(fs,y,'LineWidth',line_width);
hold off;
axis([-1/4 1/4 0 1])
set(gca,'fontsize',axis_font_size);
title('Bartlett Window, Linear, N=128','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/bartlett_window_N_128_linear');

%% Generating Barlett Window For N=128, dB scales

K=2048;
N=128;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(2)
plot(fs,mag2db(bwf),'LineWidth',line_width);
hold on;
plot(fs,mag2db(y),'LineWidth',line_width);
hold off;
axis([-1/2 1/2 -100 10])
set(gca,'fontsize',axis_font_size);
title('Bartlett Window, Log, N=128','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude (dB)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/bartlett_window_N_128_dB');

%% Generating Barlett Window For N=512, linear scales

K=2048;
N=512;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(3)
plot(fs,bwf,'LineWidth',line_width);
hold on;
plot(fs,y,'LineWidth',line_width);
hold off;
axis([-1/4 1/4 0 1])
set(gca,'fontsize',axis_font_size);
title('Bartlett Window, Linear, N=512','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/bartlett_window_N_512_linear');

%% Generating Barlett Window For N=512, dB scales

K=2048;
N=512;
bw=bartlett(N);
bwf=abs(fftshift(fft([bw' zeros(1,K-N)])));
% normalise
bwf=bwf./max(bwf);
fs=-1:2/K:1-1/K;

% find 3db point
% for mag spec, half power point occurs at 1/root(2);
y=ones(1,length(fs))./sqrt(2);

figure(4)
plot(fs,mag2db(bwf),'LineWidth',line_width);
hold on;
plot(fs,mag2db(y),'LineWidth',line_width);
hold off;
axis([-1/2 1/2 -100 10])
set(gca,'fontsize',axis_font_size);
title('Bartlett Window, Log, N=512','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Magnitude (dB)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part1/bartlett_window_N_512_dB');
