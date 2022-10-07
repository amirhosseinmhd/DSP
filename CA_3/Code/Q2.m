clc
clear
close all
%%%part A
VS1=load('v1.mat');
VS2=load('v2.mat');
VS3=load('v3.mat');
i=1:1:1600;
v1= VS1.val(3,i);
v2= VS2.val(3,i);
v3= VS3.val(3,i);
Fs=160;


%% 
t=i/160;
figure;
subplot(2,3,1);
plot(t,v1);
ylabel("v_1(t)");xlabel("t");title("v_1");grid on
subplot(2,3,2);
plot(t,v2);
ylabel("v_2(t)");xlabel("t");title("v_2");grid on
subplot(2,3,3);
plot(t,v3);
ylabel("v_3(t)");xlabel("t");title("v_3");grid on

V1=fftshift(fft(v1));
len=length(v1);
freq=Fs.*((-len/2:len/2-1)/len);
subplot(2,3,4);
plot(freq, abs(V1));grid on
ylabel("|V_1(f)|");xlabel("f (Hz)");title("Fourier Transform of v_1");

V2=fftshift(fft(v2));
len=length(v2);
freq=Fs.*((-len/2:len/2-1)/len);
subplot(2,3,5);
plot(freq, abs(V2));grid on
ylabel("|V_2(f)|");xlabel("f (Hz)");title("Fourier Transform of v_2");

V3=fftshift(fft(v3));
len=length(v3);
freq=Fs.*((-len/2:len/2-1)/len);
subplot(2,3,6);
plot(freq, abs(V3));
ylabel("|V_3(f)|");grid on;
xlabel("f (Hz)");title("Fourier Transform of v_3");

%% 
delta_f=zeros(1,1600);
theta_f=zeros(1,1600);
alpha_f=zeros(1,1600);
beta_f=zeros(1,1600);
gamma_f=zeros(1,1600);
delta_f(806:841)=V1(806:841);
delta_f(761:796)=V1(761:796);
theta_f(841:881)=V1(841:881);
theta_f(721:761)=V1(721:761);
alpha_f(881:921)=V1(881:921);
alpha_f(681:721)=V1(681:721);
beta_f(921:1151)=V1(921:1151);
beta_f(451:681)=V1(451:681);
gamma_f(1151:1600)=V1(1151:1600);
gamma_f(1:451)=V1(1:451);
delta=ifft(ifftshift(delta_f));
figure;
subplot(5,1,1);
plot(t,delta);title("\delta");xlabel('time');ylabel('Amp')
theta=(ifft(ifftshift(theta_f)));
subplot(5,1,2);plot(t,theta);title("\theta");xlabel('time');ylabel('Amp')
alpha=(ifft(ifftshift(alpha_f)));
subplot(5,1,3);plot(t,alpha);title("\alpha");xlabel('time');ylabel('Amp')
beta=ifft(ifftshift(beta_f));
subplot(5,1,4);
plot(t,beta);title("\beta");xlabel('time');ylabel('Amp')
gamma=ifft(ifftshift(gamma_f));
subplot(5,1,5);
plot(t,gamma);title("\gamma");xlabel('time');ylabel('Amp')


