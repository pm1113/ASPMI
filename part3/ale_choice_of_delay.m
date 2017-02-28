% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 b
%% Varying Delay

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);

% model order parameter
order=[5,10,15,20];

% delays
delays=1:25;

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

mpse=zeros(realisations,length(delays),length(order));

% run realisations
for i=1:realisations
    % generated filtered noise
    w=get_noise(N,noise_power);
    filtered_noise=filter(b,a,w);

    % add filtered noise to singal
    y=sine'+filtered_noise;
    
    % iterate model orders
    for j=1:length(order)
        % iterate over delays
        for k=1:length(delays)
           x_hat=lms_ale(y,mu,delays(k),order(j));
           mpse(i,k,j)=sum((sine-x_hat).^2)./N;
        end
    end
end

% get mean mpses
mpse_mean=mean(mpse);


%% Plot MPSE Against Delays
figure(1);
plot(delays,mpse_mean(:,:,1),'-o','LineWidth',line_width);
hold on;
plot(delays,mpse_mean(:,:,2),'-o','LineWidth',line_width);
plot(delays,mpse_mean(:,:,3),'-o','LineWidth',line_width);
plot(delays,mpse_mean(:,:,4),'-o','LineWidth',line_width);
hold off;
pranav_plot('Effect of \Delta on MPSE','n','MPSE', {'M=5','M=10','M=15','M=20'}, [1 25 0.2 0.8], 1);
% graph_saving('../report/images/part3/delay_vs_mpse');
