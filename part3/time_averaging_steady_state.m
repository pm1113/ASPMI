% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 3.1 c
%% Time-Averaging Coefficients

run('../utility_functions/pre_plotting_variables_checker.m');
rng(0);
load ../data/colors.mat;

% AR model parameters
a=[0.1 0.8];
var=0.25;
const=0;

% parameters of signal
N=1000;
realisations=100;

% stimulate model to obtain signal
model=arima('Constant',const,'AR',a,'Variance',var);
x=simulate(model,N,'NumPaths',realisations);

% initalise error vector
error_mu_5=zeros(N,realisations);
error_mu_1=zeros(N,realisations);

% model order parameter
model_order=2;

% run realisations
for i=1:realisations
    mu=0.05;
    [~, error_mu_5(:,i), ~] = lms_ar(x(:,i), mu, model_order);
    mu=0.01;
    [~, error_mu_1(:,i), ~] = lms_ar(x(:,i), mu, model_order);
end

% find the means
error_mu_1_mean=mean(error_mu_1.^2,2);
error_mu_5_mean=mean(error_mu_5.^2,2);

% index to calculate steady state from
start=300;

% generate x-axis for plotting
x_axis=start:N;

% steady state after approximately 300 steps;
error_mu_1_mean=error_mu_1_mean(start:end);
error_mu_1_time_avg=ones(1,length(x_axis)).*mean(error_mu_1_mean);
error_mu_5_mean=error_mu_5_mean(start:end);
error_mu_5_time_avg=ones(1,length(x_axis)).*mean(error_mu_5_mean);

%% Plotting Time Average for mu=0.01
figure(1)
plot(x_axis, pow2db(error_mu_1_mean),'LineWidth',line_width);
hold on;
plot(x_axis, pow2db(error_mu_1_time_avg),'LineWidth',line_width*2,'Color',colors(4,:));
hold off;
pranav_plot('Time-Averaging, mu=0.01', 'n', 'Squared Prediction Error (dB)', {'Mean of 100 Realisations, \mu=0.01','Time Average'}, [300 1000 -7 -5], 1);
% graph_saving('../report/images/part3/time_average_mu_01');

%% Plotting Time Average for mu=0.05
x_axis=300:N;
figure(2)
plot(x_axis, pow2db(error_mu_5_mean),'LineWidth',line_width,'Color',colors(2,:));
hold on;
plot(x_axis, pow2db(error_mu_5_time_avg),'LineWidth',line_width*2,'Color',colors(4,:));
hold off;
pranav_plot('Time-Averaging, mu=0.05', 'n', 'Squared Prediction Error (dB)', {'Mean of 100 Realisations, \mu=0.05','Time Average'}, [300 1000 -7 -5], 1);
% graph_saving('../report/images/part3/time_average_mu_05');
