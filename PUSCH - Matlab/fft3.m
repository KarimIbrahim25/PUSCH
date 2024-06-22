% function freq3=fft3(x,q)
% y=0;
% N=length(x);
% X=zeros(N,1);
% 
% if(y==0)
%     
% for k=0:3:3^(4-(4-q))-1
%     
%     for n=1:3^(4-(4-q))/3
%         
%         X(k+1)=X(k+1)+((x(n)+x(n+N/3)+x(n+2*N/3))*twiddle(k*(n-1),N));
%     
%         X(k+2)=X(k+2)+((x(n)+x(n+N/3)*twiddle(1,3)+x(n+2*N/3)*twiddle(2,3))*twiddle(k*(n-1),N)*twiddle(n-1,N));
%  
%         X(k+3)=X(k+3)+((x(n)+x(n+N/3)*twiddle(2,3)+x(n+2*N/3)*twiddle(1,3))*twiddle(k*(n-1),N)*twiddle(2*(n-1),N));
%     
%     end
%     
% end
% 
% end
% 
% if(y==1)
%     z=400;
%     w=400;
% for k=0:3:3^(4-(4-q))-1
%     
%     for n=1:3^(4-(4-q))/3
%         
%         X(k+1)=X(k+1)+Quantizer((x(n)+x(n+N/3)+x(n+2*N/3))*twiddle(k*(n-1),N,y),z,w);
%     
%         X(k+2)=X(k+2)+Quantizer((x(n)+x(n+N/3)*twiddle(1,3,y)+x(n+2*N/3)*twiddle(2,3,y))*twiddle(k*(n-1),N,y)*twiddle(n-1,N,y),z,w);
%  
%         X(k+3)=X(k+3)+Quantizer((x(n)+x(n+N/3)*twiddle(2,3,y)+x(n+2*N/3)*twiddle(1,3,y))*twiddle(k*(n-1),N,y)*twiddle(2*(n-1),N,y),z,w);
%     
%     end
%     
% end
% end
% 
% if(y==2)
%     z=4;
%     w=5;
% for k=0:3:3^(4-(4-q))-1
%     
%     for n=1:3^(4-(4-q))/3
%         
%         X(k+1)=X(k+1)+quantizet((x(n)+x(n+N/3)+x(n+2*N/3))*twiddle(k*(n-1),N,y),z,w);
%     
%         X(k+2)=X(k+2)+quantizet((x(n)+x(n+N/3)*twiddle(1,3,y)+x(n+2*N/3)*twiddle(2,3,y))*twiddle(k*(n-1),N,y)*twiddle(n-1,N,y),z,w);
%  
%         X(k+3)=X(k+3)+quantizet((x(n)+x(n+N/3)*twiddle(2,3,y)+x(n+2*N/3)*twiddle(1,3,y))*twiddle(k*(n-1),N,y)*twiddle(2*(n-1),N,y),z,w);
%     
%     end
%     
% end
% end
% freq3=X;
% end

