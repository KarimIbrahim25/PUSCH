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
% levels = -8192:8191;
% N=12;
% x = randsrc(1,N,levels) + 1j*randsrc(1,N,levels);
% x=x./sqrt(42);
% integer=8;
% fraction=10;
% complex_numbers = x./2^fraction;
% % 
% %Open the file for writing
% fid = fopen('complex_numbers.txt', 'w');
% 
% % Write the complex numbers to the file
% for i = 1:numel(complex_numbers)
%     fprintf(fid, '%.15f %.15f\n', real(complex_numbers(i)), imag(complex_numbers(i)));
% end
% 
% % Close the file
% fclose(fid); 
% % Define the full path of the file
% 
% file_path = "C:\\Users\\Mostafa\Desktop\Digital\ST FFT\\out_r.txt";
% 
% % Open the file for reading
% fileID = fopen(file_path, 'r');
% for i = 1:3
%     fgetl(fileID);
% end
% % Read the contents of the file
% dataArray = textscan(fileID, '%f');
% 
% % Close the file
% fclose(fileID);
% 
% % Access the data from the cell array
% array_r = dataArray{1};
% % Define the full path of the file
% file_path = "C:\\Users\\Mostafa\Desktop\\Digital\\ST FFT\\out_i.txt";
% 
% % Open the file for reading
% fileID = fopen(file_path, 'r');
% for i = 1:3
%     fgetl(fileID);
% end
% % Read the contents of the file
% dataArray = textscan(fileID, '%f');
% 
% % Close the file
% fclose(fileID);
% 
% % Access the data from the cell array
% array_i = dataArray{1};
% 
% array=array_r+(array_i.*1i);
% v=flip(array);


% Define the full path of the file
file_path = 'complex_numbers.txt';

% Open the file for reading
fileID = fopen(file_path, 'r');

% Read the contents of the file
dataArray = textscan(fileID, '%f %f');

% Close the file
fclose(fileID);

% Extract real and imaginary parts
real_part = dataArray{1};
imaginary_part = dataArray{2};

% Combine into complex numbers
input = complex(real_part, imaginary_part);
input=input.';
x=quantizer(input,integer,fraction);
% my_func=fft5(x,log(N)/log(5),1,1,0,integer,fraction);
% quan_twid=1;
% FFT2=1;
% FFT3=1;
% FFT5=1;
% Stagenum=0;
my_func=mixed(x,Table12(N/12,2),Table12(N/12,3),Table12(N/12,4));
% Builtin=fft(x);
% sqnr(Builtin,my_func)
% v=v.';
% vord=v;
% % vord=ord(v,5);
% vord=vord./2^fraction;
% SQNR= sqnr(my_func,vord);
% % sqnr(Builtin,vord)
% if SQNR>50 
%     fid = fopen('Success.txt', 'w'); % Open the file in write mode
%     fprintf(fid, 'SQNR=%f\n', SQNR);
%     fclose(fid); % Close the file
% else
%     fid = fopen('Fail.txt', 'w'); % Open the file in write mode
%     fprintf(fid, 'SQNR=%f\n', SQNR);
%     fclose(fid); % Close the file
% end

