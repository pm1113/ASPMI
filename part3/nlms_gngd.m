function [y, e, estimated_coeffs] = nlms_gngd(x, z, mu, rho, order)
    N = length(x);
    estimated_coeffs = zeros(N,order+1);
    y = zeros(N-1, 1);
    e = zeros(N-1, 1);
    reg_fact=ones(N, 1);
    for i = 2:N-1
        x_hat=get_inputs(x,order,i);
        y(i) = x_hat'*estimated_coeffs(i,:)';
        e(i) = z(i) - y(i);
        estimated_coeffs(i+1,:) = estimated_coeffs(i,:) + (1 / (reg_fact(i) + x_hat' * x_hat) ) * e(i) * x_hat';        
        x_hat_hat=get_inputs(x,order,i-1);
        reg_fact(i+1) = reg_fact(i) + rho * mu * ((e(i) * e(i-1) * x_hat' * x_hat_hat) / (reg_fact(i-1) + x_hat_hat' * x_hat_hat).^2);
    end
    estimated_coeffs = estimated_coeffs(:,2:end);
end

