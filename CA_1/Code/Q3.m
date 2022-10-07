clear;clc;close all
syms N
x = @(N) cos(0.02*N*pi + pi/4);
n = -200:200;
stem(n, x(n));
title('x[n] = cos(0.02\pin + \pi/4)');
w = wgn(1, 401, 0);
sub_y = zeros(1, 401);
y = x(n) + 3*w;

sub_y(200:300) = y(200:300);
sub_n = n(200:300);
figure(2);stem(n, sub_y);
xlim([-1, 101]);
title('y[n] = x [n] + 3 w[n]');

z_p = zeros(1,401);
z_p(220:320) = sub_y(200:300) + w(200:300);
figure;stem(n, z_p);
r = xcorr(z_p, sub_y);
n = -400:400;
stem(n(315:525), r(315:525));
title('Cross Correlation Between Two Signal');