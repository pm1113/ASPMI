% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Question 4.1 b
%% Analysis of Wind Signals for Low, Medium and High Speeds

run('../utility_functions/pre_plotting_variables_checker.m')
rng(0);
load ../data/colors.mat

% generate complex signal for low wind
load ../data/wind-dataset/low-wind.mat
low_wind=complex(v_east,v_north);

% generate complex signal for medium wind
load ../data/wind-dataset/medium-wind.mat
medium_wind=complex(v_east,v_north);

% generate complex signal for high wind
load ../data/wind-dataset/high-wind.mat
high_wind=complex(v_east,v_north);

max_lim=10;
% generate circularity Values
low_wind_mean_real=mean(real(low_wind));
low_wind_vert_x=[low_wind_mean_real low_wind_mean_real];
low_wind_vert_y=[-max_lim max_lim];
low_wind_mean_imag=mean(imag(low_wind));
low_wind_hor_x=[-max_lim max_lim];
low_wind_hor_y=[low_wind_mean_imag low_wind_mean_imag];
low_wind_mean = abs(mean((low_wind).^2)/mean(abs(low_wind).^2));

medium_wind_mean =abs( mean((medium_wind).^2)/mean(abs(medium_wind).^2));
medium_wind_mean_real=mean(real(medium_wind));
medium_wind_vert_x=[medium_wind_mean_real medium_wind_mean_real];
medium_wind_vert_y=[-max_lim max_lim];
medium_wind_mean_imag=mean(imag(medium_wind));
medium_wind_hor_x=[-max_lim max_lim];
medium_wind_hor_y=[medium_wind_mean_imag medium_wind_mean_imag];

high_wind_mean =abs( mean((high_wind).^2)/mean(abs(high_wind).^2));
high_wind_mean_real=mean(real(high_wind));
high_wind_vert_x=[high_wind_mean_real high_wind_mean_real];
high_wind_vert_y=[-max_lim max_lim];
high_wind_mean_imag=mean(imag(high_wind));
high_wind_hor_x=[-max_lim max_lim];
high_wind_hor_y=[high_wind_mean_imag high_wind_mean_imag];

% length of data
N=length(low_wind);

% define center lines
x_vert=[0 0]; y_vert=[-10 10];
x_hor=[-10 10]; y_hor=[0 0];

% define algorithm parameters
mu=[0.001 0.0025 0.005 0.0075 0.0001];
order=1:30;

% initialise variable to start 
mpse_clms=zeros(3,length(order),length(mu));
mpse_aclms=zeros(3,length(order),length(mu));

for i=1:length(mu)
    for j=1:length(order)
        [~,e]=clms_ar(low_wind,mu(i),order(j));
        mpse_clms(1,j,i)=sum(abs(e).^2)./N;
        [~,e]=clms_ar(medium_wind,mu(i),order(j));
        mpse_clms(2,j,i)=sum(abs(e).^2)./N;
        [~,e]=clms_ar(high_wind,mu(i),order(j));
        mpse_clms(3,j,i)=sum(abs(e).^2)./N;
        
        [~,e]=aclms_ar(low_wind,mu(i),order(j));
        mpse_aclms(1,j,i)=sum(abs(e).^2)./N;
        [~,e]=aclms_ar(medium_wind,mu(i),order(j));
        mpse_aclms(2,j,i)=sum(abs(e).^2)./N;
        [~,e]=aclms_ar(high_wind,mu(i),order(j));
        mpse_aclms(3,j,i)=sum(abs(e).^2)./N;
    end
end

%% Scatter Plot for Low Wind
figure(1);
plot(real(low_wind),imag(low_wind),'o','LineWidth', line_width);
hold on;
plot([-5 5],[0 0],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot([0 0],[-5 5],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot(low_wind_hor_x,low_wind_hor_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
plot(low_wind_vert_x,low_wind_vert_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
hold off;
str=sprintf('Low Wind, Circularity=%.3f', low_wind_mean);
pranav_plot_no_legend(str, 'v_{east}[n]', 'v_{north}[n]', [-4 4 -4 4], 1);
% graph_saving('../report/images/part4/circularity_low_wind');

%% Scatter Plot for Medium Wind
figure(2);
plot(real(medium_wind),imag(medium_wind),'o','LineWidth', line_width);
hold on;
plot([-5 5],[0 0],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot([0 0],[-5 5],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot(medium_wind_hor_x,medium_wind_hor_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
plot(medium_wind_vert_x,medium_wind_vert_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
hold off;
str=sprintf('Medium Wind, Circularity=%.3f', medium_wind_mean);
pranav_plot_no_legend(str, 'v_{east}[n]', 'v_{north}[n]', [-4 4 -4 4], 1);
% graph_saving('../report/images/part4/circularity_medium_wind');

%% Scatter Plot for High Wind
figure(3);
plot(real(high_wind),imag(high_wind),'o','LineWidth', line_width);
hold on;
plot([-5 5],[0 0],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot([0 0],[-5 5],'--','LineWidth', line_width*2, 'Color', colors(3,:));
plot(high_wind_hor_x,high_wind_hor_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
plot(high_wind_vert_x,high_wind_vert_y,'--','LineWidth', line_width*1.5, 'Color', colors(2,:));
hold off;
str=sprintf('High Wind, Circularity=%.3f', high_wind_mean);
pranav_plot_no_legend(str, 'v_{east}[n]', 'v_{north}[n]', [-4 4 -4 4], 1);
% graph_saving('../report/images/part4/circularity_high_wind');

%% Plot of Filter Orders for Low Wind
figure(4)
plot(order,pow2db(mpse_clms(1,:,5)),'-o','LineWidth',line_width);
hold on;
plot(order,pow2db(mpse_aclms(1,:,5)),'-o','LineWidth',line_width);
hold off;
pranav_plot('Low Wind: \mu=0.0001', 'Filter Order', 'MPSE (dB)', {'Complex LMS', 'Augmented Complex LMS'},[0 30 -16 -14], 1);
% graph_saving('../report/images/part4/filt_order_low_wind');

%% Plot of Filter Orders for Medium Wind
figure(5)
plot(order,pow2db(mpse_clms(2,:,3)),'-o','LineWidth',line_width);
hold on;
plot(order,pow2db(mpse_aclms(2,:,3)),'-o','LineWidth',line_width);
hold off;
pranav_plot('Medium Wind: \mu=0.005', 'Filter Order', 'MPSE (dB)', {'Complex LMS', 'Augmented Complex LMS'},[0 30 -12 -11.4], 1);
% graph_saving('../report/images/part4/filt_order_medium_wind');

%% Plot of Filter Orders for High Wind
figure(6)
plot(order,pow2db(mpse_clms(3,:,1)),'-o','LineWidth',line_width);
hold on;
plot(order,pow2db(mpse_aclms(3,:,1)),'-o','LineWidth',line_width);
hold off;
pranav_plot('High Wind: \mu=0.001', 'Filter Order', 'MPSE (dB)', {'Complex LMS', 'Augmented Complex LMS'},[0 30 -5.75 -4.75], 1);
% graph_saving('../report/images/part4/filt_order_high_wind');
