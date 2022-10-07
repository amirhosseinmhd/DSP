function StdID = extracting (Y, key, N)

[row_Y, col_Y] = size(Y);
Y_reshaped = reshape(Y, [1, row_Y*col_Y]);
Y_P = Y_reshaped(1:N*36);
num = 36;
Y_truncate = reshape(Y_P , [num, N]);
z_1 = zeros(1,36);
for i = 1:num 
        z_1(i) = sign(Y_truncate(i,:) * transpose(key));
end
z_1(z_1 == 1) = 0;
z_1(z_1 == -1) = 1;
bin = zeros(9,4);
for i = 0:8
    bin (i+1,:) = z_1(4*i+1:4*(i+1));
end
StdID = binaryVectorToDecimal(bin);
end