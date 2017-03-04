% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.1 c
%% 

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% sine wave parameters
f0=50;
fs=10000;
N=1000;

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
distortion_b_unbalanced = [pi/2 pi/3 pi/5 pi/7];
distortion_c_unbalanced = [pi/3 pi/4 pi/6 pi/8];
% initialise holder variable
v_unbalanced_distortion = complex(zeros(N,length(distortion_b)));

for i=1:length(distortion_c_unbalanced)
    v_unbalanced_distortion(:,i)=clarkson_transform_voltage(N,f0,fs,phi_phase_shift,V_a,V_b,V_c,distortion_b_unbalanced(i),distortion_c_unbalanced(i));
end

% unbalance because of magnitude
voltage_multipliers=[0.8 1 1.2;0.6 1 1.4;0.4 1 1.6;0.2 1 1.8];
% initialise holder variable
v_unbalanced_magnitude = complex(zeros(N,length(voltage_multipliers)));

for i=1:length(voltage_multipliers)
    v_unbalanced_magnitude(:,i)=clarkson_transform_voltage(N,f0,fs,phi_phase_shift,V_a*voltage_multipliers(i,1),V_b*voltage_multipliers(i,2),V_c*voltage_multipliers(i,3),distortion_b,distortion_c);
end

%% Plot the balanced signal
figure(1)
plot(real(v_balanced), imag(v_balanced), 'o','LineWidth',line_width);
pranav_plot_no_legend('Balanced Signal', 'Real Part, \Re', 'Imaginary Part, \Im', [-2.5 2.5 -2.5 2.5], 1);
graph_saving('../report/images/part4/balanced_signal');

%% Plot Unbalanced Signals because of Distortion
figure(2)
plot(real(v_unbalanced_distortion(:,1)), imag(v_unbalanced_distortion(:,1)), 'o','LineWidth',line_width);
hold on;
plot(real(v_unbalanced_distortion(:,2)), imag(v_unbalanced_distortion(:,2)), 'o','LineWidth',line_width);
plot(real(v_unbalanced_distortion(:,3)), imag(v_unbalanced_distortion(:,3)), 'o','LineWidth',line_width);
plot(real(v_unbalanced_distortion(:,4)), imag(v_unbalanced_distortion(:,4)), 'o','LineWidth',line_width);
hold off;
pranav_plot_no_legend('Unbalanced: Phase Distortions', 'Real Part, \Re', 'Imaginary Part, \Im', [-2.5 2.5 -2.5 2.5], 1);
h = legend({'$\Delta_{b}=\frac{\pi}{2}, \ \Delta_{c}=\frac{\pi}{3}$', '$\Delta_{b}=\frac{\pi}{3}, \ \Delta_{c}=\frac{\pi}{4}$', '$\Delta_{b}=\frac{\pi}{5}, \ \Delta_{c}=\frac{\pi}{6}$', '$\Delta_{b}=\frac{\pi}{7}, \ \Delta_{c}=\frac{\pi}{8}$'}, 'FontSize', 25);
set(h,'Interpreter','latex');
% graph_saving('../report/images/part4/unbalanced_phase_distortion');

%% Plot Unbalanced Signals because of Magnitude
figure(2)
plot(real(v_unbalanced_magnitude(:,1)), imag(v_unbalanced_distortion(:,1)), 'o','LineWidth',line_width);
hold on;
plot(real(v_unbalanced_magnitude(:,2)), imag(v_unbalanced_distortion(:,2)), 'o','LineWidth',line_width);
plot(real(v_unbalanced_magnitude(:,3)), imag(v_unbalanced_distortion(:,3)), 'o','LineWidth',line_width);
plot(real(v_unbalanced_magnitude(:,4)), imag(v_unbalanced_distortion(:,4)), 'o','LineWidth',line_width);
hold off;
pranav_plot_no_legend('Unbalanced: Magnitude Distortions', 'Real Part, \Re', 'Imaginary Part, \Im', [-2.5 2.5 -2.5 2.5], 1);
h = legend({'$V_a = 0.8, \ V_b = 1, \ V_c = 1.2$', '$V_a = 0.6, \ V_b = 1, \ V_c = 1.4$', '$V_a = 0.4, \ V_b = 1, \ V_c = 1.4$', '$V_a = 0.2, \ V_b = 1, \ V_c = 1.8$' }, 'FontSize', 25);
set(h,'Interpreter','latex');
% graph_saving('../report/images/part4/unbalanced_magnitude_distortion');

% HeightScaleFactor = 1.5;
% NewHeight = h.Position(4) * HeightScaleFactor;
% h.Position(2) = h.Position(2) - (NewHeight - h.Position(4));
% h.Position(4) = NewHeight;

