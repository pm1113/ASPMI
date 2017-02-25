% Created by Pranav Malhotra, 23 Feburary 2017
% ASPMI: Part 1, Question 2.1 a
%% Pre Plotting Variable Checking
run('../utility_functions/pre_plotting_variables_checker.m')

%% Comparing Oridinary Least Squares Estimate and Principal Component Regression Results

load('../data/PCR/PCAPCR.mat');

% rank of low-rank approximation
k=3;

% get sizes, will be used later to generate low rank approximation
[m,n]=size(Xnoise);

% perform svd
[Unoise,Snoise,Vnoise]=svd(Xnoise);

% get low rank approximation
Xnoise_low_rank=Unoise(1:m,1:k)*Snoise(1:k,1:k)*Vnoise(1:n,1:k)';

% perform pricipal component regression
b_pcr=Vnoise(1:n,1:k)*(Snoise(1:k,1:k)^(-1))*Unoise(1:m,1:k)'*Y;

% obtain y_pcr using b_pcr
Y_pcr=Xnoise_low_rank*b_pcr;

% forbenius norm of y-y_pcr
forbenius_pcr=norm(Y-Y_pcr,'fro');

% perform ordinary least squares 
b_ols=(X'*X)\X'*Y;

% obtain y_ols using b_ols
Y_ols=Xnoise*b_ols;

% forbenius norm of y-y_pcr
forbenius_ols=norm(Y-Y_ols,'fro');

%% work on test data

% obtain Ytest_ols using b_ols
Ytest_ols=Xtest*b_ols;

% forbenius norm of Ytest-Ytest_ols
forbenius_test_ols=norm(Ytest-Ytest_ols,'fro');

% obtain low rank approximation of Xtest
[Utest,Stest,Vtest]=svd(Xtest);
% get low rank approximation
Xtest_low_rank=Utest(1:m,1:k)*Stest(1:k,1:k)*Vtest(1:n,1:k)';

% obtain Ytest_pcr using b_pcr and Xtest_low_rank
Ytest_pcr=Xtest_low_rank*b_pcr;

% forbenius norm of Ytest-Ytest_pcr
forbenius_test_pcr=norm(Ytest-Ytest_pcr,'fro');

%% Evalute b_pcr and b_ols

rng(0);

% add path of regval
addpath(genpath('../data/PCR/'));

num_realisations=100;
mse=zeros(2,num_realisations);

for i=1:num_realisations
    % get Y and Y_ols
    [Y,Y_ols]=regval(b_ols);
    mse(1,i)=norm(Y-Y_ols,'fro')^2;
    
    % get Y and Y_pcr
    [Y,Y_pcr]=regval(b_pcr);
    mse(2,i)=norm(Y-Y_pcr,'fro')^2;
end

% find expected values of differences
expected_mse=mean(mse,2);
