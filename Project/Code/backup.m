
% 
% X = X_P_reshaped(1: N*36);
% X_RES = X_P_reshaped( N*36+1:end);
% PN_0 = randsrc(1, N,[-1  1]);
% PN_1 = - PN_0;
% alpha = 0.001;
% 
% %% MAKING STD TO BINARY
% STD = '810197689';
% std_cell = std2bin(STD);
% %% MAKING VECTOR X TRU
% 
% size_X = length(X);
% num = size_X/N;
% % X_truncate = zeros(round(num), N);
% X = reshape(X, [num, round(size_X/num)]);
% % for i = 0:num-1
% %    X_truncate(i+1, :) = X(i*N+1:(i+1)*N); 
% % end
% %%
% Y = zeros(size(X));
% count = 1;
% 
% for i = 1:9
%     for j = 1:4
%         switch std_cell{i}(j)
%             case 1
%                 Y(count, :) = X(count, :) + PN_1*alpha;
%             case 0
%                 Y(count, :) = X(count, :) + PN_0*alpha;
%         end
%     
%         count = count + 1;
%     end
%     
% end
% Y_P = reshape(Y, [ 1,36*20000]);
% Y_P_reshaped = [Y_P X_RES];
% 
% 
% Y = reshape(Y_P_reshaped ,[row_X, coloumn_X]);
% 
% 
% player = audioplayer(Y, Fs);
% play(player);
% 
% 
% 
% 
% 
% %% RECONSTRUCTING
% Nlength = N;
% num = round(length(Y)/Nlength);
% % Y_tr = zeros (num, Nlength);
% % for i = 0:(num-1)
% %     Y_tr(i+1, :) = Y(i*N+1:N*(i+1));
% % end
% Y_truncate = reshape(Y, [num,Nlength]);
% for i = 1:num 
%         z_1(i) = sign(Y_truncate(i,:) * transpose(PN_0))
% end
% 
% %%
% Y_reshaped = reshape(Y, [1, row_X*coloumn_X]);
% Y_P = Y_reshaped(1:N*36);
% num = 36;
% Y_truncate = reshape(Y_P , [num, N]);
% for i = 1:num 
%         z_1(i) = sign(Y_truncate(i,:) * transpose(key));
% end
% z_1(z_1 == 1) = 0;
% z_1(z_1 == -1) = 1;
% bin = zeros(9,4);
% for i = 0:8
%     bin (i+1,:) = z_1 (4*i+1:4*(i+1));
% end
% x = binaryVectorToDecimal(bin);

%first we have to seprate first N*36

