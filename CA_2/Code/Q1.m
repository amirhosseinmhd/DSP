[audio,fs] = audioread("y.wav");
L = length(audio);
f = fs.*((-L/2:L/2-1)/L);
%sound(audio,fs)
%pause(8)
plot(f, fftshift(abs(fft(audio))));
xlabel('Frequency')
ylabel('Absoulte Value of FFT')
title('Fourier Transform of Audio')

% Mese Inke Etelaate Phase Darnamayesh jaleb Nistand!
% figure(2)
% plot(f, fftshift(angle(fft(audio))));
% xlabel('Frequency')
% ylabel('Absoulte Value of FFT')
%%
%Finding Coefitions
clc
auto_corr = xcorr(audio,audio);
L = length(auto_corr);
x = -(L+1)/2+1 : (L+1)/2-1;

figure(2)
plot(x, auto_corr);
grid on
title('Auto Correlation of Signal')

%% Part G Removing Echo
b = 1;
a = [1, zeros(1, 5499), 0.3, zeros(1, 3499), 0.2];
y = filter(b, a, audio);
sound(y,fs);
audiowrite('y_Without Echo.wav', y,fs)
pause(8)
%% PART H,G
freqz(Hd)
filtered_signal = filter(Hd, y);
sound(filtered_signal,fs);
pause(8)
audiowrite('y_removedEcho_removedNoise.wav', y,fs)



%% Part I

figure(4)
subplot(2,1,1);
plot(f, fftshift(abs(fft(filtered_signal))));
title('Frequency Response of Filtered Signal')
xlabel('Frequency')
ylabel('Absoulte Value of FFT')
grid on
subplot(2,1,2);
plot(f, fftshift(abs(fft(y))));
title('Frequency Response of Original Signal')
xlabel('Frequency')
grid on
ylabel('Absoulte Value of FFT')
%%
%Time Domain
L = length(filtered_signal);
x = 1 : L;
x = x/L*8;

figure(6)
subplot(2,1,1);

plot(x,filtered_signal)
title('Filtered Signal in Time Domain')
xlabel('Time')
ylabel('Value')
subplot(2,1,2);
plot(x,y)
xlabel('Time')
ylabel('Value')
title('Original Signal in Time Domain')



figure(7)
subplot(2,1,1);

plot(x,filtered_signal)
title('Filtered Plot in Time Domain 3.805 to 3.81 seconds')
xlabel('Time')
ylabel('Value')
xlim([3.805 3.81]);grid on

subplot(2,1,2);
plot(x,y)
xlabel('Time')
ylabel('Value')
title('Original Plot in Time Domain 3.805 to 3.81 seconds')
xlim([3.805 3.81])
grid on


%% Designing another Lowpass filter
freqz(chebysev)
filtered_signal = filter(chebysev, y);
sound(filtered_signal,fs);
pause(8)
audiowrite('y_removedEcho_removedNoise_AnotherFIR FIlTER.wav', y,fs)

figure(4)
subplot(2,1,1);
plot(f, fftshift(abs(fft(filtered_signal))));
title('Frequency Response of Filtered Signal')
xlabel('Frequency')
ylabel('Absoulte Value of FFT')
grid on
subplot(2,1,2);
plot(f, fftshift(abs(fft(y))));
title('Frequency Response of Original Signal')
xlabel('Frequency')
grid on
ylabel('Absoulte Value of FFT')