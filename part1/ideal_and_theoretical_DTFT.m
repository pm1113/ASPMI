% Created by Pranav Malhotra, 3 Feburary 2017
% ASPMI: Part 1, Question 1.1 a
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Ideal Magnitude Spectrum of 20Hz Sine Wave
close all;

% generating data structures
x=-50:0.001:50;
y=zeros(1,length(x));
y(x==20)=0.5;
y(x==-20)=0.5;

% plotting and configuration of plots
figure(1)
plot(x,y,'LineWidth',line_width);
grid on;
grid minor;
axis([-50, 50 -0.2 1]);
set(gca,'fontsize',axis_font_size);
title('Ideal Magnitude Spectrum of 20Hz Sine Wave','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/ideal_magnitude_spectrum_20hz_sine_wave','-depsc')
end
%% Theoretical Continuous Magnitude Spectrum of Windowed 20Hz Sine Wave

% generating data structures
x=-50:0.001:50;
y=zeros(1,length(x));
y(x==20)=0.5;
y(x==-20)=0.5;
filter=sinc(x);
w=conv(y,filter);
to_delete=(length(w)-length(x))/2;
w(1:to_delete)=[];
w(end-to_delete+1:end)=[];

% plotting and configuration of plots
figure(2)
plot(x,w,'LineWidth',line_width);
grid on;
grid minor;
axis([-50, 50 -0.2 1]);
set(gca,'fontsize',axis_font_size);
title('Theoretical Spectrum of Windowed 20Hz Sine Wave','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Magnitude', 'FontSize', y_axis_font_size);
h=gcf;
set(h,'PaperPositionMode','auto');         
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','centimeters');
set(h,'Position',[50 50 1000 1000]);
if(exist('save','var'))
    print('/Users/pranavmalhotra/ASPMI/report/images/part1/theoretical_magnitude_spectrum_windowed_20hz_sine_wave','-depsc')
end
