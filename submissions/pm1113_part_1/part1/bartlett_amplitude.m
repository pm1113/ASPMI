% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 e
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Amplitude of Rect Window at 4/N and 12/N

K=2^13;
N=256;

x=rectwin(N);
xf=abs(fftshift(fft([x' zeros(1, K-N)])));
Pxx=pow2db(xf.^2./(N*2*pi));
fs=-1:2/K:1-1/K;

figure(1)
plot(fs,Pxx,'LineWidth',line_width);
axis([-0.01 0.06 -50 50]);
set(gca,'fontsize',axis_font_size);
title('Bartlett Window at 4/N and 12/N','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% define vertical lines
first=[4/N -200; 4/N 200];
second=[12/N -200; 12/N 200];
hold on;
plot(first(:,1),first(:,2), 'LineWidth', line_width);
plot(second(:,1),second(:,2),'LineWidth', line_width);
hold off;
legend('\fontsize{25}Bartlett Window', '\fontsize{25}4/N','\fontsize{25}12/N');
graph_saving('../report/images/part1/bartlett_amplitude');

