% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 3.1 b
%% Squared Error Analysis

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0)

% AR model parameter
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
order=2;

% run realisations
for i=1:realisations
    mu=0.05;
    [~, error_mu_5(:,i), ~] = lms_ar(x(:,i), mu, order);
    mu=0.01;
    [~, error_mu_1(:,i), ~] = lms_ar(x(:,i), mu, order);
end

% generate x-axis for plotting
x_axis=1:N;

%% Plotting Results for 1 Realisations
figure(1)
plot(x_axis, pow2db(error_mu_1(:,1).^2),'LineWidth',line_width);
hold on;
plot(x_axis, pow2db(error_mu_5(:,1).^2),'LineWidth',line_width);
hold off;
pranav_plot('Squared Prediction Error, 1 Trial', 'n', 'Squared Prediction Error (dB)', {'\mu=0.01','\mu=0.05'}, [0 1000 -70 30], 1);
% graph_saving('../report/images/part3/ar_lms_mu_1_realisation');

%% Plotting Results for 100 Realisations
figure(2)
plot(x_axis, pow2db(mean(error_mu_1.^2,2)),'LineWidth',line_width);
hold on;
plot(x_axis, pow2db(mean(error_mu_5.^2,2)),'LineWidth',line_width);
hold off;
pranav_plot('Squared Prediction Error, 100 Trial', 'n', 'Squared Prediction Error (dB)', {'Mean of 100 Realisations, \mu=0.01','Mean of 100 Realisations, \mu=0.05'}, [0 1000 -10 0], 1);
% graph_saving('../report/images/part3/ar_lms_mu_100_realisation');
