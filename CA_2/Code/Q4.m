clc;clear;close all
pic = imread('coffee.jpg');
img_gs = rgb2gray(pic);
identity = [0 0 0;0 1 0;0 0 0];
edge_detection_mat = [-1 -1 -1; -1 8 -1; -1 -1 -1];
sharpen_mat = [0 -1 0; -1 5 -1; 0 -1 0];
guassian_blur_mat = 1/256*[1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6;4 16 24 16 4; 1 4 6 4 1];

%% Edge Detection Filter
im = imfilter(pic, edge_detection_mat);
im_2 = conv2(img_gs, edge_detection_mat);
figure;
subplot(1,2,1);imshow(im);title('Edge Detection Filter RGB');
subplot(1,2,2);imshow(im_2);title('Edge Detection Filter GrayScale');

%% Sharpen Filter
im = imfilter(pic, sharpen_mat);
im_2 = conv2(img_gs, sharpen_mat);
figure;
subplot(1,2,1);imshow(im);title('Sharpen Filter RGB');
subplot(1,2,2);imshow(im_2);title('Sharpen Filter GrayScale');

%% Gussian Blur Filter
im = imfilter(pic, guassian_blur_mat);
im_2 = conv2(img_gs, guassian_blur_mat);
subplot(1,2,1);imshow(im);title('Gussian Blur Filter RGB');
subplot(1,2,2);imshow(im_2);title('Gussian Blur GrayScale');

%% Boxblur Filter
im = imfilter(pic, identity);
figure;imshow(im);title('Identity')
