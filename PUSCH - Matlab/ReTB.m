
 clc ; 
 clear all ; 

%%
 test_cases = 1 ; 
for i = 1:test_cases
  %parameters

        FrameIndex = 1 ;
        DMRSMapping.Type = 1;
        DMRSMapping.config = 1 ;
        Nrb = randi([1,100],1) ;
        N=Nrb*12 ;
        Dmrs_Len = Nrb*6 ; 
        subcarrier_startingpoint =randi([1 , 1200-N+1],1) ;
        sym_startingpoint = randi([1 , 14],1)  ;
        sym_endpoint = randi([sym_startingpoint+1 , 14],1)  ;
     
     %Define the directory path where you want to save the files
    file_data_in_I =  fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_Input_REM_I.txt', i), 'w');
    file_data_in_Q = fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_Input_REM_Q.txt', i), 'w');
    file_data_in_D_I =  fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_Input_REM_D_I.txt', i), 'w');
    file_data_in_D_Q =  fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_Input_REM_D_Q.txt', i), 'w');

    file_param_in = fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_Param_REM.txt', i), 'w');
    file_data_out = fopen(sprintf('C:\\questasim64_10.6c\\verilog\\%d_REMOUT_I.txt', i), 'w');
 
    fprintf(file_param_in, '  %d \n%d \n%d \n%d \n%d   \n ',FrameIndex,Nrb,subcarrier_startingpoint, sym_startingpoint,sym_endpoint );


    %input symbols & DMRS
        x = randi([0 64-1],N*(sym_endpoint-sym_startingpoint),1);
        input_symbol = qammod(x,64);
        D =qammod(randi([0 64-1],Dmrs_Len,1),64);
          
        %fraction =10 ; 
          %complex_numbers = X.*2^fraction;
        for i = 1:numel(input_symbol)
            fprintf(file_data_in_I, '%d\n', real(input_symbol(i)));
            fprintf(file_data_in_Q, '%d\n', real(input_symbol(i)),imag(input_symbol(i)));
        end  
        for i = 1:numel(D)
            fprintf(file_data_in_D_I, '%d\n', real(D(i)));
            fprintf(file_data_in_D_Q, '%d\n', imag(D(i))) ; 
        end    
%Call Function
        M= REMapper(FrameIndex,input_symbol,sym_startingpoint,sym_endpoint,subcarrier_startingpoint,Nrb,D ,DMRSMapping);

    % Write the complex numbers to the file
  for j = sym_startingpoint:sym_endpoint 
    for i = 1:2048
        fprintf(file_data_out, '%d  %d\n', real(M(i,j)),imag(M(i,j)));
    end
  end  
  %Close the files
   fclose(file_data_in_I);
   fclose(file_data_in_Q);

    fclose(file_data_in_D_I);
    fclose(file_data_in_D_Q); 

   fclose(file_param_in);
   fclose(file_data_out);

end

%%
% %% Creating input File %%%%%%%%%%%%%%
%     % Specify the desired directory
%     output_directory = '/MATLAB Drive/Grad_PUSCH/Resource Element Mapper' ;
%     % output_directory = 'G:\R2016a\bin';
%     % Specify the filename
%     filename = 'Remapper.txt';
%     % Construct the full path to the file
%     parameters_file_path = fullfile(output_directory, filename);
%     % Open the file
%     parameters_file = fopen(parameters_file_path, 'w');
%  
%     % Write data to the file
%     fprintf(parameters_file, 'DMRSMapping.Type = %d ', DMRSMapping.Type);
%     fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, 'DMRSMapping.config = %d ',DMRSMapping.config);
%         fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, 'N = %d ', N);
%         fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, 'Nrb= %d ', Nrb);
%         fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, 'data_startingpoint = %d ', data_startingpoint);
%         fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, 'input_symbol = %d ', input_symbol);
%     fprintf(parameters_file, 'D = %d ', D);
%         fprintf(parameters_file, '\n'); 
%     fprintf(parameters_file, '\n'); 
%         fprintf(parameters_file, '\n'); 
%     fclose(parameters_file);
% %%%%% Creating output File %%%%%%%%%%%%%%
%     % Specify the desired directory
%     output_directory = '/MATLAB Drive/Grad_PUSCH/Resource Element Mapper' ;
% 
%     % output_directory = 'G:\R2016a\bin';
%     % Specify the filename
%     filename = 'GRID.txt';
%     % Construct the full path to the file
%     parameters_file_path = fullfile(output_directory, filename);
%     % Open the file
%     parameters_file = fopen(parameters_file_path, 'w');
%     % Write data to the file
%    for j = 1:size(M,2) 
%     for i = 1:length(M)
%         fprintf(parameters_file,'%f + %fj\n', real(M(i,j)), imag(M(i,j)));
%     end
%    end
%     % fprintf(parameters_file, 'M = %d ', M);
%     % fprintf(parameters_file, '\n'); 
%     fclose(parameters_file);