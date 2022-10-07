clear;clc;close all;
img = imread('iran_flag.jpg');
img_gs = rgb2gray(img);
figure;imshow(img_gs);title('Image in Gray Scale');
f_img = fftshift(fft2(img_gs));
%For showing density we scale it to logarithmic ratio
f_img_log = log(1+abs(f_img));
figure;imshow(f_img_log,[]);title('Frequency Domain of Image');

%Part C
%%%%%%adding noise to picture

%[row, colomn] = size(img_gs);
%noise = wgn(row, colomn, 70);
figure(3);
noisy_img = imnoise(img_gs, 'gaussian', 0, 0.01);
imshow(noisy_img);title('Noisy Picture With Noise Power of 0.1') 
%finding SNR of picture
[row, colomn] = size(img_gs);
p_img = sum(img_gs.^2, 'all')/(row.*colomn);
p_noise = sum((noisy_img - img_gs).^2, 'all')/(row.*colomn);
snr =(p_img/p_noise);


%Part D
f_noisy_img = fftshift(fft2(noisy_img));
f_noisy_img_log = log(1+abs(f_noisy_img));
figure(4);imshow(f_noisy_img_log,[]);title('Frequency Domain of Noisy Image With Power 0.01');


%%%Noise Power 1
figure(5);
noisy_img = imnoise(img_gs, 'gaussian', 0, 1);
imshow(noisy_img);title('Noisy Picture With Noise Power of 1') 
[row, colomn] = size(img_gs);
p_img = sum(img_gs.^2, 'all')/(row.*colomn);
p_noise = sum((noisy_img - img_gs).^2, 'all')/(row.*colomn);
snr_1 =(p_img/p_noise);
f_noisy_img = fftshift(fft2(noisy_img));
f_noisy_img_log = log(1+abs(f_noisy_img));
figure(6);imshow(f_noisy_img_log, []);title('Frequency Domain of Noisy Image With Power 1');

%%%Noise Power 10
figure(7);
noisy_img = imnoise(img_gs, 'gaussian', 0, 10);
imshow(noisy_img);title('Noisy Picture With Noise Power of 10') 
p_img = sum(img_gs.^2, 'all')/(row.*colomn);
p_noise = sum((noisy_img - img_gs).^2, 'all')/(row.*colomn);
snr_2 =(p_img/p_noise);
f_noisy_img = fftshift(fft2(noisy_img));
f_noisy_img_log = log(1+abs(f_noisy_img));
figure(8);imshow(f_noisy_img_log, []);title('Frequency Domain of Noisy Image With Power 10');

