function zero_padded_grid =REMapper(FrameIndex , input_symbol ,startingSymbol, LastSymbol ,SC_index ,Nrb , DMRS,DMRSMapping )
   
%% initilize params according to 5G standard
Nrb_total = 100 ;
Nrb_sc = 12 ; % no of Subcarriers per Resource blocks
Nsym = 7 ; % no of symols per slot either {7,6} 
Nslot = 2 ; % no of slots per subframe
%% initilize Grid
REGrid = complex(zeros(Nrb_total*Nrb_sc, Nsym*Nslot));
 
%% specifiy grid indicies 
lenOFDM = size(REGrid ,1); 
lenSYM = size(REGrid ,2) ;
idxf = 1:lenOFDM; % in Frequency domain 
idxt = 1:lenSYM ; % in time domain 
%% DMRS Indexing
symbl_index = startingSymbol ; 
startingpoint_dmrs = SC_index ;

 
    switch DMRSMapping.Type
        case 0      %mapping type A
          idxt_dmrs = [2 ,3] ; 
        
        case 1      % mappig type B
           idxt_dmrs =  symbl_index ;
        otherwise
           idxt_dmrs =  symbl_index  ;
    end
    switch DMRSMapping.config 
        case 1      % config 1
        idxf_dmrs = startingpoint_dmrs:2:startingpoint_dmrs + Nrb_sc*Nrb-1 ;          %subcarrier index
        case 2      % config 2
        i1 = startingpoint_dmrs:6:startingpoint_dmrs+Nrb_sc*Nrb ;
        i2 = startingpoint_dmrs+1:6:startingpoint_dmrs+(Nrb_sc*Nrb)-1 ;
        idxf_dmrs =  sort([i1 i2]);
        otherwise
          idxf_dmrs = startingpoint_dmrs:2:startingpoint_dmrs+Nrb_sc*Nrb-1 ;  
    end

%% DMrRS Indexing 

   idxf_dmrs1 = idxf_dmrs ;
   idxt_dmrs1 = idxt_dmrs ;
   
 while (~isempty(DMRS))
        REGrid(idxf_dmrs1(1) ,idxt_dmrs1(1)) = DMRS(1);
           idxf_dmrs1 = idxf_dmrs1(2:end) ;
           DMRS = DMRS(2:end) ; 
          if(isempty(idxf_dmrs1))
            idxt_dmrs1 = idxt_dmrs1(2:end) ;
            idxf_dmrs1 = idxf_dmrs ;
          end    
   end     

%% Data Indexing 
    idxt_data = setdiff(idxt(startingSymbol:LastSymbol),idxt_dmrs) ;
    idxf_data = idxf(SC_index:SC_index+ Nrb_sc*Nrb - 1) ;
    while (~isempty(input_symbol))   
       if( REGrid(idxf_data(1) ,idxt_data(1)) == 0)   
            REGrid(idxf_data(1) ,idxt_data(1)) = input_symbol(1);
            idxf_data= idxf_data(2:end) ;
            input_symbol =input_symbol(2:end) ;
        if(length(idxf_data) == 0 && length(idxt_data)~= 0 ) 
            idxt_data = idxt_data(2:end) ;
            idxf_data = idxf(SC_index:SC_index+Nrb_sc*Nrb) ;
         
    end

       end 
    end      
%% zero padding
         fft_size = 2048;
        % Calculate zero padding on each side
        padding_size = (fft_size - size(REGrid, 1)) / 2;

        % Initialize the zero-padded grid
        zero_padded_grid = zeros(fft_size, size(REGrid, 2));
        % Insert the original grid into the center of the zero-padded grid
        zero_padded_grid(padding_size + 1 : padding_size + size(REGrid, 1), :) = REGrid;

end %% function end


