clear;clc;close all;
face_1 = imread('face1.jpg');
face1_gs = rgb2gray(face_1);
face_2 = imread('face2.jpg');
face2_gs = rgb2gray(face_2);
[row, colomn] = size(face1_gs);
resized_face_2 = imresize(face2_gs,[row, colomn]);
imshow(resized_face_2);title('Face 2 in Gray Scale');
figure;imshow(face1_gs);title('Face 1  in Gray Scale');

%Finding Phase And Abs of each picture
f_face1 = fftshift(fft2(face1_gs));
f_face2 = fftshift(fft2(resized_face_2));
abs_f_face1 = abs(f_face1);
abs_f_face2 = abs(f_face2);
ph_f_face1 = angle(f_face1);
ph_f_face2 = angle(f_face2);

c_f_1 = abs_f_face2 .* exp(i*(ph_f_face1));
c_f_2 = abs_f_face1 .* exp(i*(ph_f_face2));
c_1 = ifft2(ifftshift(c_f_1));
c_2 = ifft2(ifftshift(c_f_2));

figure(3);imshow(c_1,[]);title('Angel of Face 1 and Amplitude of Face 2')
figure(4);imshow(c_2,[]);title('Angel of Face 2 and Amplitude of Face 1')

    

