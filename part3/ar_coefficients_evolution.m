% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 3.1 d
%% Evolution of AR Coefficients

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);

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

% initialise coefficient vectors
ar_coeffs_mu_5=zeros(realisations*2,N-order+1);
ar_coeffs_mu_1=zeros(realisations*2,N-order+1);

% model order parameter
order=2;

% run realisations
for i=1:realisations
    mu=0.05;
    [~,~,ar_coeffs_mu_5(1+(i-1)*2:i*2,:)] = lms_ar(x(:,i), mu, order);
    mu=0.01;
    [~,~,ar_coeffs_mu_1(1+(i-1)*2:i*2,:)] = lms_ar(x(:,i), mu, order);
end

% start of steady state index
start=900;

% generate x-axis for plotting
x_axis=1:N-order+1;

% averge over realisations
ar_coeffs_mu_5_mean(1,:)=mean(ar_coeffs_mu_5(1:2:end,:));
ar_coeffs_mu_5_mean(2,:)=mean(ar_coeffs_mu_5(2:2:end,:));
ar_coeffs_mu_5_steady_state(1,:)=mean(ar_coeffs_mu_5_mean(1,start:end)).*ones(1,length(x_axis));
ar_coeffs_mu_5_steady_state(2,:)=mean(ar_coeffs_mu_5_mean(2,start:end)).*ones(1,length(x_axis));
ar_coeffs_mu_1_mean(1,:)=mean(ar_coeffs_mu_1(1:2:end,:));
ar_coeffs_mu_1_mean(2,:)=mean(ar_coeffs_mu_1(2:2:end,:));
ar_coeffs_mu_1_steady_state(1,:)=mean(ar_coeffs_mu_1_mean(1,start:end)).*ones(1,length(x_axis));
ar_coeffs_mu_1_steady_state(2,:)=mean(ar_coeffs_mu_1_mean(2,start:end)).*ones(1,length(x_axis));

%% Plotting Evolution of AR for mu=0.01 - 1 Trail
figure(1)
plot(x_axis,ar_coeffs_mu_1(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1(2,:),'LineWidth',line_width);
hold off;
pranav_plot('1 Trial, mu=0.01', 'n', 'Magnitude of Coefficents', {'a_1','a_2'}, [0 1000 -0.5 1.5], 1);
% graph_saving('../report/images/part3/ar_coefficients_evolution_mu_01_1_trial');

%% Plotting Evolution of AR for mu=0.05 - 1 Trail
figure(2)
plot(x_axis,ar_coeffs_mu_5(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_5(2,:),'LineWidth',line_width);
hold off;
pranav_plot('1 Trial, mu=0.05', 'n', 'Magnitude of Coefficents', {'a_1','a_2'}, [0 1000 -0.5 1.5], 1);
% graph_saving('../report/images/part3/ar_coefficients_evolution_mu_05_1_trial');

%% Plotting Evolution of AR for mu=0.01 - 100 Trail
figure(3)
plot(x_axis,ar_coeffs_mu_1_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_mean(2,:),'LineWidth',line_width);
hold off;
pranav_plot('Average of 100 Trials, mu=0.01', 'n', 'Magnitude of Coefficents', {'a_1','a_2'}, [0 1000 -0.5 1.5], 1);
% graph_saving('../report/images/part3/ar_coefficients_evolution_mu_01_1_trial');

%% Plotting Evolution of AR for mu=0.05 - 100 Trail
figure(4)
plot(x_axis,ar_coeffs_mu_5_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_5_mean(2,:),'LineWidth',line_width);
hold off;
pranav_plot('Average of 100 Trials, mu=0.05', 'n', 'Magnitude of Coefficents', {'a_1','a_2'}, [0 1000 -0.5 1.5], 1);
% graph_saving('../report/images/part3/ar_coefficients_evolution_mu_05_1_trial');

%% Comparison of Steady State Values for a_1 for mu=0.01 and mu=0.05
figure(5)
plot(x_axis,ar_coeffs_mu_1_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_steady_state(1,:),'LineWidth',line_width*2);
plot(x_axis,ar_coeffs_mu_5_mean(1,:),'LineWidth',line_width);
plot(x_axis,ar_coeffs_mu_5_steady_state(1,:),'LineWidth',line_width*2);
hold off;
pranav_plot('Steady State of a_1 for Different \mu', 'n', 'Magnitude of Coefficents', {'\mu=0.01','Time Average, \mu=0.01','\mu=0.05','Time Average, \mu=0.05'}, [900 1000 0.05 .12], 1);
% graph_saving('../report/images/part3/steady_state_ar_coeff_1');

%% Comparison of Steady State Values for a_2 for mu=0.01 and mu=0.05
figure(6)
plot(x_axis,ar_coeffs_mu_1_mean(2,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_steady_state(2,:),'LineWidth',line_width*2);
plot(x_axis,ar_coeffs_mu_5_mean(2,:),'LineWidth',line_width);
plot(x_axis,ar_coeffs_mu_5_steady_state(2,:),'LineWidth',line_width*2);
hold off;
pranav_plot('Steady State of a_2 for Different \mu', 'n', 'Magnitude of Coefficents', {'\mu=0.01','Time Average, \mu=0.01','\mu=0.05','Time Average, \mu=0.05'}, [900 1000 0.7 0.8], 1);
% graph_saving('../report/images/part3/steady_state_ar_coeff_2');
