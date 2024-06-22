% %%
% levels = -2^18:(2^18)-1;
% N=2048;
% input_symbols = randsrc(14,N,levels) + 1j*randsrc(14,N,levels);
% fraction = 10;
% input_symbols = input_symbols./2^fraction;
%% Cyclic Prefix Parameters
% ifft_size = 2048;   % 2048-point IFFT 
% N_symb = 14;        % Number of symbols per subframe
% N_subframes = 1;   % Number of subframes per frame
% Ncp1 = 160;         % Cyclic prefix length of first symbol
% Ncp2 = 144;         % Cyclic prefix length of other symbols
% N_symb_CP1 = 2;     % Number of sybmols with cyclic prefix 1

% Generate temp out with zero padding cyclic prefix from 2048--2208
%CP = Cyclic(input_symbols,2048,14,1,160,144,2);
%%
function output_symbols = Cyclic(input_symbols,ifft_size,N_symb,N_subframes,Ncp1,Ncp2,N_symb_CP1)

temp_out = [input_symbols,zeros(14,160)];

% Initialize size of symbol with CP
Symbol_with_CP_1 = zeros(N_symb_CP1,ifft_size + Ncp1 );                   %% (2,2208)
Symbol_with_CP_2 = zeros(N_subframes * N_symb , ifft_size + Ncp2);        %% (14,2192)

i=1;
    for symbol = 1:(N_symb*N_subframes)
        
        % Add cyclic prefix
        if (symbol == 1) || (symbol == 8)
            Symbol_with_CP_1(i,:) = [temp_out(symbol, ifft_size-Ncp1+1:ifft_size), temp_out(symbol,1:ifft_size)];       % Cyclic prefix for the first symbol
        i=i+1;
        else
            Symbol_with_CP_2(symbol,:) = [temp_out(symbol, ifft_size-Ncp2+1:ifft_size), temp_out(symbol,1:ifft_size)];  % Cyclic prefix for the other symbols  
        end
    end
    
    output_symbols = [Symbol_with_CP_2,zeros(14,16)];
    
    input_symbols=1;
for j = 1:14
    if j==1 || j == 8
    output_symbols(j,:) = Symbol_with_CP_1(input_symbols,:);
    input_symbols=input_symbols+1;
    end
end 
end 
