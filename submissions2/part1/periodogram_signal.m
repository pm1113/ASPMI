% Created by Pranav Malhotra, 4 Feburary 2017
% ASPMI: Part 1, Question 1.3 b
function x=periodogram_signal(N, f0, var, alpha, a1, a2, phi_1, phi_2)
    
    n=0:1:N-1;
    x=a1*sin(f0*2*pi*n+ones(1,N)*phi_1)+a2*sin((f0+alpha/N)*2*pi*n+ones(1,N)*phi_2)+randn(1,N)*sqrt(var);
    
end