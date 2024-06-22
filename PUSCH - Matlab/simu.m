clear;
clear all;
rows = 100;
columns = 4;  % 3 columns for the factors and 1 column for the multiple of 12

Table12 = zeros(rows, columns);
for i = 1:rows                                                                  
    % Calculate multiples of 12
    Table12(i, 1) = 12 * i;

    % Count powers of 2, 3, and 5 for the multiple
    number = Table12(i, 1);
    factors = [0, 0, 0];  % to store count of powers of 2, 3, and 5

    % Count powers of 2
    while mod(number, 2) == 0
        factors(1) = factors(1) + 1;
        number = number / 2;
    end

    % Count powers of 3
    while mod(number, 3) == 0
        factors(2) = factors(2) + 1;
        number = number / 3;
    end

    % Count powers of 5
    while mod(number, 5) == 0
        factors(3) = factors(3) + 1;
        number = number / 5;
    end

    % Store the counts in the array
    Table12(i, 2:end) = factors;
end
load NR_1_2_20.txt;
B = NR_1_2_20;
AA=B(1:4 , 1:10);
    C=B(4+1:42 , 1:10);
    
    BB=B(1:4 , 10+1:14);
    
    D=B(4+1:42, 10+1:14);
    
    OO=B(1:4 , 14+1:52);
    
    Ii=B(4+1:42 , 14+1:52);
z = 2;
[m,n] = size(B);
A=1;
c=crc_encoder(1);
if(m==46)
    KK=22*z;
elseif (m==42)
KK=10*z;
end

hhh=KK-length(c);
minus=zeros(hhh, 1);
c=[c;minus];
c=transpose(c);

%msg = randi([0 1],1,(n-m)*z);
%encode generated msg
d = nrldpc_encoder(B,z,c);
pc=d(29:end);
pc=transpose(pc);
out = check_cword(B,z,d);
d=d(2*z+1:end);


%%HARQ
d_flipped = flip(d);
RV=0;
data_in = d_flipped;
base_graph=2;
data_size=length(d);
G=144;
RV_f = RateMatching_and_HARQ(G, z, base_graph, data_size, RV, data_in);


%%INTERLEAVER
E=G;
Qm=2; %%16
data_in=RV_f;
data_out = Bit_Interleaver(E, Qm, data_in);


%%SCRAMBLER
[rows, cols] = size(data_out);
inputstream = reshape(data_out', 1, rows * cols);
RNTI =  31578;
%randi([20000,65534],1);
NcellID = 820;
%randi([0,1007],1);
N_RAPID = 14;
%randi([0,60],1); 
HigherLayerParam = 0 ;

ScrambledBits=PUSCH_Scrambler(inputstream , NcellID , RNTI,N_RAPID,HigherLayerParam);


%%modulator
%inputBits=ScrambledBits;
%inputBits=reshape(ScrambledBits', 72, 2);
modulationScheme=0;
ScrambledBits_reg = ScrambledBits ; 
modulatedSignal= [] ;
   for k = 1: (length(ScrambledBits)/2)
        inputBits = ScrambledBits_reg(1:2) ;
        modulatedSignal(k)= Modulator(inputBits, modulationScheme);
        ScrambledBits_reg = ScrambledBits_reg(3:end) ;
   end
%modulatedSignal= Modulator(inputBits, modulationScheme);


%%RefSignalGen

n_cell_ID=NcellID;
N_rb=length(modulatedSignal)/12;
if(N_rb<12)
    En_hopping=0;
else
En_hopping=randi([0,2],1);
end
N_slot_frame=0;
PAPR_seq = RefSignalGen (N_slot_frame, N_rb, n_cell_ID, En_hopping);


%%FFT
integer=8;
fraction=10;
input=modulatedSignal;
x=Quantizer(input,integer,fraction);
N=length(modulatedSignal);
my_func=mixed(x,Table12(N/12,2),Table12(N/12,3),Table12(N/12,4));

%%Resource Element Mapping
input_symbol=my_func;
FrameIndex = 1 ;
DMRSMapping.Type = 1;
DMRSMapping.config = 1 ;
Nrb=N_rb;
Dmrs_Len = Nrb*6 ; 
SC_index =1032;
%randi([1 , 1200-N+1],1) ;
startingSymbol = 9;
%randi([1 , 13],1)  ;
LastSymbol = 10;
%randi([startingSymbol+1 , 14],1)  ;
DMRS=PAPR_seq;
zero_padded_grid = REMapper(FrameIndex , input_symbol ,startingSymbol, LastSymbol ,SC_index ,Nrb , DMRS,DMRSMapping );

%%IFFT
N=2048;
k=1;
for i=1:14
x(1:N,k)=zero_padded_grid(1:N,i);
IFFT(1:N,k)=Split(x(1:N,k),N);
k = k+1;
end

%%Cyclic prefix
input_symbols = permute(IFFT, [2, 1]);
ifft_size = 2048;   % 2048-point IFFT 
N_symb = 14;        % Number of symbols per subframe
N_subframes = 1;    % Number of subframes per frame
Ncp1 = 160;         % Cyclic prefix length of first symbol
Ncp2 = 144;         % Cyclic prefix length of other symbols
N_symb_CP1 = 2;     % Number of sybmols with cyclic prefix 1
output_symbols = Cyclic(input_symbols,ifft_size,N_symb,N_subframes,Ncp1,Ncp2,N_symb_CP1);
Cyclic_out = permute(output_symbols, [2, 1]);
