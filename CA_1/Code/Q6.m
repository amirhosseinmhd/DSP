close all;
[my_audio_ch, fs] = audioread('Irane_Man.mp3');
my_audio = ( my_audio_ch(:, 2) + my_audio_ch(:, 1))/2;
 sample = my_audio(26*fs:31*fs);
 sound(sample,fs);
 pause(6)
 sound(sample,fs/2);
 pause(11)
 sound(sample,2*fs);
 pause(5)


%Part D, Finding Frequency Analysis of music
f_sample = fftshift(fft(sample));
L = length(sample);
f = fs.*((-L/2:L/2-1)/L);
abs_f = abs(f_sample);
figure;
plot(f, abs_f);title('Audio Sample in Frequency Domain'); 
xlabel('Frequency'); ylabel('Amplitude'); grid on;





%Part E Decimating Signal and Plotting in Frequency Domian
dec_M2_sample = my_downsample(sample, 2);
dec_M5_sample = my_downsample(sample, 5);
dec_M6_sample = my_downsample(sample, 6);

%Frequency Response For M = 2.
f_M2 = fftshift(fft(dec_M2_sample));
abs_f_M2 = abs(f_M2);
L_M = length(f_M2);
freq_M2 = fs.*((-L_M/2:L_M/2-1)/L_M);
figure
subplot(311)
plot(freq_M2, abs_f_M2);
title(' Decimated Signal in Frequency Domain for M = 2')
xlabel('Frequecny')
ylabel('Amplitude')
grid on
%Frequency Response For M = 5.
f_M5 = fftshift(fft(dec_M5_sample));
abs_f_M5 = abs(f_M5);
L_M5 = length(f_M5);
freq_M5 = fs.*((-L_M5/2:L_M5/2-1)/L_M5);
subplot(312)
plot(freq_M5, abs_f_M5)
title(' Decimated Signal in Frequency Domain for M = 5')
xlabel('Frequecny')
ylabel('Amplitude')
grid on


%Frequency Response For M = 6.
f_M6 = fftshift(fft(dec_M6_sample));
abs_f_M6 = abs(f_M6);
L_M6 = length(f_M6);
freq_M6 = fs.*((-L_M6/2:L_M6/2-1)/L_M6);
subplot(313)
plot(freq_M6, abs_f_M6)
title(' Decimated Signal in Frequency Domain for M = 6')
xlabel('Frequecny')
ylabel('Amplitude')
grid on





%%%%%%%%%%%%%%%PART F
%%%%Upsampling
up_M2_sample = my_upsample(sample, 2);
up_M5_sample = my_upsample(sample, 5);
up_M6_sample = my_upsample(sample, 6);
%Frequency Response For M = 3.
f_M2 = fftshift(fft(up_M2_sample));
abs_f_M2 = abs(f_M2);
L_M = length(f_M2);
freq_M2 = fs.*((-L_M/2:L_M/2-1)/L_M);
figure
subplot(311)
plot(freq_M2, abs_f_M2);
title(' Upsampled Signal in Frequency Domain for M = 2')
xlabel('Frequecny')
ylabel('Amplitude')
grid on
%Frequency Response For M = 5.
f_M5 = fftshift(fft(up_M5_sample));
abs_f_M5 = abs(f_M5);
L_M5 = length(f_M5);
freq_M5 = fs.*((-L_M5/2:L_M5/2-1)/L_M5);
subplot(312)
plot(freq_M5, abs_f_M5)
title(' Upsampled Signal in Frequency Domain for M = 5')
xlabel('Frequecny')
ylabel('Amplitude')
grid on


%Frequency Response For M = 6.
f_M6 = fftshift(fft(up_M6_sample));
abs_f_M6 = abs(f_M6);
L_M6 = length(f_M6);
freq_M6 = fs.*((-L_M6/2:L_M6/2-1)/L_M6);
subplot(313)
plot(freq_M6, abs_f_M6)
title(' Upsampled Signal in Frequency Domain for M = 6')
xlabel('Frequecny')
ylabel('Amplitude')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%I wrote This part for M = 2
up_M2_sample_new = up_M2_sample;
for i = 1 : length(up_M2_sample_new)
    if mod(i,2) == 0
        up_M2_sample_new(i) = (up_M2_sample(i-1) + up_M2_sample(i+1))/2;
    end
end

sound(up_M2_sample,2*fs)
pause(6)
sound(up_M2_sample_new,2*fs)





%for interpolating signal we cut frequency higher than 15k
% my_lowpass = ones(1, length(freq_M2));
% my_lowpass(:) = 0.2;
% my_lowpass(100000:350000) = 1;
% figure;
% plot(freq_M2, my_lowpass)
% M2_NEW = up_M2_sample.*my_lowpass;
% plot(freq_M2, abs(fftshift(fft(M2_NEW))))
% close all;
% %sound(up_M2_sample,2*fs);
% 
% lowpass = sinc(freq_M2/10000);
% in = conv(up_M2_sample, lowpass);
% in = in(4.3 * 10^5:4.6 * 10^5); 
% L = length (in);
% freq = 2*fs* (-L/2:L/2-1);
% figure;plot( abs(fftshift(fft(in))));
% 
%  sound(in,2*fs);
%lowpass(up_M2_sample,1,9000,2*fs);
%figure;plot( abs(fftshift(fft(in))));
% 