% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.2 a/b
%% Using Aryule and Online Spectral Estimation to Understand Frequency MOdulated Signal

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% parameters of the algorithm
order=1;
K=1024;

% parameters of signal
N=1500;
fs=1600;
noise_power=0.05;

% define frequencies of the signal
f=zeros(N,1);
f(1:500)=100;
f(501:1000)=100+(1:500)./2;
f(1001:1500)=100+((1:500)./25).^2;
phase=cumsum(f);

% generate FM signal
x=exp(1j*(phase*2*pi/fs));

% generate circular complex-valued white noise
w=wgn(N,1,pow2db(0.05),'complex');

% corrupt signal with noise
y=x+w;

% get aryule coefficients
a=aryule(y,order);

% get power spectrum of system using Block-Based Estimate of AR
% Coefficients
[h_aryule, w_aryule]=freqz(1, a, N, fs);

% estimate AR Coefficients using Adaptive filter
mu=0.1;
[~,~,h_clms_mu_1] = clms_ar(y, mu, order);
mu=0.01;
[~,~,h_clms_mu_01] = clms_ar(y, mu, order);
mu=0.0025;
[~,~,h_clms_mu_0025] = clms_ar(y, mu, order);

% initialise vector to holder values 
H_mu_1=zeros(K,N,length(mu));
H_mu_01=zeros(K,N,length(mu));
H_mu_0025=zeros(K,N,length(mu));


% calculate the power spectrum for each time instance
for n = 1:N
    [h ,~]= freqz(1 , [1; -conj(h_clms_mu_1(n))], K, fs);
    H_mu_1(:, n) = abs(h).^2; 
    [h ,~]= freqz(1 , [1; -conj(h_clms_mu_01(n))], K, fs);
    H_mu_01(:, n) = abs(h).^2; 
    [h ,w]= freqz(1 , [1; -conj(h_clms_mu_0025(n))], K, fs);
    H_mu_0025(:, n) = abs(h).^2; 
end

% remove outliers in the matrix H
medianH=50*median(median(H_mu_1));
H_mu_1(H_mu_1>medianH)=medianH;
medianH=50*median(median(H_mu_01));
H_mu_01(H_mu_01>medianH)=medianH;
medianH=50*median(median(H_mu_0025));
H_mu_0025(H_mu_0025>medianH)=medianH;


%% Plotting of Original Frequency
figure(1)
plot(f, 'LineWidth', line_width);
pranav_plot_no_legend('Frequency of FM Signal', 'n', 'Frequency (Hz)', [0 1500 0 600], 1);
grid off; grid
graph_saving('../report/images/part4/frequency_original_fm_signal');

%% Plotting of Spectrum Obtained From ArYule
figure(2)
plot(w_aryule,mag2db(abs(h_aryule)), 'LineWidth', line_width);
pranav_plot_no_legend('Power Spectrum: Aryule Method', 'Frequency (Hz)', 'Magnitude (dB)', [0 800 -20 30], 1);
% graph_saving('../report/images/part4/frequency_aryule_fm_signal');

%% Plot Time-Frequency Plot mu=0.1
figure(3)
surf(1:N, w, H_mu_1, 'LineStyle', 'none');
view(2);
pranav_plot_no_legend('Evolution of Frequency, \mu=0.1', 'n', 'Frequency (Hz)', [0 1500 0 800], 1);
set(gca, 'Color', 'none');
% graph_saving('../report/images/part4/frequency_clms_fm_signal_1');

%% Plot Time-Frequency Plot mu=0.01
figure(4)
surf(1:N, w, H_mu_01, 'LineStyle', 'none');
view(2);
pranav_plot_no_legend('Evolution of Frequency. \mu=0.01', 'n', 'Frequency (Hz)', [0 1500 0 800], 1);
set(gca, 'Color', 'none');
% graph_saving('../report/images/part4/frequency_clms_fm_signal_01');

%% Plot Time-Frequency Plot mu=0.0025
figure(5)
surf(1:N, w, H_mu_0025, 'LineStyle', 'none');
view(2);
pranav_plot_no_legend('Evolution of Frequency, \mu=0.0025', 'n', 'Frequency (Hz)', [0 1500 0 800], 1);
set(gca, 'Color', 'none');
graph_saving('../report/images/part4/frequency_clms_fm_signal_0025');
