w=wgn(100,1,1);
w_cor_unbiased=xcorr(w,'unbiased');
W_unbiased=toeplitzde(w_cor_unbiased(100:end));


w_cor_biased=xcorr(w,'biased');
W_biased=toeplitz(w_cor_biased(100:end));

