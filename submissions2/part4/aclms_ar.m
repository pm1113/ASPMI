function [y_hat, e, h_coeffs, g_coeffs] = aclms_ar(x, mu, order)

    N = length(x);
    h_coeffs = zeros(order,N);
    g_coeffs = zeros(order,N);
    y_hat = zeros(1,N);
    e = zeros(N,1);
    
    for i = 1:N-1
      x_current = get_inputs(x,order-1,i-1);
      y_hat(i)= h_coeffs(:,i)'*x_current + g_coeffs(:,i)'*conj(x_current);     
      e(i) = x(i) - y_hat(i);  
      h_coeffs(:,i+1) = h_coeffs(:,i) + mu*conj(e(i))*x_current;
      g_coeffs(:,i+1) = g_coeffs(:,i) + mu*conj(e(i))*conj(x_current);
    end

  
end