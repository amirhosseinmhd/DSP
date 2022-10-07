clc;close all;
% STDNUM len is 36 bit, so we need it 36*N bits of it 
N = 37200;
key = randsrc(1, N,[-1  1; 0.5 0.5]);
alpha = 0.02;
StdID = '810197689';
%% Reforming X
[X_P, Fs] = audioread('host.wav');
[row_X, coloumn_X] = size(X_P);
X_P_reshaped = reshape(X_P, [1, length(X_P)*2]);
%% Embedding STDID
Y_P_reshaped = embedding( X_P_reshaped, StdID, alpha, N, key);
Y = reshape(Y_P_reshaped ,[row_X, coloumn_X]);

%here we can undrestand filtering unstables system
%Y = filter(Hd, Y);

%% Extracting STDID
StdID_extracted = extracting(Y,key,N);
disp(StdID_extracted)

%% Testing Audio
player = audioplayer(Y, Fs);
play(player);
%% LAST PART; IMPORTed From Filter Designer
filtered_signal = filter(Hd, Y);
player = audioplayer(filtered_signal, Fs);
play(player);
