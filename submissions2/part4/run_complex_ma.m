function y=run_complex_ma(b,a,w)
    
    N=length(w);
    y=zeros(1,N);
    w=[0 w];
    for i=1:N
        y(i)=a*w(i+1)+b(1)*w(i)+b(2)*conj(w(i));
    end
end
