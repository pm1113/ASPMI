function x  = cvoltgenerator (f_0, f_s, N, phi, d_b, d_c, V_a, V_b, V_c )


n = 1:N;

power = 2*pi*f_0*n/f_s + phi;

A_n = (sqrt(6)/6)*(V_a + V_b*exp(1j*d_b) + V_c*exp(1j*d_c));
B_n = (sqrt(6)/6)*(V_a + V_b*exp(-1j*(d_b+(2*pi/3))) + V_c*exp(-1j*(d_c - (2*pi/3))));

x  = A_n.*exp(1j*power) + B_n.*exp(-1j*power);

end