%Amirhossein Mohammadi
%5.11.2021


%%
%Part A; Finding even and odd part of signal
clear;clc;close all
syms i
L = 20;
n = -L/2:1:L/2;
f = @(x) ((1/2).^x).*heaviside(x + 0.5);
signal = f(n);
sig_even = (signal + fliplr(signal))/2;
sig_odd = (signal -  fliplr(signal))/2;

m = 2^nextpow2(L);
%m = 21;


frequency = linspace(-pi, pi, m);
figure
subplot(2, 1, 1)
stem(n, sig_even);
title('Even Part of Signal');
grid on
subplot(2, 1, 2);
stem(n, sig_odd);
title('Odd Part of Signal');
grid on

%Part B Evaluting Fourier Transform of Odd And Even Part of Signal
f_y = fft(signal, m);
f_y_e = fft(sig_even, m);
f_y_o = fft(sig_odd, m);
abs_f_y_o = abs(f_y_o);
abs_f_y_e = abs(f_y_e);
figure
p = plot( frequency, abs_f_y_o, frequency, abs_f_y_e);
p(1).LineWidth = 2;
p(2).Marker = '*';
grid on
legend('Odd Part of Signal', 'Even Part of Signal')
xlabel('Frequency')
ylabel('Absoulte Value of Signal')
title(' Fourier Transform of Even and Odd Part of Signal without Performing FFTSHIFT')


abs_f_y_e_shifted = fftshift(abs_f_y_e);
abs_f_y_o_shifted = fftshift(abs_f_y_o);
figure
p = plot( frequency, abs_f_y_o_shifted, frequency, abs_f_y_e_shifted);
p(1).LineWidth = 2;
p(2).Marker = '*';
grid on
legend('Odd Part of Signal', 'Even Part of Signal')
xlabel('Frequency')
ylabel('Absoulte Value of Signal')
title(' Fourier Transform of Even and Odd Part of Signal with Performing FFTSHIFT')
set(gca,'XTick',-pi:pi/2:2*pi)  
set(gca,'XTickLabel',{'-\pi ','-\pi/2','0','\pi/2','\pi'})
ylim([-0.5, 2])


%Part C Evaluating Error of Signal
figure
P_error =  abs(f_y - f_y_e - f_y_o).^2;
plot(frequency, P_error);
xlabel('Frequency')
ylabel('P_e')
title('P_e by Frequency')
set(gca,'XTick',-pi:pi/2:2*pi)  
set(gca,'XTickLabel',{'-\pi ','-\pi/2','0','\pi/2','\pi'})
grid on
sum(P_error)
