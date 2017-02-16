% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 b
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Standard Periodogram

load('./data/EEG_Data/EEG_Data/EEG_Data_Assignment1.mat');

% Length of DFT, based on Hint of 5 DFT Samples per Hz
K=fs*10;

POz=POz-mean(POz);

% standard periodogram
[pxx,w]=periodogram(POz,rectwin(length(POz)),K,fs,'twosided');
figure(1);
plot(w,pow2db(pxx),'LineWidth',line_width);
axis([0 60 -140 -100]);
set(gca,'fontsize',axis_font_size);
title('Periodogram of EEG','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/POz_standard_periodogram');

%% Welch Periodogram

load('./data/EEG_Data/EEG_Data/EEG_Data_Assignment1.mat');

% Length of DFT, based on Hint of 5 DFT Samples per Hz
K=fs*10;

POz=POz-mean(POz);

% averaged over 10s
segmentLength = 12000;
noverlap = 0;
[pxx,w]= pwelch(POz,hamming(segmentLength),noverlap,K,fs,'twosided');
figure(2);
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold on

% averaged over 5s
segmentLength = 6000;
noverlap = 0;
[pxx,w]= pwelch(POz,hamming(segmentLength),noverlap,K,fs,'twosided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4660 0.6740 0.1880]);

% averaged over 1s
segmentLength = 1200;
noverlap = 0;
[pxx,w]= pwelch(POz,hamming(segmentLength),noverlap,K,fs,'twosided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4940 0.1840 0.5560]);
hold off;
axis([0 60 -140 -100]);
set(gca,'fontsize',axis_font_size);
title('Welch Periodogram of EEG','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend('\fontsize{25}Window Length: 10s','\fontsize{25}Window Length: 5s','\fontsize{25}Window Length: 1s');
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
% graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/POz_welch_periodogram');


%% Welch Periodogram only 1 second

load('./data/EEG_Data/EEG_Data/EEG_Data_Assignment1.mat');

% Length of DFT, based on Hint of 5 DFT Samples per Hz
K=fs*10;

POz=POz-mean(POz);

% averaged over 1s
segmentLength = 1200;
noverlap = 0;
[pxx,w]= pwelch(POz,hamming(segmentLength),noverlap,K,fs,'twosided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4940 0.1840 0.5560]);
axis([0 60 -140 -100]);
set(gca,'fontsize',axis_font_size);
title('Welch Periodogram of EEG','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend('\fontsize{25}Window Length: 1s');
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/POz_welch_periodogram_1_sec');