function Y = embedding( X_P_reshaped, StdID, alpha, N, key)
    % StdID must be a string for example '810197689'
    % X is a 1,N vector( should be one diemension if it isnt we will
    % convert it.
    % Y is output in diemension of X so we need to turn in to readible
    % audio or picture
    
    
    PN_0 = key;
    PN_1 = -key;    
    % 36 is number of bits which are hidden in file
    X = X_P_reshaped(1: N*36);
    X_RES = X_P_reshaped( N*36+1:end);
    std_cell = std2bin(StdID);
    size_X = length(X);
    num = size_X/N;
    X = reshape(X, [num, round(size_X/num)]);
    Y = zeros(size(X));
    count = 1;
    for i = 1:9
        for j = 1:4
            switch std_cell{i}(j)
                case 1
                    Y(count, :) = X(count, :) + PN_1*alpha;
                case 0
                    Y(count, :) = X(count, :) + PN_0*alpha;
            end

            count = count + 1;
        end
    end
    Y_P = reshape(Y, [ 1,36*N]);
    Y = [Y_P X_RES];
    %Y = reshape(Y_P_reshaped ,[row_X, coloumn_X]);
end