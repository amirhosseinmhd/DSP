%% independet from main

alpha = 0.008;
StdID = '810197689';
[X_P, Fs] = audioread('host.wav');
[row_X, coloumn_X] = size(X_P);
X_P_reshaped = reshape(X_P, [1, length(X_P)*2]);
new_N = round(linspace(15000,20000, 10));
MSE = zeros(10,1);
for i = 1:10
    key = randsrc(1, new_N(i),[-1  1; 0.5 0.5]);
    Y_P_reshaped_n(i,:) = embedding(X_P_reshaped,StdID,alpha,new_N(i),key);
    %Y_n(i,:,:) = reshape(Y_P_reshaped_n(i,:), [row_X, coloumn_X]);
    MSE(i,:) = mean((Y_P_reshaped_n(i,:)-X_P_reshaped).^2);
end
plot(new_N, MSE)
title("MSE vs N")
grid on; xlabel("N" );ylabel("MSE");