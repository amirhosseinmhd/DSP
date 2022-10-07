function [vec_out] = my_downsample(vector, L)
    len = length(vector);
    vec_out = zeros (1, floor(len/L));
    for i = 1:length(vector)
        if mod(i,L) == 0
            vec_out((i)/L) = vector(i);

        end
    end
end

