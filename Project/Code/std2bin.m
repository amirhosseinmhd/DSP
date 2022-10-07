function std_cell = std2bin(stdnumber)

    std_cell = cell(1,9);
for i = 1:9 
     std_cell{i} = decimalToBinaryVector(str2double(stdnumber(i)),4);

end

end