% clear
% lol=zeros(129,7);
% for i = 1:4
%     points=3^i;
%     for j=0:points/3
%         lol(j+1,i)=twiddle(j,points,0);
%     end
% end
% 
% rows = 100;
% columns = 4;  % 3 columns for the factors and 1 column for the multiple of 12
% 
% Table12 = zeros(rows, columns);
% 
% for i = 1:rows
%     % Calculate multiples of 12
%     Table12(i, 1) = 12 * i;
% 
%     % Count powers of 2, 3, and 5 for the multiple
%     number = Table12(i, 1);
%     factors = [0, 0, 0];  % to store count of powers of 2, 3, and 5
% 
%     % Count powers of 2
%     while mod(number, 2) == 0
%         factors(1) = factors(1) + 1;
%         number = number / 2;
%     end
% 
%     % Count powers of 3
%     while mod(number, 3) == 0
%         factors(2) = factors(2) + 1;
%         number = number / 3;
%     end
% 
%     % Count powers of 5
%     while mod(number, 5) == 0
%         factors(3) = factors(3) + 1;
%         number = number / 5;
%     end
% 
%     % Store the counts in the array
%     Table12(i, 2:end) = factors;
% end
% 
% %%Mini Modulaltion Mapper
% u=1;
% % for j=1:length(Table12)
%     % if (2^Table12(j,2)*3^Table12(j,3)*5^Table12(j,4))==Table12(j,1)
%         levels = [-7 -5 -3 -1 1 3 5 7];
%         N=Table12(j,1);
%         N=12;
%         % for p=1:1000
%             x = randsrc(1,N,levels) + 1j*randsrc(1,N,levels);
%             % x=randi([-7,7],N,1)-1j*randi([-7,7],N,1);
% 
%             x=x/sqrt(42); %%2/3(M-1)
%             Builtin=fft(x);
% 
% % Generate some complex numbers for demonstration
% complex_numbers = x;
% 
% % Open the file for writing
% fid = fopen('complex_numbers.txt', 'w');
% 
% % Write the complex numbers to the file
% for i = 1:numel(complex_numbers)
%     fprintf(fid, '%.15f %.15f\n', real(complex_numbers(i)), imag(complex_numbers(i)));
% end
% 
% % Close the file
% fclose(fid);
% 
%             %%Quantizer
%             z=7;
%             w=10;
%             x_rounded=quantizer(x,z,w);
%             % x_truncated=quantizet(x);
% 
%             %%Mixed Radix and FFT for fixed input
%             %  SQNR_in_r=sqnr(x,x_rounded);
%             %  SQNR_in_t=sqnr(x,x_truncated);
% 
% 
%             %% fixed twiddle
%             %  SQNR_twiddle_r=sqnr(twiddle(2,5,0),twiddle(2,5,1));
%             %  SQNR_twiddle_t=sqnr(twiddle(3,5),quantizet(twiddle(3,5)));
% 
%             %%Fixed Output
%             Func_og=mixed(x,Table12(N/12,2),Table12(N/12,3),Table12(N/12,4),0,0,0,0,0,0,0); %%twiddle,2,3,5,stage,integer,fraction
% 
%             quan_twid=1;
%             FFT2=1;
%             FFT3=1;
%             FFT5=1;
%             Stagenum=2;
%             % for i=12:21
%              integer=7;
%              fraction=10;
%             %i=4;
%             [Func_round,q_twid,q_2,q_3,q_5,which_stage,integer_bits,fraction_bits]=...
%             mixed(x_rounded,Table12(N/12,2),Table12(N/12,3),Table12(N/12,4),quan_twid,FFT2,FFT3,FFT5,Stagenum,integer,fraction);
%             %   Func_trunc=mixed(x_truncated,resultArray(N/12,2),resultArray(N/12,3),resultArray(N/12,4),2);
% 
%             %%SQNR
% 
%             % SQNR(u)=sqnr(Func_og,Func_round);
%             % u=u+1;
%         %     p = 0.1:0.1:120;
%         %       % Plotting magnitudes with blue color for Builtin and red color for Func_og
%         %     plot(p, abs(Builtin), 'g-', 'LineWidth', 2, 'DisplayName', 'Builtin');
%         %     hold on
%         %     plot(p, abs(Func_og), 'b-', 'LineWidth', 2, 'DisplayName', 'Func_og');
%         % 
%         %     % Adding legend
%         %     legend('Location', 'best'); % You can customize the location if needed
%         % 
%         %     % Adding a title
%         %     title(' Builtin vs Function');
%         % 
%         %     % Display the grid
%         %     grid on
%         % 
%         %     % Display the plot
%         %     hold off
% 
% 
%             % database(1,:)={'FFT Twid','FFT 2','FFT 3','FFT 5','Stage Number','Integer','Fraction','SQNR'};
%             %   SQNR_out_trunc=sqnr(Func_og,Func_trunc);
%             % save=[q_twid,q_2,q_3,q_5,which_stage,integer_bits,fraction_bits,SQNR];
% 
%             % database(i,:)=num2cell(save);
%              MSE_dB=10*log10(abs(mean(Func_og(:)-Builtin(:))).^2);
%             % end
% 
% 
%             % fid = fopen('output.txt', 'w');
%             % for i = 1:length(Func_og)
%             % fprintf(fid, '%f  %fj\n', real(Func_og(i)), imag(Func_og(i)));
%             % end
% %             break;
% %         end
% %     else
% %         continue
% %     end
% % end
% % [f, xi] = ksdensity(SQNR);
% % 
% % % Plot the PDF
% % plot(xi, f, 'LineWidth', 2);
% function [out1,out2,out3,out4,out5,out6,out7,out8]=mixed(x,a1,a2,a3,q_twid,q_2,q_3,q_5,which_stage,integer_bits,fraction_bits)
% N=length(x);
% 
% if(mod(N,2)==0)
%     rows=2^a1;
%     columns=N/rows;
% 
% else
%     if(mod(N,3)==0)
%          rows=3^a2;
%          columns=N/rows;
%     else
%         if(mod(N,5)==0)
%             rows=5^a3;
%             columns=N/rows;
%         end
%     end
% end
% 
% if(columns==5^a3 || columns==3^a2 || columns==2^a1)
%     recur=0;
% else
%     recur=1;
% end
% k=1;
% for j=1:columns
%     for i=1:rows
%         Map(i,j)=x(k);
%         k=k+1;
%     end
% end
% 
% if(recur)
%     for i=1:rows
%         Map(i,:)=mixed(Map(i,:),a1,a2,a3,q_twid,q_2,q_3,q_5,which_stage,integer_bits,fraction_bits);
%     end
% else
%     if(recur==0)
% %%%dft row 
%         for i=1:rows
%             if(columns==2^a1)
%                 Map(i,:)=fft2(Map(i,:),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
%             else
%                 if(columns==3^a2)
%                     Map(i,:)=fft3(Map(i,:),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
%                 else
%                     if(columns==5^a3)
%                         Map(i,:)=fft5(Map(i,:),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
%                     end
%                 end
%             end
%         end
% %%%twiddle boundary
%         k=1;
%         for j=1:columns
%             for i=1:rows
%                 Map(i,j)=Map(i,j)*twiddle((i-1)*(j-1),N,q_twid);
%                 k=k+1;
%             end
%         end
% %%%dft column
%         for j=1:columns
%             if(rows==2^a1)
%                 Map(:,j)=fft2(Map(:,j),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
%             else
%                  if(rows==3^a2)
%                     Map(:,j)=fft3(Map(:,j),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
%                  else
%                       if(rows==5^a3)
%                         Map(:,j)=fft5(Map(:,j),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
%                       end
%                  end
%             end
%         end
%     end
% end
% 
% if(recur==1)
%     k=1;
%         for j=1:columns
%             for i=1:rows
%                 Map(i,j)=Map(i,j)*twiddle((i-1)*(j-1),N,q_twid);
%                 k=k+1;
%             end
%         end
%     for j=1:columns
%           if(rows==2^a1)
%                 Map(:,j)=fft2(Map(:,j),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
%             else
%                  if(rows==3^a2)
%                     Map(:,j)=fft3(Map(:,j),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
%                  else
%                       if(rows==5^a3)
%                         Map(:,j)=fft5(Map(:,j),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
%                       end
%                  end
%            end
%     end
% end
% k=1;
% for j=1:rows
%     for i=1:columns
%        X(k)= Map(j,i);
%         k=k+1;
%     end
% end
% out1=X;
% out2=q_twid;
% out3=q_2;
% out4=q_3;
% out5=q_5;
% out6=which_stage;
% out7=integer_bits;
% out8=fraction_bits;
% end