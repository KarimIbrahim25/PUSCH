% % Random input quantized
% % levels = levels = -2^18:(2^18)-1;;
% % N=2048;
% % x = randsrc(N,1,levels) + 1j*randsrc(N,1,levels);
% % fraction = 10;
% % x = x./2^fraction;
%% MIXED Radix 2048 POINT IFFT
% IFTT_out=Split(x,2048);
function y=Split(x,N)
N=length(x);
X1=zeros(2048,1);
% Stage 1 Radix 2                   %% 1024 POINT %%
q_twid = 2;
for i=1:N/2
    a(i) = x(i+N/2) + x(i);
    b(i) = x(i+N/2) - x(i);
    X1(i) = a(i);
    X1(i+N/2) = b(i).*twiddleR((i-1),N,q_twid);
end
X1=Quantizer(X1,15,10);

% Stage 2 Radix 4-1                   %% 256 POINT %%
X2=zeros(2048,1);
q_twid = 2;
    for n = 0:(N/2):(N/2)
        for i=1:(N/8)       
            a1(i+n/4) = (X1(i+n) + X1(i+n+N/8) + X1(i+n+2*(N/8)) + X1(i+n+3*(N/8)));
            b1(i+n/4) = (X1(i+n) + X1(i+n+N/8).*(-1i) + X1(i+n+2*(N/8)).*(-1)  + X1(i+n+3*(N/8)).*(1i));
            c1(i+n/4) = (X1(i+n) + X1(i+n+N/8).*(-1)  + X1(i+n+2*(N/8)).*(-1i) + X1(i+n+3*(N/8)).*(1i));
            d1(i+n/4) = (X1(i+n) + X1(i+n+N/8).*(1i)  + X1(i+n+2*(N/8)).*(-1)  + X1(i+n+3*(N/8)).*(-1i));

            X2(i+n) = d1(i+n/4);
            X2(i+n+N/8) = a1(i+n/4).*twiddleR((i-1),N,q_twid);
            X2(i+n+2*(N/8)) = b1(i+n/4).*twiddleR((i-1)*2,N,q_twid);
            X2(i+n+3*(N/8)) = c1(i+n/4).*twiddleR((i-1)*3,N,q_twid);      
        end
    end      
X2=Quantizer(X2,15,10);

% Stage 3 Radix 4-2                   %% 64 POINT %%
X3=zeros(2048,1);
q_twid = 2;
r42 = 4;   % Radix boundary twiddleRs step ex 4,8,12
    for n = 0:(N/8):(N/8)*7
        for i=1:(N/32)       
            a2(i+n/4) = (X2(i+n) + X2(i+n+N/32) + X2(i+n+2*(N/32)) + X2(i+n+3*(N/32)));
            b2(i+n/4) = (X2(i+n) + X2(i+n+N/32).*(-1i) + X2(i+n+2*(N/32)).*(-1)  + X2(i+n+3*(N/32)).*(1i));
            c2(i+n/4) = (X2(i+n) + X2(i+n+N/32).*(-1)  + X2(i+n+2*(N/32)).*(-1i) + X2(i+n+3*(N/32)).*(1i));
            d2(i+n/4) = (X2(i+n) + X2(i+n+N/32).*(1i)  + X2(i+n+2*(N/32)).*(-1)  + X2(i+n+3*(N/32)).*(-1i));

            X3(i+n) = d2(i+n/4);
            X3(i+n+N/32) = a2(i+n/4).*twiddleR((i-1)*r42,N,q_twid);
            X3(i+n+2*(N/32)) = b2(i+n/4).*twiddleR((i-1)*2*r42,N,q_twid);
            X3(i+n+3*(N/32)) = c2(i+n/4).*twiddleR((i-1)*3*r42,N,q_twid);      
        end
    end        
X3=Quantizer(X3,15,10);

