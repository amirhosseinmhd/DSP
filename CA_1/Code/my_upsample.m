function [vec_out] = my_upsample(vector, L)
    len = length(vector);
    vec_out = zeros(1, len*L);
    for i = 1:len
        vec_out(i*L) = vector(i);
    end
    vec_out(1:L-1) = [];
end