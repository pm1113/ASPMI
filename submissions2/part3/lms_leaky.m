function [y_hat, e, coeffs] = lms_leaky(x, mu, gamma, order)
% x: input signal, no reference signal required
% mu: step size, learning rate
% order: estimated order

    % length of data
    N = length(x);
    
    % initialising matrix to hold coefficients
    coeffs = zeros(order, N-1);
    
    % initialising vector to hold output of identified system
    y_hat = zeros(N, 1);
    
    % initialising vector to hold error signal
    e = zeros(N, 1);
    
    % only start estimating once it has enough input data
    % 2nd order system will need at least 2 data points to start lms estimation
    for i = order+1:N
        
        % form vector that contains the revelant past samples
        % number of past samples depends on memory in the system
        % which in turn depends on the order of the system
        x_hat = x(i-1:-1:i-order);
        
        % estimate y using the equation W'x
        y_hat(i) = (coeffs(:, i-order).') * x_hat;
        
        % get error vector using e = z - y
        e(i) = x(i) - y_hat(i);
        
        % update the coefficients using
        % W(n+1) = (1 - mu * gamma)W(n) + mu * e * x(n)
        coeffs(:, i-order+1) = (1 - mu * gamma).*coeffs(:, i-order) + mu * e(i) * x_hat;
        
    end
    
end