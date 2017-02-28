% Created by Pranav Malhotra, 26 Feburary 2017
% ASPMI: Question 3.2 c
%% System Identification Using NLMS with GNGD and Benveniste's Algorithm

run('../utility_functions/pre_plotting_variables_checker.m')
rng(1);

% algorithm parameters
order=1;
mu=0;
rho=0.005;
algo='ben';

% signal coefficient
N=1000;
noise_power=0.5;
b=[1 0.9];
a=1;

% generate filtered noise
w=get_noise(N,noise_power);
y=filter(b,a,w);

% get coefficients using different algorithms
[~,~,coeffs_ben] = lms_gs(x,y,mu,rho,order,'ben');
[~,~,coeffs_GNGD] = nlms_gngd(x,y,mu,rho,order);

% plotting both coefficients on the same plot
figure(1);
plot(coeffs_ben,'LineWidth',line_width);
hold on;
plot(coeffs_GNGD,'LineWidth',line_width);
hold off;
pranav_plot('Benveniste GASS vs GNGD', 'n', 'Magnitude of Coefficients', {'Benveniste', 'GNGD'}, [0 60 -0.2 1.2], 1);
% graph_saving('../report/images/part3/compare_benveniste_gngd');
