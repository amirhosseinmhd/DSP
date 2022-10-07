% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, 10);
% disp('End of Recording.');
% y = getaudiodata(recObj);
% audiowrite('MyFairLady.wav',y,8000);
%Audio Has been Completley Recorded
%% Main Part
%in part above the code has been written in order to record audio but for 
%further playing sound audioread function reads my recorded voice
y = audioread('MyFairLady.wav');
fs = 8000;
b = 1;
a = [1, zeros(1, 5499), 0.3, zeros(1, 3499), 0.2];
sound(y, fs);
pause(10)
audio = filter(b, a, y);
sound(audio, fs);
pause(10);
audiowrite('MyFairLady_With_Echo.wav',audio,8000);
%% Removing Echo From it
audio_2 = filter(a, b, audio);
sound(audio_2, fs);

