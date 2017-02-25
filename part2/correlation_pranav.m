% Created by Pranav Malhotra, 23 Feburary 2017
% Function will calculate correlogram spectral estimators based on biased
% and unbiased estimators of ACF
function [r,lag,Pxx,fs] = correlation_pranav(x,bias)
    % calculate auto correlation
    [r,lag]=xcorr(x,bias);
    % make autocorrelation symmetric
    int = ifftshift(r);
    % get power spectrum
    Pxx = real(fftshift(fft(int)))./(2*pi);
    % normalised frequency
    fs=lag./max(lag);
end