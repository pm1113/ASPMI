% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 a
%% Pre Plotting Variable Checking
run('/Users/pranavmalhotra/ASPMI/utility_functions/pre_plotting_variables_checker.m')

%% Find the empirical relation between Mainlobe 3dB Point

K=2^20;
N=2.^(6:13);
side_lobe_peak=zeros(1,length(N));

for i=1:length(N)
    n=N(i);
    bw=bartlett(n);
    bwf=abs(fftshift(fft([bw' zeros(1,K-n)])));
    fs=-1:2/K:1-1/K;
    [pks,locs] = findpeaks(mag2db(bwf));
    [peak,index]=sort(pks,'descend');
    side_lobe_peak(i)=peak(2)-peak(1);
end

figure(1)
plot(N,round(side_lobe_peak,1),'.-','MarkerSize',30, 'LineWidth',line_width);
ylim([-30 -23]);
set(gca,'fontsize',axis_font_size);
title('Peak of Sidelobes vs N','FontSize',title_font_size);
xlabel('Length of Window, N', 'FontSize', x_axis_font_size);
ylabel('Magnitude (dB)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_empirical_side_lobe');