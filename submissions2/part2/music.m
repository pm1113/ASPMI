% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% f0=0.3, f1=0.32, n=30
rng(1);

n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

[~,R] = corrmtx(x,14,'mod');
[S,F] = pmusic(R,2,[ ],1,'corr');
figure(1);
plot(F,S,'linewidth',line_width); set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.3, f1=0.32, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/music_2_sinewaves_n_30');


%% f0=0.3, f1=0.32, n=30, overlay of plots
rng(1);

iter=100;
S=zeros(iter,256);
figure(2);
for i=1:iter
n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;
[~,R] = corrmtx(x,14,'mod');
[S(i,:),F] = pmusic(R,2,[ ],1,'corr');
s=plot(F,S(i,:),'linewidth',line_width,'Color',[0.3010 0.7450 0.9330]);
if(i==2)
    hold on;
end
end
m=plot(F,mean(S),'linewidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold off;
set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.3, f1=0.32, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
% graph_saving('../report/images/part2/music_2_sinewaves_n_30_overlay');

%% f0=0.30, f1=0.32 f2=0.35, n=30
rng(1);

n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+exp(1j*2*pi*0.35*n)+noise;

[~,R] = corrmtx(x,14,'mod');
[S,F] = pmusic(R,3,[ ],1,'corr');
figure(3);
plot(F,S,'linewidth',line_width); set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.30, f1=0.32, f2=0.35, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/music_3_sine_waves_n_30');


%% f0=0.30, f1=0.32 f2=0.35, n=30, overlay of plot
rng(1);

iter=100;
S=zeros(iter,256);
figure(4);
for i=1:iter
n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+exp(1j*2*pi*0.35*n)+noise;
[~,R] = corrmtx(x,14,'mod');
[S(i,:),F] = pmusic(R,3,[ ],1,'corr');
s=plot(F,S(i,:),'linewidth',line_width,'Color',[0.3010 0.7450 0.9330]);
if(i==2)
    hold on;
end
end
m=plot(F,mean(S),'linewidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold off;
set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.30, f1=0.32, f2=0.35, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
% graph_saving('../report/images/part2/music_3_sinewaves_n_30_overlay');

%% f0=0.30, f1=0.32 f2=0.35, n=70
rng(1);

n = 0:70;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+exp(1j*2*pi*0.35*n)+noise;

[~,R] = corrmtx(x,14,'mod');
[S,F] = pmusic(R,3,[ ],1,'corr');
figure(5)
plot(F,S,'linewidth',line_width); set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.30, f1=0.32, f2=0.35, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
% graph_saving('../report/images/part2/music_3_sine_waves_n_70');

%% f0=0.30, f1=0.32 f2=0.35, n=70, overlay of Plots
rng(3);

iter=100;
S=zeros(iter,256);
figure(6);
for i=1:iter
n = 0:70;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+exp(1j*2*pi*0.35*n)+noise;
[~,R] = corrmtx(x,14,'mod');
[S(i,:),F] = pmusic(R,3,[ ],1,'corr');
s=plot(F,S(i,:),'linewidth',line_width,'Color',[0.3010 0.7450 0.9330]);
if(i==2)
    hold on;
end
end
m=plot(F,mean(S),'linewidth',line_width,'Color',[0.8500 0.3250 0.0980]);
hold off;
set(gca,'xlim',[0.25 0.40]);
set(gca,'fontsize',axis_font_size);
title('f0=0.30, f1=0.32, f2=0.35, n=30','FontSize',title_font_size);
xlabel('Frequency (Hz)', 'FontSize', x_axis_font_size);
ylabel('Pseudospectrum', 'FontSize', y_axis_font_size);
run('../utility_functions/scale_graph.m');
legend([s m],{'Random Realisation','Mean of All Realisations'},'FontSize',25);
% graph_saving('../report/images/part2/music_3_sinewaves_n_70_overlay');
