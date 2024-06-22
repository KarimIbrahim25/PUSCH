
% %% Random input quantized
% levels = -2^18:(2^18)-1;
% N=2048;
% x = randsrc(1,N,levels) + 1j*randsrc(1,N,levels);
% fraction = 10;
% x = x./2^fraction;
% 
% % Open the file for writing
% fid = fopen('complex_numbers_r4.txt', 'w');
% 
% % Write the complex numbers to the file
% for i = 1:numel(x)
%     fprintf(fid, '%.15f %.15f\n', real(x(i)), imag(x(i)));
% end
% 
% % Close the file
% fclose(fid);
%%
save = x;
X=zeros(2048,1);
q_int=0;
q_twid = 2;
% n = 0;
    for n = 0:(N/2):(N/2)
        for i=1:(N/8)       
            a(i+n/4) = (x(i+n) + x(i+n+N/8) + x(i+n+2*(N/8)) + x(i+n+3*(N/8)));
            b(i+n/4) = (x(i+n) + x(i+n+N/8).*(-1i) + x(i+n+2*(N/8)).*(-1)  + x(i+n+3*(N/8)).*(1i));
            c(i+n/4) = (x(i+n) + x(i+n+N/8).*(-1)  + x(i+n+2*(N/8)).*(-1i) + x(i+n+3*(N/8)).*(1i));
            d(i+n/4) = (x(i+n) + x(i+n+N/8).*(1i)  + x(i+n+2*(N/8)).*(-1)  + x(i+n+3*(N/8)).*(-1i));

            X(i+n) = d(i+n/4);
            X(i+n+N/8) = a(i+n/4).*twiddle((i-1),N,q_twid);
            X(i+n+2*(N/8)) = b(i+n/4).*twiddle((i-1)*2,N,q_twid);
            X(i+n+3*(N/8)) = c(i+n/4).*twiddle((i-1)*3,N,q_twid);      
        end
    end
%     t=1;
%     for j=(N/2)+1:(5*N/8)         
%         a1(t) = (x(j) + x(j+N/8) + x(j+2*(N/8)) + x(j+3*(N/8)));
%         b1(t) = (x(j) + x(j+N/8)*(-1i) + x(j+2*(N/8))*(-1)  + x(j+3*(N/8))*(1i));
%         c1(t) = (x(j) + x(j+N/8)*(-1)  + x(j+2*(N/8))*(-1i) + x(j+3*(N/8))*(1i));
%         d1(t) = (x(j) + x(j+N/8)*(1i)  + x(j+2*(N/8))*(-1)  + x(j+3*(N/8))*(-1i));
%       
%         X(j) = d1(t);
%         X(j+N/8) = a1(t).*twiddle((j-((N/2)+1)),N,q_twid);
%         X(j+2*(N/8)) = b1(t).*twiddle((j-((N/2)+1))*2,N,q_twid);
%         X(j+3*(N/8)) = c1(t).*twiddle((j-((N/2)+1))*3,N,q_twid);
%       
%         t=t+1;
%     end       
% X=X/N;
X=quantizer(X,14,10);

SAVEX=X;
% Builtin=fft(x);
% MSE_dB=10*log10(abs(mean(X(:)-Builtin(:))).^2);

% if isequal(X(2), array(2))
%     disp('The files are identical.');
% else
%     disp('The files are not identical.');0
% end
SQNR=sqnr(X,SAVEX);

%% out read questa
file_path = "J:\\Collage\\Graduation Project\\Simulations\\questa_r4_r.txt";
% Open the file for reading
fileID = fopen(file_path, 'r');
for i = 1:3
    fgetl(fileID);
end
% Read the contents of the file
dataArray = textscan(fileID, '%f');
% Close the file
fclose(fileID);
% Access the data from the cell array
array_r = dataArray{1};
% Define the full path of the file
file_path = "J:\\Collage\\Graduation Project\\Simulations\\questa_r4_i.txt";
% Open the file for reading
fileID = fopen(file_path, 'r');
for i = 1:3
    fgetl(fileID);
end
% Read the contents of the file
dataArray = textscan(fileID, '%f');
% Close the file
fclose(fileID);
% Access the data from the cell array
array_i = dataArray{1};
array=array_r+(array_i.*1i);
array=array./2^10;
SQNR=sqnr(X,array);
%%
% SQNR=sqnr(X,v);
% MSE_dB_r2=10*log10(abs(mean(X(:)-v(:))).^2);

%%     output MATLAB to convert it to binary py
% Open the file for writing
fid2 = fopen('complex_numbers_out_v.txt', 'w');

% Write the complex numbers to the file
for i = 1:numel(x)
    fprintf(fid2, '%.15f %.15f\n', real(v(i)), imag(v(i)));
end

% Close the file
fclose(fid2);
%%
% Read the contents of the first text file
file_path = "J:\\Collage\\Graduation Project\\Simulations\\questa_r2_r.txt";

% Open the file for reading
fid = fopen(file_path, 'r');
txt1_contents = textscan(fid, '%s');
fclose(fid);

v1 = txt1_contents{1};
% v1= (v1)./(2^10);
array_r= (array_r)./(2^10);

% file_path = "J:\\Collage\\Graduation Project\\RTL\\outmat_r2_r.txt";
% 
% % Open the file for reading
% fid = fopen(file_path, 'r');
% txt2_contents = textscan(fid, '%s');
% fclose(fid);

% Convert binary strings to decimal numbers for txt1
% x1_decimal = bin2dec(txt1_contents{1});

% Convert binary strings to decimal numbers for txt2
% x2_decimal = bin2dec(txt2_contents{1});

% Compare x1 and x2
% if isequal(x1_decimal, x2_decimal)
%     disp('The files are identical.');
% else
%     disp('The files are not identical.');
% end

% SQNR=sqnr(x1_decimal,x2_decimal);


%% x to dec
file_path = "J:\\Collage\\Graduation Project\\RTL\\in_r2_r.txt";

% Open the file for reading
fid = fopen(file_path, 'r');
txt3_contents = textscan(fid, '%s');
fclose(fid);

% Convert binary strings to decimal numbers for txt1
in_decimal = bin2dec(txt3_contents{1});

%% v to dec
file_path = "J:\\Collage\\Graduation Project\\RTL\\v_r2_r.txt";

% Open the file for reading
fid = fopen(file_path, 'r');
txt4_contents = textscan(fid, '%s');
fclose(fid);

% Convert binary strings to decimal numbers for txt1
v_decimal = bin2dec(txt4_contents{1});
