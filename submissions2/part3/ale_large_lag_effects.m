% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 b
%% Showing Effects of Large Lag

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);

% model order parameter
order=5;

% algorithm parameter
mu=0.01;

% sinewave parameters
N=1000;
t=1:N;
f0=0.005;

% generate sinewave
sine = sin(2*pi*f0*t);

% noise parameter
noise_power = 1;
b=[1 0 0.5];
a=1;

% number of realisations to average results over
realisations=100;

% initalise vectors to hold values of signals
y=zeros(N,realisations);

% initialise vectors to hold predicted values of x
x_hat_delay_5=zeros(realisations,N);
x_hat_delay_25=zeros(realisations,N);

mpse=zeros(realisations,2);

for i=1:realisations
    % generated filtered noise
    w=get_noise(N,noise_power);
    filtered_noise=filter(b,a,w);

    % add filtered noise to singal
    y(:,i)=sine'+filtered_noise;
    
    delay=5;
    x_hat_delay_5(i,:) = lms_ale(y(:,i),mu,delay,order);
    mpse(i,1)=sum((sine-x_hat_delay_5(i,:)).^2)/N;
    delay=25;
    x_hat_delay_25(i,:) = lms_ale(y(:,i),mu,delay,order);
    mpse(i,2)=sum((sine-x_hat_delay_25(i,:)).^2)/N;

end

mpse_mean=mean(mpse);


%% Plotting of MPSE for Delay of 5, Averaged Over 100 Realisations
figure(1)
for i=1:10
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:10
    h2=plot(x_hat_delay_5(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf(' MPSE = %.3f', mpse_mean(1));
str=strcat('M=5, \Delta = 5,',str);
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 1);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_5');

%% Plotting of MPSE for Delay of 25, Averaged Over 100 Realisations
figure(2)
for i=1:10
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:10
    h2=plot(x_hat_delay_25(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf(' MPSE = %.3f', mpse_mean(2));
str=strcat('M=5, \Delta = 25,',str);
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 1);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_25');