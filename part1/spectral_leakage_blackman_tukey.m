% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 d
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Amplitude Threshold Blackman Tukey Method, Part 1

% points of the autocovariance to consider
M=64;
N=256;
f0=0.2;
var=0;
alpha=4;
a1=1;
phi_1=0;
phi_2=0;

a2=[1,0.1,1,0.1];

figure(1)
for i=1:length(a2)

    if(i==3)
        alpha=12;
    end
    x=periodogram_signal(N,f0,var,alpha,a1,a2(i),phi_1,phi_2);
    r=xcorr(x,M,'biased');
    
    [m,index]=max(r);
    % length of fft
    K=2048;
    rxx=[r(index:end) zeros(1, K-length(r)) r(1:index-1)];
    pxx=abs(fftshift(fft(rxx)));
    fs=-1:2/K:1-1/K;
    
    subplot(2,2,i);
    plot(fs,pow2db(pxx./(2*pi)),'LineWidth',line_width);
    grid on;
    grid minor;
    axis([0.2 0.6 -40 20])
    set(gca,'fontsize',axis_font_size);
end

subplot(2,2,1);
title('a_2=1, \alpha=4','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,2);
title('a_2=0.1, \alpha=4','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,3);
title('a_2=1, \alpha=12','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,4);
title('a_2=0.1, \alpha=12','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
grid on; grid minor;
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_leakage_blackman_tukey_part_1');

%% Amplitude Threshold rect Window, Part 2

M=64;
N=256;
f0=0.2;
var=0;
alpha=4;
a1=1;
phi_1=0;
phi_2=0;

a2=[0.01,0.001,0.01,0.001];

figure(2)
for i=1:length(a2)
    
    if(i==3)
        alpha=12;
    end
    
    x=periodogram_signal(N,f0,var,alpha,a1,a2(i),phi_1,phi_2);
    r=xcorr(x,M,'biased');
    
    [m,index]=max(r);
    % length of fft
    K=2048;
    rxx=[r(index:end) zeros(1, K-length(r)) r(1:index-1)];
    pxx=abs(fftshift(fft(rxx)));
    fs=-1:2/K:1-1/K;
    
    
    subplot(2,2,i);
    plot(fs,pow2db(pxx./(2*pi)),'LineWidth',line_width);
    grid on;
    grid minor;
    xlim([0 1]);
    axis([0.2 0.6 -40 20])
    set(gca,'fontsize',axis_font_size);
end

subplot(2,2,1);
title('a_2=0.01, \alpha=4','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,2);
title('a_2=0.001, \alpha=4','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,3);
title('a_2=0.01, \alpha=12','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
subplot(2,2,4);
title('a_2=0.001, \alpha=12','FontSize',title_font_size);
xlabel('Normalised Frequency', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
grid on; grid minor;
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/periodogram_leakage_blackman_tukey_part_2');
