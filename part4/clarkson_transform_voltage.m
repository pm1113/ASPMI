function v=clarkson_transform_voltage(N,f0,fs,phi,V_a,V_b,V_c,distortion_b,distortion_c)
    exponential=2*pi*f0*(1:N)/fs+phi;
    const=sqrt(6)./6;
    A_n=const * ( V_a + V_b * exp(1j * distortion_b) + V_c * exp(1j*distortion_c) );
    B_n=const * ( V_a + V_b * exp(-1j * ( distortion_b + (2*pi/3) ) ) + V_c * exp(-1j * ( distortion_c - (2*pi/3) )) );
    v=A_n.*exp(1j*exponential)+B_n.*exp(-1j*exponential);
end