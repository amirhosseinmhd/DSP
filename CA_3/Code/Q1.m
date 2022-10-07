clear; clc;
[my_audio, Fs] = audioread('sonata.mp3');
channel_one = my_audio(: ,1 );
channel_two = my_audio(: ,2 );
[len_samples,~] = size(channel_one);
duration = len_samples / Fs;

time = (0:1 : len_samples-1)./len_samples.*duration; 
plot(time, channel_one,time, channel_two);
legend('Channel One', 'Channel Two')
xlabel('Time');
ylabel('Amplitude')
grid on;


%% Fourier of Signal

F_channel_one = fftshift(fft(channel_one));
F_channel_one = abs(F_channel_one );
%fft is symmetric so we one side of it is enough
F_channel_one_half = F_channel_one(len_samples/2:len_samples-1);

F_channel_two = fftshift(fft(channel_two));
F_channel_two = abs(F_channel_two);  
F_channel_two_half = F_channel_two(len_samples/2:len_samples-1);

norm_freq = linspace(0, 1, len_samples/2);
freq = norm_freq * Fs;
plot(freq, F_channel_one_half, freq, F_channel_two_half);
legend('Channel One', 'Channel Two')
grid on;
%%
S_F = F_channel_one_half.*conj(F_channel_one_half);
figure
plot(freq, S_F)
xlabel('Frequency');
ylabel('|Amplitude|^2');
grid on
title('Spectral Density of Signal');
%%
figure
spectrogram(channel_one,512,130,256,Fs,'centered','yaxis')
