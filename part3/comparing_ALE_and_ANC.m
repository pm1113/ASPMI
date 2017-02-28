% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 c
%% Comparing ALE and ANC

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% model order parameter
order=6;

% delays, used for ALE
delay=3;

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

% initialise vectors to hold values of Signal
y=zeros(N,realisations);

% initialise vectors to hold results obtained
x_hat_ale=zeros(realisations,N);
x_hat_anc=zeros(realisations,N);

errors_ale=zeros(realisations,N-1);
errors_anc=zeros(realisations,N-1);

% to hold mpse for ALE and ANC
mpse=zeros(realisations,2);

% run realisations
for i=1:realisations
    % generated filtered noise
    w=get_noise(N,noise_power);
    filtered_noise=filter(b,a,w);

    % add filtered noise to singal
    y(:,i)=sine'+filtered_noise;
    
   [x_hat_ale(i,:),errors_ale(i,:)]=lms_ale(y(:,i),mu,delay,order);
   mpse(i,1)=sum((sine-x_hat_ale(i,:)).^2)./N;
   
   [n_hat,errors_anc(i,:)]=lms_anc(y(:,i),filtered_noise,mu,order);
   x_hat_anc(i,:)=y(:,i)'-n_hat;
   mpse(i,2)=sum((sine-x_hat_anc(i,:)).^2)./N;
   
end

% get means
x_hat_ale_mean=mean(x_hat_ale);
x_hat_anc_mean=mean(x_hat_anc);
mpse_mean=mean(mpse);

% generate x-axis for plotting
x_axis=1:N;

%% Plot The Average Signals Obtained using ALE and ANC
figure(1);
plot(x_axis,x_hat_ale_mean,'LineWidth',line_width);
hold on;
plot(x_axis,x_hat_anc_mean,'LineWidth',line_width);
hold off;
pranav_plot('Comparison of ALE and ANC', 'n', 'Signal Magnitude', {'Averaged Output of 100 Realisations, ALE','Averaged Output of 100 Realisations, ANC'}, [0 1000 -2 2], 1);
% graph_saving('../report/images/part3/anc_ale_comparison');

%% Plotting of MPSE for ALE, Averaged Over 100 Realisations
figure(2)
for i=1:10
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:10
    h2=plot(x_hat_ale(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf(' MPSE = %.3f', mpse_mean(1));
str=strcat('ALE Configuration,', str);
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 1);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/ale_mpse');

%% Plotting of MPSE for ANC, Averaged Over 100 Realisations
figure(3)
for i=1:10
    h1=plot(y(:,i), 'LineWidth', line_width, 'Color', colors(2,:));
    if i==1
        hold on;
    end
end
for i=1:10
    h2=plot(x_hat_anc(i,:), 'LineWidth', line_width, 'Color', colors(1,:));
end
h3=plot(sine,'LineWidth',line_width*2, 'Color', colors(4,:));
hold off;
str=sprintf(' MPSE = %.3f', mpse_mean(2));
str=strcat('ANC Configuration,', str);
pranav_plot_no_legend(str,'n','Signal Magnitude', [0 1000 -6 6], 1);
legend([h1 h2 h3],{'100 Realisation of Noisy Sine Wave','100 Realisations of Denoised Sine Wave','Clean Sine Wave'},'FontSize',25);
% graph_saving('../report/images/part3/anc_mpse');
