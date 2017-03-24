% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Singular Value Decomposition

load('../data/PCR/PCAPCR.mat');

% rank of low-rank approximation
k=3;

% get sizes, will be used later to generate low rank approximation
[m,n]=size(Xnoise);

% perform svd
[Unoise,Snoise,Vnoise]=svd(Xnoise);

% get low rank approximation
Xnoise_low_rank=Unoise(1:m,1:k)*Snoise(1:k,1:k)*Vnoise(1:n,1:k)';

% forbenius norm of X-Xnoise
forbenius_noise=norm(X-Xnoise,'fro');

% forbenius norm of X-Xnoise_low_rank
forbenius_low_rank=norm(X-Xnoise_low_rank,'fro');



