% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 3.3 d
%% Denoising EEG for Varying Values of mu and M

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/EEG_Data/EEG_Data/EEG_Data_Assignment2.mat;
load ../data/colors.mat


% algorithm parameter
mu=[0.025 0.01 0.005 0.001];
order=[10 15 20 25];

% spectrogram parameters
K=16382;
N=length(POz);
L=4096;
% express overlap as a percentage
overlap=0.8; 

% synthetic sinewave parameter
t=1:N;
f0=50;
noise_power=1;
% normalise the frequency because we generated t such that sampling period
% is 1;
f=f0/fs;

% generate synthetic sinewave with noise
sine=sin(2*pi*f*t);
w=get_noise(N,noise_power);
y=sine'+w;

% Detrend the POz
POz=POz-mean(POz);

% initialise vector to hold cleaned_POz Signals
cleaned_POz=zeros(N,length(mu),length(order));

for i=1:length(mu)
    for j=1:length(order)
        [noise_predictor]=lms_anc(POz,y,mu(i),order(j));
        cleaned_POz(:,i,j)=POz-noise_predictor';
    end
end


%% plot orginal spectrogram
figure(1);
spectrogram(POz, rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('Orginal POz Signal', 'FontSize', title_font_size);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/original_POz_spectrogram');

%% plot spectrogram for mu =  0.01 and M=10
figure(2);
spectrogram(cleaned_POz(:,2,1), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.01, M = 10', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_01_M_10');

%% plot spectrogram for mu =  0.01 and M=15
figure(3);
spectrogram(cleaned_POz(:,2,2), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.01, M = 15', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_01_M_15');

%% plot spectrogram for mu =  0.01 and M=20
figure(4);
spectrogram(cleaned_POz(:,2,3), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.01, M = 20', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_01_M_20');

%% plot spectrogram for mu =  0.01 and M=25
figure(5);
spectrogram(cleaned_POz(:,2,4), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.01, M = 25', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_01_M_25');

%% plot spectrogram for mu =  0.025 and M=25
figure(6);
spectrogram(cleaned_POz(:,1,4), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.025, M = 25', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_025_M_25');

%% plot spectrogram for mu =  0.01 and M=25
figure(7);
spectrogram(cleaned_POz(:,2,4), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.01, M = 25', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_01_M_25');

%% plot spectrogram for mu =  0.005 and M=25
figure(8);
spectrogram(cleaned_POz(:,3,4), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.005, M = 25', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_005_M_25');

%% plot spectrogram for mu =  0.001 and M=25
figure(9);
spectrogram(cleaned_POz(:,4,4), rectwin(L),round(overlap*L),K,fs,'yaxis');
ylim([0 100]);
set(gca,'fontsize',axis_font_size);
title('\mu = 0.001, M = 25', 'FontSize', title_font_size*32/24);
run('../utility_functions/scale_graph.m');
grid off;
% graph_saving('../report/images/part3/POz_mu_001_M_25');

%% Generate Bartlett Periodograms For Cleaned and Noisy POz Components
% averaged over 10s
figure(10)
num_seconds_average_over=2;
L = fs*num_seconds_average_over;
noverlap = 0;
[pxx,w]= pwelch(POz,rectwin(L),noverlap,K,fs,'onesided');
[pxx_cleaned,w_cleaned]= pwelch(cleaned_POz(:,4,4),rectwin(L),noverlap,K,fs,'onesided');
[pxx_semi_cleaned,w_semi_cleaned]= pwelch(cleaned_POz(:,1,4),rectwin(L),noverlap,K,fs,'onesided');
plot(w,pow2db(pxx),'LineWidth',line_width,'Color',colors(1,:));
hold on;
plot(w_cleaned,pow2db(pxx_cleaned),'LineWidth',line_width,'Color',colors(4,:));
plot(w_semi_cleaned,pow2db(pxx_semi_cleaned),'LineWidth',line_width,'Color',colors(2,:))
hold off;
pranav_plot('Bartlett Periodogram of EEG', 'Frequency (Hz)', 'Power/Frequency (dB/Hz)', {'Original Noisy POz Signal', 'mu=0.001, M=25', 'mu=0.025, M=25'}, [0 60 -140 -90], 1);
% graph_saving('../report/images/part3/bartlett_cleaned_Poz');

%% Squared Error In Bartlett Periodograms, mu=0.001, M=25
figure(11)
error_mu_001_M_25=(pxx-pxx_cleaned).^2;
plot(w,pow2db(error_mu_001_M_25),'LineWidth',line_width, 'Color', colors(4,:));
pranav_plot_no_legend('Squared Error, \mu=0.001, M=25', 'Frequency (Hz)', 'Error Power (dB)', [0 60 -310 -190], 1);
% graph_saving('../report/images/part3/squared_error_periodogram');

%% Squared Error In Bartlett Periodograms, mu=0.025, M=25
figure(12)
error_mu_01_M_25=(pxx-pxx_semi_cleaned).^2;
plot(w,pow2db(error_mu_01_M_25),'LineWidth',line_width, 'Color', colors(2,:));
pranav_plot_no_legend('Squared Error, \mu=0.025, M=25', 'Frequency (Hz)', 'Error Power (dB)', [0 60 -310 -190], 1);
% graph_saving('../report/images/part3/squared_error_periodogram_bad');
