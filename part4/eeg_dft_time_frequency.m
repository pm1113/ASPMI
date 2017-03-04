% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.3 c
%% EEG: Time-Frequency Analysis Using DFT

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat
load ../data/EEG_Data/EEG_Data/EEG_Data_Assignment1.mat

% Generate reference signal
start=1000;
N=1200;
y=POz(start:start+N-1);

% algorithm parameters
mu=1;
K=8192;

% implement clms_dft
% non-leaky version
[~,~,clms_dft_non_leaky]=clms_dft(y, mu, K, 0);

% implement clms_dft
% non-leaky version
[~,~,clms_dft_leaky]=clms_dft(y, mu, K, 0.001);

%% Plot Time-Frequency Plot, using clms_dft - NON-Leaky
figure(1)
surf(1:N, [0:K-1].*fs/K, abs(clms_dft_non_leaky), 'LineStyle', 'none');
view(2);
pranav_plot_no_legend('EEG Data: DFT-CLMS', 'n', 'Frequency (Hz)', [0 1200 0 100], 1);
caxis([0 0.0000009])
set(gca, 'Color', 'none');
% graph_saving('../report/images/part4/time_frequency_dft_non_leaky');

%% Plot Time-Frequency Plot, using clms_dft - NON-Leaky
figure(2)
surf(1:N, [0:K-1].*fs/K, abs(clms_dft_leaky), 'LineStyle', 'none');
view(2);
pranav_plot_no_legend('EEG Data: Leaky DFT-CLMS', 'n', 'Frequency (Hz)', [0 1200 0 100], 1);
caxis([0 0.0000009])
set(gca, 'Color', 'none');
% graph_saving('../report/images/part4/time_frequency_dft_leaky');
