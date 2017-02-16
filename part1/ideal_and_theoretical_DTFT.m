% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.1 a
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Ideal Magnitude Spectrum of 20Hz Sine Wave

% generating data structures
x=-50:0.001:50;
y=zeros(1,length(x));
y(x==20)=0.5;
y(x==-20)=0.5;

% plotting and configuration of plots
figure(1)
plot(x,y,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Ideal Magnitude Spectrum','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50, 50 -0.2 1]);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/ideal_magnitude_spectrum_20hz_sine_wave');
%% Theoretical Continuous Magnitude Spectrum of Windowed 20Hz Sine Wave

% generating data structures
x=-50:0.001:50;
y=zeros(1,length(x));
y(x==20)=0.5;
y(x==-20)=0.5;

% filter ideal with sinc (FT of Rect)
filter=sinc(x);
w=conv(y,filter);
% filtering will make signal longer than x axis
% clip to make vectors same size
to_delete=(length(w)-length(x))/2;
w(1:to_delete)=[];
w(end-to_delete+1:end)=[];

% plotting and configuration of plots
figure(2)
plot(x,w,'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Theoretical Spectrum','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
axis([-50, 50 -0.2 1]);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/theoretical_magnitude_spectrum_windowed_20hz_sine_wave');