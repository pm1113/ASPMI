%% Zero-Padded Periodogram for alpha=0.89

N=256;
x=rectwin(N);

% length of fft
K=2^13;
xf=abs(fftshift(fft([x' zeros(1, K-N)])));
fs=-1:2/K:1-1/K;

% plot periodogram
figure(1)
plot(fs,pow2db(xf.^2./(N*2*pi)),'LineWidth',line_width);
axis([-0.01 0.06 -50 50])
set(gca,'fontsize',axis_font_size);
title('Bartlett Window at 4/N and 12/N','FontSize',title_font_size);
xlabel('Normalised Frequency (x \pi rad/sample)', 'FontSize', x_axis_font_size);
ylabel('Power/Frequency (dB/rad/sample)', 'FontSize', y_axis_font_size);
run('/Users/pranavmalhotra/ASPMI/utility_functions/scale_graph.m');
first=[4/N -200; 4/N 200];
hold on;
plot(first(:,1),first(:,2), 'LineWidth', line_width);
second=[12/N -200; 12/N 200];
plot(second(:,1),second(:,2),'LineWidth', line_width);
hold off;
legend('\fontsize{25}Bartlett Window', '\fontsize{25}4/N','\fontsize{25}12/N');
graph_saving('/Users/pranavmalhotra/ASPMI/report/images/part1/bartlett_amplitude');

