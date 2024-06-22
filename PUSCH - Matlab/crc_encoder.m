function [c] = crc_encoder(A)
    a = randi([0 1], A, 1); %%input sequence
    if A > 3824
        L = 24;
        B = [a; zeros(L, 1)];
        D = [1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1]';
    elseif A < 3824
        L = 16;
        B = [a; zeros(L, 1)];
        D = [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]';
    end
    quotient = [];
    reminder = [];
    leng1 = length(B);
    leng2 = length(D);
    for i = 1:leng1 - leng2 + 1
        if B(i) == 0
            quotient = [quotient, 0];
        else
            quotient = [quotient, 1];
            B(i:i + leng2 - 1) = xor(B(i:i + leng2 - 1), D);
        end
    end
    reminder = B(end - leng2 + 2:end);
    c = [a; reminder];
end