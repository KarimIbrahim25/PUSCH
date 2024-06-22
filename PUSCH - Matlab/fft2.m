% % p=4;
% % N=16;
% % W=zeros(p,2^p);
% % 
% % for i=1:size(W,1)
% %     for j=1:size(W,2)/2^i
% %         W(i,j+size(W,2)/(2^i))=twiddle(mod(j-1,size(W,2)/2^i),N,0);
% %     end
% % end
% 
% function freq2=fft2(x,p)
% y=0;
% N=length(x);
% X=zeros(N,1);
% 
% if(y==0)
% for k=0:2:2^(8-(8-p))-1
%     
%     for n=1:(2^(8-(8-p)))/2
%         
%         X(k+1)=X(k+1)+((x(n)+x(n+N/2))*twiddle(k*(n-1),N));
%         
%         X(k+2)=X(k+2)+((x(n)-x(n+N/2))*twiddle(k*(n-1),N)*twiddle(n-1,N));
%         
%     end
%     
% end 
% end
% 
% if(y==1)
%     z=400;
%     w=400;
% for k=0:2:2^(8-(8-p))-1
%     
%     for n=1:(2^(8-(8-p)))/2
%         
%         X(k+1)=X(k+1)+Quantizer((x(n)+x(n+N/2))*twiddle(k*(n-1),N,y)/2,z,w);
%         
%         X(k+2)=X(k+2)+Quantizer((x(n)-x(n+N/2))*twiddle(k*(n-1),N,y)*twiddle(n-1,N,y)/2,z,w);
%         
%     end
%     
% end 
% end
% 
% if(y==2)
%     z=5;
%     w=5;
% for k=0:2:2^(8-(8-p))-1
%     
%     for n=1:(2^(8-(8-p)))/2
%         
%         X(k+1)=X(k+1)+quantizet((x(n)+x(n+N/2))*twiddle(k*(n-1),N),z,w);
%         
%         X(k+2)=X(k+2)+quantizet((x(n)-x(n+N/2))*twiddle(k*(n-1),N)*twiddle(n-1,N),z,w);
%         
%     end
%     
% end 
% end
% 
% freq2=X;
% end

% function y  = fft2(x,S,q_twid,q_2,this,integer,fraction)                                                                                                         
% N=length(x);                                                                                                                                  
% Half=1;
% x=ord(x,2);
% if q_2==0
% for stage=1:S                                                             
%     for index=0:((2^(stage))):(N-1)                                 
%         for n=0:(Half-1)                                                  
%             pos=n+index+1;                                                                                                                              
%             a=x(pos)+x(pos+Half).*twiddle((2^(S-stage))*n,N,q_twid);                                           
%             b=(x(pos)-x(pos+Half)).*twiddle((2^(S-stage))*n,N,q_twid);                                     
%             x(pos)=a;                                                       
%             x(pos+Half)=b;                                                  
%         end
%     end
% Half=Half*2;                                                                
% end
% end
% 
% if q_2==1
%     for stage=1:S                                                             
%         for index=0:(N/(2^(stage-1))):(N-1)                                 
%             for n=0:(Half-1)                                                  
%                 pos=n+index+1;                                                                                                                              
%                 a=x(pos)+x(pos+Half);                                           
%                 b=(x(pos)-x(pos+Half)).*twiddle((2^(stage-1))*n,N,q_twid);                                     
%                 x(pos)=a;                                                       
%                 x(pos+Half)=b;                                                  
%             end
%         end
%         Half=Half/2;  
% 
% %         if stage==this
%             x=Quantizer(x,7,6);
% %         end
%     end
% end
% 
% y=x;                                                           
% end

function y  = fft2(x,S,q_twid,q_2,this,integer,fraction)                                                                                                         
N=length(x);                                                                                                                                  
Half=N/2;
integer=8;
fraction=10;
if q_2==0
for stage=1:S                                                             
    for index=0:(N/(2^(stage-1))):(N-1)                                 
        for n=0:(Half-1)                                                  
            pos=n+index+1;                                                                                                                              
            a=x(pos)+x(pos+Half);                                           
            b=(x(pos)-x(pos+Half)).*twiddle((2^(stage-1))*n,N,q_twid);                                     
            x(pos)=a;                                                       
            x(pos+Half)=b;                                                  
        end
    end
Half=Half/2;                                                                
end
end

if q_2==1
    for stage=1:S                                                             
        for index=0:(N/(2^(stage-1))):(N-1)                                 
            for n=0:(Half-1)                                                  
                pos=n+index+1;                                                                                                                              
                a=x(pos)+x(pos+Half);                                           
                b=(x(pos)-x(pos+Half)).*twiddle((2^(stage-1))*n,N,q_twid,integer,fraction);                                     
                x(pos)=a;                                                       
                x(pos+Half)=b;                                                  
            end
        end
        Half=Half/2;  
        
%         if stage==this
            x=Quantizer(x,integer,fraction);
%         end
    end
end

y=ord(x,2);
% y=x;
end


% function freq2=fft2(x,stages)
% N=length(x);
% 
% X=bitrevorder(x);
% 
% R=0;
% for i=1:stages
%   t=0:2^(i-1)-1;  
%   k=N*t/(2^i); 
%   if i>1
%       X=R;
%   end
%     for p=1:2^i:N
%         for o=0:2^(i-1)-1
%             X(p+2^(i-1)+o)=X(p+2^(i-1)+o)*twiddle(k(mod(o,length(k))+1),N);
%         end
%     end
%     h=1;
%     for n=1:2^i:N
%         if n+2^(i-1)>N
%             break;
%         end
%         for o=0:2^(i-1)-1
%             R(h)=X(n+o)+X(n+2^(i-1)+o);
%             h=h+1;
%         end
%         for o=0:2^(i-1)-1
%             R(h)=X(n+o)-X(n+2^(i-1)+o);  
%             h=h+1;
%         end
%        
%     end
% 
% end 
% R=round(R,4);
% freq2=R;
% end








