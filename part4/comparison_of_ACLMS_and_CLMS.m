% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.1 a
%% Comparison of Performance for ACLMS and CLMS

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% algorithm parameters
mu=0.1;
order=1;

% number of realisations to average results over
realisations=100;

% noise parameters
N=1000;
noise_power=1;
b=[1.5+1i, 2.5-0.5i];
a=1;


% initialise vectors to hold values;
e_clms=complex(zeros(realisations,N));
e_aclms=complex(zeros(realisations,N));
w=complex(zeros(realisations,N));
y=complex(zeros(realisations,N));

% run realisations
for i=1:realisations

    % get complex circular wgn
    w(i,:)=wgn(1,N,pow2db(noise_power),'complex');
    y(i,:)=run_complex_ma(b,a,w(i,:));
    
    [~, e] = clms(y(i,:), w(i,:), mu, order);
    e_clms(i,:)=abs(e).^2;
    [~, e] = aclms(y(i,:), w(i,:), mu, order);
    e_aclms(i,:)=abs(e).^2;
    
end

% generate x-axis for plotting
x_axis=1:N;

% starting point to start averaging to find steady state
start=700;


e_clms_mean=mean(e_clms);
e_clms_steady_state=mean(e_clms_mean(start:end));
e_aclms_mean=mean(e_aclms);
e_aclms_steady_state=mean(e_aclms_mean(start:end));
w_mean=mean(w);
y_mean=mean(y);

%% Plottin of Learning Curves
figure(1)
plot(x_axis,pow2db(e_clms_mean),'LineWidth',line_width);
hold on;
plot(x_axis,pow2db(e_aclms_mean),'LineWidth',line_width);
hold off;
legend1=sprintf('Complex LMS, Steady State %.1f',pow2db(e_clms_steady_state));
legend2=sprintf('Augmented Complex LMS, Steady State %.1f',pow2db(e_aclms_steady_state));
pranav_plot('Learning Curve, CLMS and ACLMS', 'n', 'Error Power (dB)', {legend1, legend2}, [0 1000 -350 100], 1);
% graph_saving('../report/images/part4/learning_curves_clms_aclms');

%% Plottin of Learning Curves
figure(2)
plot(real(w_mean),imag(w_mean),'o','LineWidth',line_width,'Color',colors(1,:));
hold on;
plot(real(y_mean),imag(y_mean),'o','LineWidth',line_width,'Color',colors(2,:));
hold off;
% yticklabels({'-1.00', '-0.80', '-0.60', '-0.40', '-0.20', '0', '0.20', '0.40', '0.60', '0.80', '1.00'})
pranav_plot('Distribution of Noise and WLMA(1)', 'Real Part', 'Imaginary Part', {'Circular White Gaussian Noise', 'First-Order Widely Linear Moving Average Process'}, [-1.1 1.1 -1.1 1.1], 1);
% graph_saving('../report/images/part4/distributions');
