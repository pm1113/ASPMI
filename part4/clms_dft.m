function [y_hat, e, w_coeffs]=clms_dft(y, mu, K, gamma)
    N=length(y);
    w_coeffs=zeros(K,N);
    k=0:K-1;
    y_hat=zeros(1,N-1);
    e=zeros(1,N-1);
    
    for i=1:N-1
        x=(1/K)*exp(1j*2*i*pi*k/K).';
        y_hat(i)=w_coeffs(:,i)'*x;
        e(i)=y(i)-y_hat(i);
        w_coeffs(:,i+1)=(1-gamma*mu)*w_coeffs(:,i) + mu*conj(e(i))*x;  
    end
end
