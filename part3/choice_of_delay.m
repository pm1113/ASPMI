% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 a
%% Choice of Delay in ALE Algorithm

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

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
x_hat_delay_1=zeros(realisations,N);
x_hat_delay_2=zeros(realisations,N);
x_hat_delay_3=zeros(realisations,N);
x_hat_delay_4=zeros(realisations,N);

error_delay_1=zeros(realisations,N-1);
error_delay_2=zeros(realisations,N-1);
error_delay_3=zeros(realisations,N-1);
error_delay_4=zeros(realisations,N-1);

mpse=zeros(realisations,4);

% model order parameter
order=1;

for i=1:realisations
    % generated filtered noise
    w=get_noise(N,noise_power);
    filtered_noise=filter(b,a,w);

    % add filtered noise to singal
    y(:,i)=sine'+filtered_noise;
    
    delay=1;
    [x_hat_delay_1(i,:), error_delay_1(i,:)] = lms_ale(y(:,i),mu,delay,order);
    mpse(i,1)=sum((sine-x_hat_delay_1(i,:)).^2)/N;
    delay=2;
    [x_hat_delay_2(i,:), error_delay_2(i,:)] = lms_ale(y(:,i),mu,delay,order);
    mpse(i,2)=sum((sine-x_hat_delay_2(i,:)).^2)/N;
    delay=3;
    [x_hat_delay_3(i,:), error_delay_3(i,:)] = lms_ale(y(:,i),mu,delay,order);
    mpse(i,3)=sum((sine-x_hat_delay_3(i,:)).^2)/N;
    delay=4;
    [x_hat_delay_4(i,:), error_delay_4(i,:)] = lms_ale(y(:,i),mu,delay,order);
    mpse(i,4)=sum((sine-x_hat_delay_4(i,:)).^2)/N;
end

% find means
x_hat_delay_1_mean=mean(x_hat_delay_1);
x_hat_delay_2_mean=mean(x_hat_delay_2);
x_hat_delay_3_mean=mean(x_hat_delay_3);
x_hat_delay_4_mean=mean(x_hat_delay_4);

error_delay_1_mean=mean(error_delay_1);
error_delay_2_mean=mean(error_delay_2);
error_delay_3_mean=mean(error_delay_3);
error_delay_4_mean=mean(error_delay_4);

mpse_mean=mean(mpse);

%% Plot X-hat for Delay of 1, Averaged Over 100 Realisations
figure(1)
plot(t,x_hat_delay_1_mean,'LineWidth',line_width);
pranav_plot_no_legend('\Delta = 1','n','Denoised Signal Magnitude', [0 1000 -1 1], 32/24);
% graph_saving('../report/images/part3/delay_1');

%% Plot X-hat for Delay of 2, Averaged Over 100 Realisations
figure(2)
plot(t,x_hat_delay_2_mean,'LineWidth',line_width);
pranav_plot_no_legend('\Delta = 2','n','Denoised Signal Magnitude', [0 1000 -1 1], 32/24);
% graph_saving('../report/images/part3/delay_2');

%% Plot X-hat for Delay of 3, Averaged Over 100 Realisations
figure(3)
plot(t,x_hat_delay_3_mean,'LineWidth',line_width);
pranav_plot_no_legend('\Delta = 3','n','Denoised Signal Magnitude', [0 1000 -1 1], 32/24);
% graph_saving('../report/images/part3/delay_3');

%% Plot X-hat for Delay of 4, Averaged Over 100 Realisations
figure(4)
plot(t,x_hat_delay_4_mean,'LineWidth',line_width);
pranav_plot_no_legend('\Delta = 4','n','Denoised Signal Magnitude', [0 1000 -1 1], 32/24);
% graph_saving('../report/images/part3/delay_4');

%% Plotting of MPSE for Delay of 1, Averaged Over 100 Realisations
figure(5)
for i=1:realisations
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:realisations
    h2=plot(x_hat_delay_1(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf('MPSE = %.3f', mpse_mean(1));
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 32/24);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_1');

%% Plotting of MPSE for Delay of 2, Averaged Over 100 Realisations
figure(6)
for i=1:realisations
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:realisations
    h2=plot(x_hat_delay_2(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf('MPSE = %.3f', mpse_mean(2));
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 32/24);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_2');

%% Plotting of MPSE for Delay of 3, Averaged Over 100 Realisations
figure(7)
for i=1:realisations
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:realisations
    h2=plot(x_hat_delay_3(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf('MPSE = %.3f', mpse_mean(3));
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 32/24);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_3');

%% Plotting of MPSE for Delay of 4, Averaged Over 100 Realisations
figure(8)
for i=1:realisations
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:realisations
    h2=plot(x_hat_delay_4(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf('MPSE = %.3f', mpse_mean(4));
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 32/24);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/mpse_delay_4');
