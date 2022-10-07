clear;close all;
clc
%syms r w z;
%f = @(r, w, z) 1/(1-2*r*(cos(w))*z^-1+(r^2)*z^(-2));
r = 0.5;
w_0 = pi/2;
a = 1;
b = [1, -2*r*cos(w_0), r.^2];
zplane(a,b)
grid on;    
title('Zero-Pole Diagram in Z Plane')
m = 1024;
figure
freqz(a, b)

%[h, w] = freqz(a, b, m, 'whole');
%frequency = linspace(-pi, pi, m);
% plot(w, abs(h));
% set(gca,'XTick',-pi:pi/2:2*pi)  
% set(gca,'XTickLabel',{'-\pi ','-\pi/2','0','\pi/2','\pi'})
% title('Absoulte Value of H(e\^jw)')
%plot(abs(h))
%plot(abs(w))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Part B

syms N P R
f = @(N, P, R) R.*((P).^N).*heaviside(N + 0.5);

r = 0.5;
w_0 = pi/4;
b = [1, -2*r*cos(w_0), r.^2];
[r, p, z] = residuez(a, b);
n = -5:15;
impulse =  zeros(1,length(n));
for i = 1:length(p)
    impulse = f(n, p(i), r(i)) + impulse;
end
figure;stem(n, impulse); title('Impulse Resoponse')
grid on
xlabel('n')
ylabel('x[n]')


