% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Evolution of AR Coefficients using Leaky LMS Algorithm

run('../utility_functions/pre_plotting_variables_checker.m') 
rng(0);
load ../data/colors.mat;

% algorithm parameters
gamma=[0.1 0.5 0.9];

% AR model paramets
a=[0.1 0.8];
var=0.25;
const=0;

% parameters of signal
N=1001;
realisations=100;

% stimulate model to obtain signal
model=arima('Constant',const,'AR',a,'Variance',var);
x=simulate(model,N,'NumPaths',realisations);

% initialise coefficient vectors
ar_coeffs_mu_5_gamma_1=zeros(realisations*2,N-order+1);
ar_coeffs_mu_5_gamma_5=zeros(realisations*2,N-order+1);
ar_coeffs_mu_5_gamma_9=zeros(realisations*2,N-order+1);
ar_coeffs_mu_1_gamma_1=zeros(realisations*2,N-order+1);
ar_coeffs_mu_1_gamma_5=zeros(realisations*2,N-order+1);
ar_coeffs_mu_1_gamma_9=zeros(realisations*2,N-order+1);

% model order parameter
order=2;

% run realisations
for i=1:realisations
    mu=0.05;
    [~,~,ar_coeffs_mu_5_gamma_1(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(1), order);
    [~,~,ar_coeffs_mu_5_gamma_5(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(2), order);
    [~,~,ar_coeffs_mu_5_gamma_9(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(3), order);
    mu=0.01;
    [~,~,ar_coeffs_mu_1_gamma_1(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(1), order);
    [~,~,ar_coeffs_mu_1_gamma_5(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(2), order);
    [~,~,ar_coeffs_mu_1_gamma_9(1+(i-1)*2:i*2,:)] = lms_leaky(x(:,i), mu, gamma(3), order);
end

% find the means
ar_coeffs_mu_5_gamma_1_mean(1,:)=mean(ar_coeffs_mu_5_gamma_1(1:2:end,:));
ar_coeffs_mu_5_gamma_1_mean(2,:)=mean(ar_coeffs_mu_5_gamma_1(2:2:end,:));
ar_coeffs_mu_5_gamma_5_mean(1,:)=mean(ar_coeffs_mu_5_gamma_5(1:2:end,:));
ar_coeffs_mu_5_gamma_5_mean(2,:)=mean(ar_coeffs_mu_5_gamma_5(2:2:end,:));
ar_coeffs_mu_5_gamma_9_mean(1,:)=mean(ar_coeffs_mu_5_gamma_9(1:2:end,:));
ar_coeffs_mu_5_gamma_9_mean(2,:)=mean(ar_coeffs_mu_5_gamma_9(2:2:end,:));

ar_coeffs_mu_1_gamma_1_mean(1,:)=mean(ar_coeffs_mu_1_gamma_1(1:2:end,:));
ar_coeffs_mu_1_gamma_1_mean(2,:)=mean(ar_coeffs_mu_1_gamma_1(2:2:end,:));
ar_coeffs_mu_1_gamma_5_mean(1,:)=mean(ar_coeffs_mu_1_gamma_5(1:2:end,:));
ar_coeffs_mu_1_gamma_5_mean(2,:)=mean(ar_coeffs_mu_1_gamma_5(2:2:end,:));
ar_coeffs_mu_1_gamma_9_mean(1,:)=mean(ar_coeffs_mu_1_gamma_9(1:2:end,:));
ar_coeffs_mu_1_gamma_9_mean(2,:)=mean(ar_coeffs_mu_1_gamma_9(2:2:end,:));

% generate x-axis for plotting
x_axis=1:N-order+1;

% generate reference axis
a_1_ref=ones(1,length(x_axis))*a(1);
a_2_ref=ones(1,length(x_axis))*a(2);

%% Plotting Evolution of AR for mu=0.01, gamma=0.1
figure(1)
plot(x_axis,ar_coeffs_mu_1_gamma_1_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_gamma_1_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.01, \gamma=0.1', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_01_gamma_01');

%% Plotting Evolution of AR for mu=0.01, gamma=0.5
figure(2)
plot(x_axis,ar_coeffs_mu_1_gamma_5_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_gamma_5_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.01, \gamma=0.5', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_01_gamma_05');

%% Plotting Evolution of AR for mu=0.01, gamma=0.9
figure(3)
plot(x_axis,ar_coeffs_mu_1_gamma_9_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_1_gamma_9_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.01, \gamma=0.9', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_01_gamma_09');

%% Plotting Evolution of AR for mu=0.05, gamma=0.1
figure(4)
plot(x_axis,ar_coeffs_mu_5_gamma_1_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_5_gamma_1_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.05, \gamma=0.1', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_05_gamma_01');

%% Plotting Evolution of AR for mu=0.05, gamma=0.5
figure(5)
plot(x_axis,ar_coeffs_mu_5_gamma_5_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_5_gamma_5_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.05, \gamma=0.5', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_05_gamma_05');

%% Plotting Evolution of AR for mu=0.05, gamma=0.9
figure(6)
plot(x_axis,ar_coeffs_mu_5_gamma_9_mean(1,:),'LineWidth',line_width);
hold on;
plot(x_axis,ar_coeffs_mu_5_gamma_9_mean(2,:),'LineWidth',line_width);
plot(x_axis,a_1_ref,'--','LineWidth',line_width,'Color',colors(4,:));
plot(x_axis,a_2_ref,'--','LineWidth',line_width,'Color',colors(7,:));
hold off;
pranav_plot('\mu=0.05, \gamma=0.9', 'n', 'Magnitude of Coefficents', {'a_1','a_2','Reference for a_1','Reference for a_2'}, [0 1000 0 1], 1);
% graph_saving('../report/images/part3/leaky_mu_05_gamma_09');