% function y  = fft3(x,S,q_twid,q_3,this,integer,fraction)                                                                                                         
% N=length(x);                                                                                                                                  
% Third=1; 
% x=ord(x,3); 
% if q_3==0
%     for stage=1:S                                                             
%         for index=0:((3^(stage))):(N-1)                                 
%             for n=0:(Third-1)                                                  
%                 pos=n+index+1;                                                                                                                              
%                 a=x(pos)+x(pos+Third).*twiddle((3^(S-stage))*n,N,q_twid)+x(pos+2*Third).*twiddle((3^(S-stage))*2*n,N,q_twid);                                           
%                 b=x(pos)+x(pos+Third).*twiddle((3^(S-stage))*n,N,q_twid)*twiddle(1,3,q_twid)+x(pos+2*Third)*twiddle(2,3,q_twid).*twiddle((3^(S-stage))*2*n,N,q_twid);     
%                 c=x(pos)+x(pos+Third).*twiddle((3^(S-stage))*n,N,q_twid)*twiddle(2,3,q_twid)+x(pos+2*Third)*twiddle(1,3,q_twid).*twiddle((3^(S-stage))*2*n,N,q_twid);  
%                 x(pos)=a;                                                       
%                 x(pos+Third)=b;  
%                 x(pos+2*Third)=c;
%             end
%         end
%     Third=Third*3;                                                                
%     end
% end
% 
% if q_3==1
%     for stage=1:S                                                             
%         for index=0:((3^(stage))):(N-1)                                 
%             for n=0:(Third-1)                                                  
%                 pos=n+index+1;                                                                                                                              
%                 a=x(pos)+x(pos+Third)+x(pos+2*Third);                                           
%                 b=(x(pos)+x(pos+Third)*twiddle(1,3,q_twid)+x(pos+2*Third)*twiddle(2,3,q_twid)).*twiddle((3^(S-stage))*n,N,q_twid);     
%                 c=(x(pos)+x(pos+Third)*twiddle(2,3,q_twid)+x(pos+2*Third)*twiddle(1,3,q_twid)).*twiddle((3^(S-stage))*2*n,N,q_twid);  
%                 x(pos)=a;                                                       
%                 x(pos+Third)=b;  
%                 x(pos+2*Third)=c;
%             end
%         end
%      Third=Third*3;  
% 
%         if stage==this
%             x=Quantizer(x,6,7);
%         end
% 
%     end
% end    
% 
% y=x;                                                          
% end

function y  = fft3(x,S,q_twid,q_3,this,integer,fraction)                                                                                                         
N=length(x);                                                                                                                                  
Third=N/3;

if q_3==0
    for stage=1:S                                                             
        for index=0:(N/(3^(stage-1))):(N-1)                                 
            for n=0:(Third-1)                                                  
                pos=n+index+1;                                                                                                                              
                a=x(pos)+x(pos+Third)+x(pos+2*Third);                                           
                b=(x(pos)+Quantizer(x(pos+Third)*twiddle(1,3,q_twid),8,10)+Quantizer(x(pos+2*Third)*twiddle(2,3,q_twid),8,10)).*twiddle((3^(stage-1))*n,N,q_twid);     
                c=(x(pos)+Quantizer(x(pos+Third)*twiddle(2,3,q_twid),8,10)+Quantizer(x(pos+2*Third)*twiddle(1,3,q_twid),8,10)).*twiddle((3^(stage-1))*2*n,N,q_twid);  
                x(pos)=a;                                                       
                x(pos+Third)=b;  
                x(pos+2*Third)=c;
            end
        end
    Third=Third/3;                                                                
    end
end

if q_3==1
    for stage=1:S                                                             
        for index=0:(N/(3^(stage-1))):(N-1)                                 
            for n=0:(Third-1)                                                  
                pos=n+index+1;                                                                                                                              
                a=x(pos)+x(pos+Third)+x(pos+2*Third); 
                tempb=(x(pos)+Quantizer(x(pos+Third)*twiddle(1,3,q_twid),8,10)+Quantizer(x(pos+2*Third)*twiddle(2,3,q_twid),8,10));
                b=tempb.*twiddle((3^(stage-1))*n,N,q_twid,integer,fraction);
                tempc=(x(pos)+Quantizer(x(pos+Third)*twiddle(2,3,q_twid),8,10)+Quantizer(x(pos+2*Third)*twiddle(1,3,q_twid),8,10));
                c=tempc.*twiddle((3^(stage-1))*2*n,N,q_twid,integer,fraction);  
                x(pos)=a;                                                       
                x(pos+Third)=b;  
                x(pos+2*Third)=c;
             end
        end
        Third=Third/3;
%         if stage==this
            x=Quantizer(x,8,10);
%         end
       
    end
end    

y=ord(x,3);
% y=x;
end