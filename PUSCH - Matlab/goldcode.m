function GoldSeq =goldcode(C_init, L) %gold sequence generator takes C_init and input stream length as input
%% Parameters 
Nc =  1600; %%shift / offset
Mpn = L; %Length of output sequence
%% Create a vector(array) for x1() and x2() , Output Sequence all initialized with 0
X1 = zeros(1,Nc + Mpn + 31);
X2 = zeros(1,Nc + Mpn + 31);
GoldSeq = zeros(1,Mpn);

%% Initial conditions of two sequences 
X1_initialCond = [1 zeros(1,30) ] ;
% 
binary_Cinit_F = decimalToBinaryVector(C_init, 31);
binary_Cinit = flip(binary_Cinit_F);
% Convert the binary representation to a vector of coefficients
X2_initialCond  = ((binary_Cinit(1:31)));
%The reason for using flip here is to correctly align the bits with the shift register initialization. 
% In a typical shift register, the leftmost bit is considered the most significant bit.
% By flipping the vector, the order is adjusted to match this convention

%% initial values for x1 & x2 sequences
X1(1:31) = X1_initialCond ;
X2(1:31) = (X2_initialCond) ;
%% 
for i = 1:(Mpn+Nc)
    %Xor X1
    X1(i+31) = mod(X1(i+3)+X1(i),2) ;
end
for  i = 1:(Mpn+Nc)
    %XOR X2 
    X2(i+31) = mod(X2(i+3)+X2(i+2)+X2(i+1)+X2(i) ,2);
end
for i = 1:(Mpn)
    %Generate Gold Sequences
    GoldSeq(i) = mod(X1(i+Nc) + X2(i+Nc) ,2);
end