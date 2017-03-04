function [y_hat, e, h_coeffs, g_coeffs] = aclms(y, w, mu, order)
    N = length(w);
    h_coeffs = complex(zeros(order+1,N));
    g_coeffs = complex(zeros(order+1,N));
    y_hat = complex(zeros(1,N));
    e = complex(zeros(N,1));
    
    for i = 1:N
      x_current = get_inputs(w,order,i);
      y_hat(i)= h_coeffs(:,i)'*x_current + g_coeffs(:,i)'*conj(x_current);     
      e(i) = y(i) - y_hat(i);  
      h_coeffs(:,i+1) = h_coeffs(:,i) + mu*conj(e(i))*x_current;
      g_coeffs(:,i+1) = g_coeffs(:,i) + mu*conj(e(i))*conj(x_current);
    end
end