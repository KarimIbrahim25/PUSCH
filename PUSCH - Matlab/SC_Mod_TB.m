clc ; 
clear all ; 
% Scrambler Input Parameters
L = randi([30 20000] ,1) ;
RNTI =  randi([20000,65534],1);
NcellID = randi([0,1007],1);
N_RAPID = randi([0,60],1); 
HigherLayerParam = 0 ;

% Scrambler Input bits 
L = randi([30 50000] ,1) ;
Scrambler_IN =randi([0 1], 1,L);
% Scrambler Call function 

ScramblerOutput = PUSCH_Scrambler(Scrambler_IN , NcellID , RNTI , HigherLayerParam ,N_RAPID ) ; 

% Modulation Scheme Randomization
  ModulationScheme = randi([0 2],1) ;
   if ModulationScheme == 0 
        bitsPerSymbol = 2 ;
        modulationOrder = 4 ; 
   elseif ModulationScheme == 1
        bitsPerSymbol = 4 ;
        modulationOrder = 16 ; 
   elseif ModulationScheme == 2
        bitsPerSymbol = 6 ;
        modulationOrder = 64 ;  
   end
  
  % Modualtor Input bits
  i = 1 ; 
  %mod_in = reshape(Scrambler_IN,[], bitsPerSymbol) ; 
  ScramblerOutput_r = ScramblerOutput ; 
  % Modulator Call function  
  while (~isempty(ScramblerOutput_r))
       if(length(ScramblerOutput_r) > bitsPerSymbol) 
            X(i)= Modulator(ScramblerOutput_r(1:bitsPerSymbol),ModulationScheme);
       else
            X(i)= Modulator(ScramblerOutput_r(1:end),ModulationScheme);
       end 
        ScramblerOutput_r = ScramblerOutput_r(bitsPerSymbol+1:end) ; 
        i = i+1 ;
 end