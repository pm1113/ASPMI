% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 a
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Find the empirical relation between Mainlobe 3dB Point

K=8192;
N=2.^(6:10);
intersection_points=zeros(2,length(N));

for i=1:length(N)
    n=N(i);
    bw=bartlett(n);
    [h,w]=freqz(bw,1,K);
%     bwf=abs(fftshift(fft([bw' zeros(1,K-n)])));
    % normalise
    bwf=abs(h);
    bwf=bwf./max(bwf);
    fs=-1:2/K:1-1/K;
    y=ones(1,length(fs))./sqrt(2);
    inter=InterX([fs;mag2db(bwf')],[fs;mag2db(y)]);
    intersection_points(:,i)=inter(:,2);
end

%% Plot Relationship for Normalised Frequency vs N

load bartlett_empirical.mat;
figure(1)
plot(N,intersection_points(1,:),'.-','MarkerSize',30, 'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Empirical 3 dB width vs N','FontSize',title_font_size);
xlabel('Length of Window, N', 'FontSize', x_axis_font_size);
ylabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_empirical_vs_N');

%% Plot Relationship for Normalised Frequency vs 1/N

% load bartlett_empirical.mat;
figure(2)
plot(1./N,intersection_points(1,:),'.-','MarkerSize',30, 'LineWidth',line_width);
set(gca,'fontsize',axis_font_size);
title('Empirical 3 dB width vs 1/N','FontSize',title_font_size);
xlabel('Inverse of Length of Window, 1/N', 'FontSize', x_axis_font_size);
ylabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_empirical_vs_1_over_N');


%% Find the linear Relationship between 1/N and Normalised Frequency

% load bartlett_empirical.mat;
y=intersection_points(1,:)';
X=[(1./N)' ones(length(N),1)];
w=pinv(X)*y;
