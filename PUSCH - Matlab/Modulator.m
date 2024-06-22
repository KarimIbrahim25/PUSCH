function modulatedSignal = Modulator(inputBits, modulationScheme)
    % Validate input

    % Ensure the length of the input is compatible with the modulation scheme
    switch modulationScheme
        case 0
            bitsPerSymbol = 2;
            modulationOrder = 4;%the size of the Gray code array and the number of symbols in the modulation scheme    
            % k=double(1.0)/double(sqrt(2)); 
            k=1/sqrt(2) ; 
            %constellation = (1-2b(2i) + j(1-2b(2i+1)) ;
            constellation=k*[1+1i 1-1i -1+1i -1-1i]; %constellation points
        case 1
            bitsPerSymbol = 4;
            modulationOrder = 16;
            b = 4; 
            %points -3 ,-1, 1, 3 
             k=double(1.0)/double(sqrt(10)); %The normalizing factor
%           constellation(i) =  (1 - 2*inp(4)) * (2 - (1 - 2*inp(2))) + 1i * (1 - 2*inp(3)) * (2 - (1 - 2*inp(1)))
            constellation = k*[1+1i 1+3i 3+1i 3+3i 1-1i 1-3i 3-1i 3-3i -1+1i -1+3i -3+1i -3+3i -1-1i -1-3i -3-1i -3-3i];

        case 2
            bitsPerSymbol = 6;
            modulationOrder = 64;
            b = 8; 
            %points -7 , -5, -3 ,-1, 1, 3 , 5 , 7 . 
            k=double(1.0)/double(sqrt(42)); %The normalizing factor
            for i= 1:modulationOrder  
                b = decimalToBinaryVector(i-1,bitsPerSymbol);
                constellation_n=(1-2*(b(1)))*(4-(1-2*b(3))*(2-(1-2*b(5)))) + 1i*(1-2*(b(2)))*(4-(1-2*b(4))*(2-(1-2*b(6)))) ;
                constellation(i) = k*constellation_n ; 
            end 
        otherwise
            error('Invalid modulation scheme. Use ''QPSK'', ''16QAM'', or ''64QAM''.');
    end
    
    % Check if padding is required
    if mod(length(inputBits), bitsPerSymbol) ~= 0
        paddingBits = zeros(1, bitsPerSymbol - mod(length(inputBits), bitsPerSymbol));
        inputBits = [inputBits paddingBits];
        disp('Warning: Input bits padded to ensure compatibility.');
    end

    % Group input bits into symbols
    symbolIndices = binaryVectorToDecimal(reshape(inputBits,[], bitsPerSymbol),'LSBFirst')+1 ;

    % Map the symbol indices to constellations with manual Gray coding
        modulatedSignal = constellation(symbolIndices);
end