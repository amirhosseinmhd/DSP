%% Initializing
    clc;
    clear;
    amp = 1;
    [x, fs] = audioread('Arnold.wav');
    y = audioread('California.wav');
    t = (0 : length(y) - 1) * 1/fs;
    
%% Section 1 & 2
    %sound([x; y], fs);
    
%% Section 3
    Rxy = normxcorr2(y, x);
    lags = 1 : size(Rxy, 1);
    [maxValue, index] = max(Rxy); % The first California!
    plot(lags, Rxy);
    title('Normalized Cross Correlaion')
    xlabel('m');ylabel('R_{XY}[m]')
    
    
%% Section 4
    beep = amp * sin(2 * pi * 1000 * t);
    %sound(beep, fs);
    
    x_censored = x;
    x_censored(lags(index) - length(y) : lags(index) - 1) = beep;
    x_censored(361500 : 361500 + length(y) - 1) = beep;
    x_censored(423600 : 423600 + length(y) - 1) = beep;
    
%% Section 5    
    sound(x_censored, fs);
    
%% Section 6
    audiowrite('Censored_Sound.wav', x_censored, fs);

%% END   