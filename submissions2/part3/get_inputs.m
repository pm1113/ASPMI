function x_current=get_inputs(x,order,n)

    % initalise vector to hold values
    x_current=zeros(order+1,1);
    
    for j=1:order+1,
        if((n-j) >= 0) 
            x_current(j,1) = x(n-j+1);
        else
            x_current(j,1) =0;                      
        end
    end
end