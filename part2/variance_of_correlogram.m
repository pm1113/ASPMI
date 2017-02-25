% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Generate random process with 2 sinewaves, f0=0.4 f1=0.8 f2=4.8, fs=5;

Fs=5;
n = 0:1/(2*Fs):10;
f0=0.4;
f1=0.8;
amplitude=1;
variance=1;
iterations=100;
pxx_biased=zeros(iterations,length(n)*2-1);

figure(1);
for i=1:iterations
    rng(i)
    w = variance.*randn(length(n),1);
    y = amplitude.*sin(2*pi*n*f0)+amplitude.*sin(2*pi*n*f1)+w';
    [~,~,pxx_biased(i,:),fs]=correlation_pranav(y,'biased');
    s=plot(fs*Fs,real(pxx_biased(i,:)),'Color',[0.3010 0.7450 0.9330],'LineWidth',line_width);
    hold on;
end
pxx_mean=mean(real(pxx_biased));
m=plot(fs*Fs,pxx_mean,'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs 0 10]);
title('Sinewaves at f=0.4, f=0.8','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/variance_correlogram_sine_waves_4_8');

figure(2);
pxx_std=std(real(pxx_biased));
m=plot(fs*Fs,pxx_std,'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs 0 3]);
title('Standard Deviation of Estimate','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/std_dev_correlogram_sine_waves_4_8');

%% Generate random process with 2 sinewaves, f0=1.2 f1=2.4, fs=5;

Fs=5;
n = 0:1/(2*Fs):10;
f0=1.2;
f1=2.4;
amplitude=1;
variance=1;
iterations=100;
pxx_biased=zeros(iterations,length(n)*2-1);

figure(3);
for i=1:iterations
    rng(i)
    w = variance.*randn(length(n),1);
    y = amplitude.*sin(2*pi*n*f0)+amplitude.*sin(2*pi*n*f1) + w';
    [~,~,pxx_biased(i,:),fs]=correlation_pranav(y,'biased');
    s=plot(fs*Fs,real(pxx_biased(i,:)),'Color',[0.3010 0.7450 0.9330],'LineWidth',line_width);
    hold on;
end
pxx_mean=mean(real(pxx_biased));
m=plot(fs*Fs,pxx_mean,'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs 0 10]);
title('Sinewaves at f=1.2 and f=2.4','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/variance_correlogram_sine_waves_1_2');

figure(4);
pxx_std=std(real(pxx_biased));
m=plot(fs*Fs,pxx_std,'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs 0 3]);
title('Standard Deviation of Estimate','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/std_dev_correlogram_sine_waves_1_2');

%% dB Plots

Fs=5;
n = 0:1/(2*Fs):10;
f0=1.2;
f1=2.4;
amplitude=1;
variance=1;
iterations=100;
pxx_biased=zeros(iterations,length(n)*2-1);

figure(5);
for i=1:iterations
    rng(i)
    w = variance.*randn(length(n),1);
    y = amplitude.*sin(2*pi*n*f0)+amplitude.*sin(2*pi*n*f1) + w';
    [~,~,pxx_biased(i,:),fs]=correlation_pranav(y,'biased');
    s=plot(fs*Fs,pow2db(real(pxx_biased(i,:))),'Color',[0.3010 0.7450 0.9330],'LineWidth',line_width);
    hold on;
end
pxx_mean=mean(real(pxx_biased));
m=plot(fs*Fs,pow2db(pxx_mean),'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs -40 20]);
title('Sinewaves at f=1.2 and f=2.4, dB','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power (dB)', 'FontSize', y_axis_font_size);
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/variance_correlogram_sine_waves_1_2_dB');

figure(6);
pxx_std=std(real(pxx_biased));
m=plot(fs*Fs,pow2db(pxx_std),'Color',[0.8500 0.3250 0.0980],'LineWidth', line_width);
hold off;
set(gca,'fontsize',axis_font_size);
axis([fs(1)*Fs fs(end)*Fs -15 5]);
title('Standard Deviation of Estimate, dB','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Power', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/std_dev_correlogram_sine_waves_1_2_dB');

