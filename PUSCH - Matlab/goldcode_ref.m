%% PRBS pseudo random binary system 
function GoldSeq = goldcode_ref (C_init, L) %gold sequence generator takes C_init and input stream length as input
%% Parameters 
Nc =  1600; %%shift / offset
Mpn = L; %Length of output sequence
%% Create a vector(array) for x1() and x2() , Output Sequence all initialized with 0
%X1 = zeros(1,Nc + Mpn + 31);
%X2 = zeros(1,Nc + Mpn + 31);
GoldSeq = zeros(1,Mpn);

%% Initial conditions of two sequences 
X1_initialCond = [1 zeros(1,30) ] ;
% 
binary_Cinit = int2bit(C_init, 31);
% Convert the binary representation to a vector of coefficients
X2_initialCond  = flip((binary_Cinit));
%The reason for using flip here is to correctly align the bits with the shift register initialization. 
% In a typical shift register, the leftmost bit is considered the most significant bit.
% By flipping the vector, the order is adjusted to match this convention

%% initial values for x1 & x2 sequences
X1(1:31) = X1_initialCond ;
X2(1:31) = X2_initialCond ;
%% 
for i = 0:(Mpn-1)
    %Xor X1
    X1(i+1) = mod(X1(mod(i+3, 31)+1)+X1(i+1),2) ;
end
for  i = 0:(Mpn-1)
    %XOR X2 
    X2(i+1) = mod(X2(mod(i+3, 31)+1)+X2(mod(i+2, 31)+1)+X2(mod(i+1, 31)+1)+X2(i+1) ,2);
end
for i = 0:(Mpn-1)
    %Generate Gold Sequences
    GoldSeq(i+1) = mod(X1(mod(i+Nc, 31)+1) + X2(mod(i+Nc, 31)+1) ,2);
end
  
end