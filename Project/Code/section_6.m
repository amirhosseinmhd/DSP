%% RUN MAIN BEFORe
alpha_n = linspace(0.01,0.0001, 10);
Y_P_reshaped_n = zeros(10,row_X*coloumn_X);
MSE = zeros(10,1);
for i = 1:10
    Y_P_reshaped_n(i,:) = embedding(X_P_reshaped, StdID, alpha_n(i),N,key);
    %Y_n(i,:,:) = reshape(Y_P_reshaped_n(i,:), [row_X, coloumn_X]);
    MSE(i,:) = mean((Y_P_reshaped_n(i,:)-X_P_reshaped).^2);
end
plot(alpha_n, MSE)
title("MSE vs \alpha")
grid on; xlabel("\alpha " );ylabel("MSE");