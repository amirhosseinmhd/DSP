clc;clear;
pic = imread('coffee.jpg');
img_gs = rgb2gray(pic);
imshow(img_gs);
title('Original Grayscale Image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%Diffrent Type of Filters
filter = fspecial('average', 15);
filtered_pic = imfilter(img_gs, filter, 'replicate');
figure(2)
imshow(filtered_pic);
title('Image with Average Filter')

%% 

filter = fspecial('Gaussian', 15, 15);
filtered_pic = imfilter(img_gs, filter, 'replicate');
figure(3)
imshow(filtered_pic);
title('Guassian')

%%
filter = fspecial('Laplacian');
filtered_pic = imfilter(img_gs, filter);
figure(4)
imshow(filtered_pic);

%%
filter = fspecial('sobel');
filtered_pic = imfilter(img_gs, filter, 'replicate');
figure(5)
imshow(filtered_pic);
%%
filter = fspecial('disk', 10);
filtered_pic = imfilter(img_gs, filter, 'replicate');
figure(6)
imshow(filtered_pic);

%% PART B finding frequncy response of filter 
% I have written one code for all of filters it should run seprately
%Frequency Resopnse of original Filter
%Fourier Transform 
f_img = fftshift(fft2(img_gs)); 
f_img_log = log(1+abs(f_img));
f_img_log_angle = log(1+angle(f_img));
%figure;imshow(f_img_log,[]);title('Frequency Domain of Original Image');



f_img_filtered = fftshift(fft2(filtered_pic));
f_img_log_filtered = log(1+abs(f_img_filtered));
figure;imshow(f_img_log_filtered,[]);title('Frequency Domain of Filtered Image');

%%




































picture = imread('coffee.jpg');
picture = rgb2gray(picture);
figure(1)
imshow(picture);
title('Main Picture')
%Guassian
Filter_Guassian = imfilter(picture, fspecial('Gaussian', 15, 15), 'replicate');
figure(2)
imshow(Filter_Guassian);
title('Guassian')
%%
%B&white
 figure(7)
 imshow(abs(fftshift(fft2(Filter_Guassian))))
 