function [xceps] = ceps(x)
    FX= fftshift(fft(x));
    xceps= ifftshift(ifft(log(abs(FX))+ 1i.*angle(FX)));
end

