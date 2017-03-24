% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.1 e
%% 

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% algorithm parameters
mu=0.01;
order=1;

% sine wave parameters
f0=50;
fs=1000;
N=10000;

% distortion parameter
phi_phase_shift=0;
distortion_b=0;
distortion_c=0;

% amplitudes of phases
V_a=ones(1,N);
V_b=ones(1,N);
V_c=ones(1,N);

% generate balanced signal
v_balanced=clarkson_transform_voltage(N,f0,fs,phi_phase_shift,V_a,V_b,V_c,distortion_b,distortion_c);

% unbalance because of phase
distortion_b_unbalanced = pi/4;
distortion_c_unbalanced = pi/4;

% generate unbalanced signal
v_unbalanced_distortion=clarkson_transform_voltage(N,f0,fs,phi_phase_shift,V_a,V_b,V_c,distortion_b_unbalanced,distortion_c_unbalanced);

% unbalance because of phase
voltage_multipliers=[0.2 1 1.8];

% generate unbalanced signal
v_unbalanced_magnitude=clarkson_transform_voltage(N,f0,fs,phi_phase_shift,V_a*voltage_multipliers(1),V_b*voltage_multipliers(2),V_c*voltage_multipliers(3),distortion_b,distortion_c);


[~,~,h_balanced_clms]=clms_ar(v_balanced,mu,order);
f0_balanced_clms=(fs/(2*pi))*atan(imag(conj(h_balanced_clms))./real(conj(h_balanced_clms)));
[~,~,h_balanced_aclms,g_balanced_aclms]=aclms_ar(v_balanced,mu,order);
f0_balanced_aclms=(fs/(2*pi))*atan((sqrt( (imag(h_balanced_aclms).^2) - (abs(g_balanced_aclms).^2) ))./ (real(h_balanced_aclms)));

[~,~,h_unbalanced_clms]=clms_ar(v_unbalanced_distortion,mu,order);
f0_unbalanced_clms=(fs/(2*pi))*atan(imag(conj(h_unbalanced_clms))./real(conj(h_unbalanced_clms)));
[~,~,h_unbalanced_aclms,g_unbalanced_aclms]=aclms_ar(v_unbalanced_distortion,mu,order);
f0_unbalanced_aclms=(fs/(2*pi))*atan((sqrt( (imag(h_unbalanced_aclms).^2) - (abs(g_unbalanced_aclms).^2) ))./ (real(h_unbalanced_aclms)));

[~,~,h_unbalanced_magnitude_clms]=clms_ar(v_unbalanced_magnitude,mu,order);
f0_unbalanced_magnitude_clms=(fs/(2*pi))*atan(imag(conj(h_unbalanced_magnitude_clms))./real(conj(h_unbalanced_magnitude_clms)));
[~,~,h_unbalanced_magnitude_aclms,g_unbalanced_magnitude_aclms]=aclms_ar(v_unbalanced_distortion,mu,order);
f0_unbalanced_magnitude_aclms=(fs/(2*pi))*atan((sqrt( (imag(h_unbalanced_magnitude_aclms).^2) - (abs(g_unbalanced_magnitude_aclms).^2) ))./ (real(h_unbalanced_magnitude_aclms)));

%% Plot Frequencies for Balanced System
figure(1)
start=3;
plot(f0_balanced_clms(start:end),'LineWidth',line_width);
hold on;
plot(abs(f0_balanced_aclms(start:end)),'LineWidth',line_width);
hold off;
pranav_plot('Balanced System','n','f_{o}',{'Complex LMS', 'Augmented Complex LMS'},[1 420 0 300], 1);
% graph_saving('../report/images/part4/balanced_sys_clms_aclms');

%% Plot Frequencies for Unbalanced System, Phase
figure(2)
plot(f0_unbalanced_clms(start:end),'LineWidth',line_width);
hold on;
plot(abs(f0_unbalanced_aclms(start:end)),'LineWidth',line_width);
hold off;
pranav_plot('Unbalanced, \Delta_{b}=\pi/4, \Delta_{c}=\pi/4','n','f_{o}',{'Complex LMS', 'Augmented Complex LMS'},[1 600 -10 250], 1);
% graph_saving('../report/images/part4/unbalanced_sys_clms_aclms_phase');

%% Plot Frequencies for Unbalanced System, Magnitude
figure(3)
plot(f0_unbalanced_magnitude_clms(start:end),'LineWidth',line_width);
hold on;
plot(abs(f0_unbalanced_magnitude_aclms(start:end)),'LineWidth',line_width);
hold off;
pranav_plot('Unbalanced, V_a=0.2, V_b=1, V_c=1.8','n','f_{o}',{'Complex LMS', 'Augmented Complex LMS'},[1 600 -10 250], 1);
% graph_saving('../report/images/part4/unbalanced_sys_clms_aclms_magnitude');
