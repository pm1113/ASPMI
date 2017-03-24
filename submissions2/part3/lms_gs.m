function [y, e, estimated_coeffs] = lms_gs(x, z, initial_mu, rho, order, algo)

    N = length(x);
    estimated_coeffs = zeros(N,order+1);   
    y = zeros(N-1, 1);    
    e = zeros(N-1, 1);
    mu = ones(N, 1) * initial_mu; 
    phi = zeros(order+1, 1);
    
    for i = 1:N-1
        x_hat=get_inputs(x,order,i);
        y(i) = x_hat'*estimated_coeffs(i,:)';
        e(i) = z(i) - y(i);   
        estimated_coeffs(i+1,:) = estimated_coeffs(i,:) + mu(i)*e(i)*x_hat';
        mu(i+1) = mu(i) + rho * e(i) * x_hat' * phi;
        
        switch algo
            case 'ben' 
                phi = (eye(order) - mu(i) * (x_hat)' * x_hat) * phi + e(i) * x_hat;
            case 'ang'
                phi = 0.8 * phi + e(i) * x_hat;
            case 'mat'
                phi = e(i) * x_hat;                 
        end 
    end
    
    estimated_coeffs = estimated_coeffs(:,2:end);

end

