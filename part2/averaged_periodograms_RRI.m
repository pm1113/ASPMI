% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Trial 1

load('../data/trial1.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI1);

% averaged over 200 Samples
segmentLength = 200;
noverlap = 0;
[pxx,w]= pwelch(x,hann(segmentLength),noverlap,K,fsRRI,'onesided');
figure(1);
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold on;

% averaged over 100 samples
segmentLength = 100;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4660 0.6740 0.1880]);

% averaged over 50 samples
segmentLength = 50;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4940 0.1840 0.5560]);
hold off;

axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Averaged Periodogram, Trial 1','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend({'Window Length: 200 Samples','Window Length: 100 Samples','Window Length: 50 Samples'},'FontSize', 25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_1_averaged');

%% Trial 2

load('../data/trial2.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI2);

% averaged over 200 Samples
segmentLength = 200;
noverlap = 0;
[pxx,w]= pwelch(x,hann(segmentLength),noverlap,K,fsRRI,'onesided');
figure(2);
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold on;

% averaged over 100 samples
segmentLength = 100;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4660 0.6740 0.1880]);

% averaged over 50 samples
segmentLength = 50;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4940 0.1840 0.5560]);
hold off;

axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Averaged Periodogram, Trial 2','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend({'Window Length: 200 Samples','Window Length: 100 Samples','Window Length: 50 Samples'},'FontSize', 25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_2_averaged');

%% Trial 3

load('../data/trial3.mat');
load('../data/fsRRI.mat');

x=detrend(xRRI3);

% averaged over 200 Samples
segmentLength = 200;
noverlap = 0;
[pxx,w]= pwelch(x,hann(segmentLength),noverlap,K,fsRRI,'onesided');
figure(3);
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold on;

% averaged over 100 samples
segmentLength = 100;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4660 0.6740 0.1880]);

% averaged over 50 samples
segmentLength = 50;
noverlap = 0;
[pxx,w]= pwelch(x,rectwin(segmentLength),noverlap,K,fsRRI,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',[0.4940 0.1840 0.5560]);
hold off;

axis([0 2 -100 0]);
set(gca,'fontsize',axis_font_size);
title('Averaged Periodogram, Trial 3','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
legend({'Window Length: 200 Samples','Window Length: 100 Samples','Window Length: 50 Samples'},'FontSize', 25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/eeg_trial_3_averaged');

