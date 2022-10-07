clear all;clc
VS1=load('v1.mat');
VS2=load('v2.mat');
VS3=load('v3.mat');
i=1:1:1600;
v1= VS1.val(3,i);
v2= VS2.val(3,i);
v3= VS3.val(3,i);
cepV1= ceps(v1(1,:));
cepV2= ceps(v2(1,:));
cepV3= ceps(v3(1,:));
quefrency= 1:length(v2); 
subplot(3,1,1);
plot(quefrency,abs(cepV1));
title('Cepstrum Transform of v_1');
xlabel('Quefrency(sample)');ylabel('Amp');grid on
subplot(3,1,2);
plot(quefrency,abs(cepV2));
title('Cepstrum Transform of v_2');ylabel('Amp');grid on
xlabel('Quefrency(sample)');
subplot(3,1,3);
plot(quefrency,abs(cepV3));
title('Cepstrum Transform of v_3');ylabel('Amp');grid on
xlabel('Quefrency(sample)');

