% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Comparision of Different Gradient Adaptive Step-Size Algorithms

run('../utility_functions/pre_plotting_variables_checker.m') 
rng(1);

% algorithm parameter
rho = 0.005;
mu = 0;

% AR model parameters
b = [1 0.9];
a = 1;
noise_power=0.5;

% parameters of signal
N = 1000;
realisations=100;


% initialise vectors to hold coefficients
coeffs_ben=zeros(N, realisations);
coeffs_ang=zeros(N, realisations);
coeffs_mat=zeros(N, realisations);
coeffs_mu_1=zeros(N, realisations);
coeffs_mu_01=zeros(N, realisations);

% model order parameter
order = 1;

% run realisations
for i=1:realisations
    % generate filtered noise
    w=get_noise(N,noise_power);
    y=filter(b,a,w);
    % obtain coefficients using different algorithms
    [~, ~,coeffs_ben(:,i)] = lms_gs(w,y, mu, rho, order,'ben');
    [~, ~,coeffs_ang(:,i)] = lms_gs(w,y, mu, rho, order,'ang');
    [~, ~,coeffs_mat(:,i)] = lms_gs(w,y, mu, rho, order,'mat');
    mu=0.1;
    [~, ~,coeffs_mu_1(:,i)] = lms(w,y, mu, order);
    mu=0.01;
    [~, ~,coeffs_mu_01(:,i)] = lms(w,y, mu, order);
end

% get the means
coeffs_ben_mean=mean(coeffs_ben,2);
coeffs_ang_mean=mean(coeffs_ang,2);
coeffs_mat_mean=mean(coeffs_mat,2);
coeffs_mu_1_mean=mean(coeffs_mu_1,2);
coeffs_mu_01_mean=mean(coeffs_mu_01,2);

%% Weight Errors for Different Algorithms for 1 Single Realisation
figure(1)
plot(b(2)-coeffs_mu_01(:,1),'LineWidth',line_width);
hold on;
plot(b(2)-coeffs_mu_1(:,1),'LineWidth',line_width);
plot(b(2)-coeffs_ben(:,1),'LineWidth',line_width);
plot(b(2)-coeffs_ang(:,1),'LineWidth',line_width);
plot(b(2)-coeffs_mat(:,1),'LineWidth',line_width);
hold off;
pranav_plot('Convergence of Coefficients', 'n', 'Weight Error Magnitude', {'LMS, mu=0.001', 'LMS, mu=0.01', 'Benveniste', 'Ang and Farhang', 'Matthew and Xie'}, [0 1000 -1 1.5], 1);
% graph_saving('../report/images/part3/convergence_of_weights');

%% Squared Error for Different Algorithms for 1 Single Realisation
figure(2)
plot(pow2db((b(2)-coeffs_mu_01(:,1)).^2),'LineWidth',line_width);
hold on;
plot(pow2db((b(2)-coeffs_mu_1(:,1)).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_ben(:,1)).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_ang(:,1)).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_mat(:,1)).^2),'LineWidth',line_width);
hold off;
pranav_plot('Squared Error, in dB', 'n', 'Weight Error Magnitude', {'LMS, mu=0.001', 'LMS, mu=0.01', 'Benveniste', 'Ang and Farhang', 'Matthew and Xie'}, [0 1000 -300 50], 1);
% graph_saving('../report/images/part3/convergence_of_weights_db');


%% Weight Errors for Different Algorithms, Averaged over 100 Realisations
figure(3)
plot(b(2)-coeffs_mu_01_mean,'LineWidth',line_width);
hold on;
plot(b(2)-coeffs_mu_1_mean,'LineWidth',line_width);
plot(b(2)-coeffs_ben_mean,'LineWidth',line_width);
plot(b(2)-coeffs_ang_mean,'LineWidth',line_width);
plot(b(2)-coeffs_mat_mean,'LineWidth',line_width);
hold off;
pranav_plot('Averaged Weights, 100 Trials', 'n', 'Weight Error Magnitude', {'LMS, mu=0.001', 'LMS, mu=0.01', 'Benveniste', 'Ang and Farhang', 'Matthew and Xie'}, [0 1000 -0.2 1], 1);
% graph_saving('../report/images/part3/convergence_of_weights_averaged');

%% Squared Error for Different Algorithms, Averaged Over 100 Realisations
figure(4)
plot(pow2db((b(2)-coeffs_mu_01_mean).^2),'LineWidth',line_width);
hold on;
plot(pow2db((b(2)-coeffs_mu_1_mean).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_ben_mean).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_ang_mean).^2),'LineWidth',line_width);
plot(pow2db((b(2)-coeffs_mat_mean).^2),'LineWidth',line_width);
hold off;
pranav_plot('Squared Error, 100 Trials, in dB', 'n', 'Weight Error Magnitude', {'LMS, mu=0.001', 'LMS, mu=0.01', 'Benveniste', 'Ang and Farhang', 'Matthew and Xie'}, [0 1000 -300 50], 1);
% graph_saving('../report/images/part3/convergence_of_weights_averaged_db');
