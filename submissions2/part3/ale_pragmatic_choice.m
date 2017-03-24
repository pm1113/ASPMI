% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 b
%% Varying Filter Order

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);

% model order parameter
order=1:15;

% delays
delays=3;

% algorithm parameter
mu=[0.005,0.01,0.015,0.020,0.025];

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

mpse=zeros(realisations,length(order),length(mu));

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
        for k=1:length(mu)
           x_hat=lms_ale(y,mu(k),delays,order(j));
           mpse(i,j,k)=sum((sine-x_hat).^2)./N;
        end
    end
end

% get mean mpses
mpse_mean=mean(mpse);


%% Plot MPSE Against Delays
figure(1);
plot(order,mpse_mean(:,:,1),'-o','LineWidth',line_width);
hold on;
plot(order,mpse_mean(:,:,2),'-o','LineWidth',line_width);
plot(order,mpse_mean(:,:,3),'-o','LineWidth',line_width);
plot(order,mpse_mean(:,:,4),'-o','LineWidth',line_width);
plot(order,mpse_mean(:,:,5),'-o','LineWidth',line_width);
hold off;
pranav_plot('Effect of M on MPSE','M','MPSE', {'mu=0.005','mu=0.010','mu=0.015','mu=0.020','mu=0.025'}, [1 15 0 1.5], 1);
% graph_saving('../report/images/part3/model_order_mpse');