% Stage 4 Radix 4-3                   %% 16 POINT %%
X4=zeros(2048,1);
q_twid = 2;
r43 = 16;   % Radix boundary twiddleRs step ex 16,32,48
    for n = 0:(N/32):(N/32)*31
        for i=1:(N/128)       
            a3(i+n/4) = (X3(i+n) + X3(i+n+N/128) + X3(i+n+2*(N/128)) + X3(i+n+3*(N/128)));
            b3(i+n/4) = (X3(i+n) + X3(i+n+N/128).*(-1i) + X3(i+n+2*(N/128)).*(-1)  + X3(i+n+3*(N/128)).*(1i));
            c3(i+n/4) = (X3(i+n) + X3(i+n+N/128).*(-1)  + X3(i+n+2*(N/128)).*(-1i) + X3(i+n+3*(N/128)).*(1i));
            d3(i+n/4) = (X3(i+n) + X3(i+n+N/128).*(1i)  + X3(i+n+2*(N/128)).*(-1)  + X3(i+n+3*(N/128)).*(-1i));

            X4(i+n) = d3(i+n/4);
            X4(i+n+N/128) = a3(i+n/4).*twiddleR((i-1)*r43,N,q_twid);
            X4(i+n+2*(N/128)) = b3(i+n/4).*twiddleR((i-1)*2*r43,N,q_twid);
            X4(i+n+3*(N/128)) = c3(i+n/4).*twiddleR((i-1)*3*r43,N,q_twid);      
        end
    end        
X4=Quantizer(X4,15,10);

% Stage 5 Radix 4-4                   %% 4 POINT %%
X5=zeros(2048,1);
q_twid = 2;
r44 = 64;   % Radix boundary twiddleRs step ex 64,128,192
    for n = 0:(N/128):(N/128)*127
        for i=1:(N/512)       
            a4(i+n/4) = (X4(i+n) + X4(i+n+N/512) + X4(i+n+2*(N/512)) + X4(i+n+3*(N/512)));
            b4(i+n/4) = (X4(i+n) + X4(i+n+N/512).*(-1i) + X4(i+n+2*(N/512)).*(-1)  + X4(i+n+3*(N/512)).*(1i));
            c4(i+n/4) = (X4(i+n) + X4(i+n+N/512).*(-1)  + X4(i+n+2*(N/512)).*(-1i) + X4(i+n+3*(N/512)).*(1i));
            d4(i+n/4) = (X4(i+n) + X4(i+n+N/512).*(1i)  + X4(i+n+2*(N/512)).*(-1)  + X4(i+n+3*(N/512)).*(-1i));

            X5(i+n) = d4(i+n/4);
            X5(i+n+N/512) = a4(i+n/4).*twiddleR((i-1)*r44,N,q_twid);
            X5(i+n+2*(N/512)) = b4(i+n/4).*twiddleR((i-1)*2*r44,N,q_twid);
            X5(i+n+3*(N/512)) = c4(i+n/4).*twiddleR((i-1)*3*r44,N,q_twid);      
        end
    end        
X5=Quantizer(X5,15,10);

% Stage 6 Radix 4-5                   %% 1 POINT %%
X6=zeros(2048,1);
q_twid = 2;
r45 = 256;   % Radix boundary twiddleRs step ex 256,512,768
    for n = 0:(N/512):(N/512)*511
        for i=1:(N/2048)       
            a5(i+n/4) = (1/N)*(X5(i+n) + X5(i+n+N/2048) + X5(i+n+2*(N/2048)) + X5(i+n+3*(N/2048)));
            b5(i+n/4) = (1/N)*(X5(i+n) + X5(i+n+N/2048).*(-1i) + X5(i+n+2*(N/2048)).*(-1)  + X5(i+n+3*(N/2048)).*(1i));
            c5(i+n/4) = (1/N)*(X5(i+n) + X5(i+n+N/2048).*(-1)  + X5(i+n+2*(N/2048)).*(-1i) + X5(i+n+3*(N/2048)).*(1i));
            d5(i+n/4) = (1/N)*(X5(i+n) + X5(i+n+N/2048).*(1i)  + X5(i+n+2*(N/2048)).*(-1)  + X5(i+n+3*(N/2048)).*(-1i));

            X6(i+n) = d5(i+n/4);
            X6(i+n+N/2048) = a5(i+n/4);
            X6(i+n+2*(N/2048)) = b5(i+n/4);
            X6(i+n+3*(N/2048)) = c5(i+n/4);      
        end
    end 
X6=Quantizer(X6,15,10);

% ordering with 1024
X6_1=X6(1:1024);
X6_2=X6(1025:2048);

y1=ord(X6_1,4);
y2=ord(X6_2,4);
y1=reshape(y1,N/2,1);
y2=reshape(y2,N/2,1);

y=vertcat(y1,y2);
end