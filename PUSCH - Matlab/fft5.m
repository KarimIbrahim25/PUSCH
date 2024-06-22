% function freq5=fft5(x,r)
% y=0;
% N=length(x);
% X=zeros(N,1);
% if(y==0)
% for k=0:5:5^(2-(2-r))-1
%     
%     for n=1:5^(2-(2-r))/5
%         
%         X(k+1)=X(k+1)+((x(n)+x(n+N/5)+x(n+2*N/5)+x(n+3*N/5)+x(n+4*N/5))*twiddle(k*(n-1),N,q_twid));
%  
%         X(k+2)=X(k+2)+((x(n)+x(n+N/5)*twiddle(1,5,q_twid)+x(n+2*N/5)*twiddle(2,5,q_twid)+x(n+3*N/5)*twiddle(3,5,q_twid)+x(n+4*N/5)*twiddle(4,5,q_twid))*twiddle(k*(n-1),N,q_twid)*twiddle(n-1,N,q_twid));
%   
%         X(k+3)=X(k+3)+((x(n)+x(n+N/5)*twiddle(2,5,q_twid)+x(n+2*N/5)*twiddle(4,5,q_twid)+x(n+3*N/5)*twiddle(1,5,q_twid)+x(n+4*N/5)*twiddle(3,5,q_twid))*twiddle(k*(n-1),N,q_twid)*twiddle(2*(n-1),N,q_twid));
%  
%         X(k+4)=X(k+4)+((x(n)+x(n+N/5)*twiddle(3,5,q_twid)+x(n+2*N/5)*twiddle(1,5,q_twid)+x(n+3*N/5)*twiddle(4,5,q_twid)+x(n+4*N/5)*twiddle(2,5,q_twid))*twiddle(k*(n-1),N,q_twid)*twiddle(3*(n-1),N,q_twid));
%     
%         X(k+5)=X(k+5)+((x(n)+x(n+N/5)*twiddle(4,5,q_twid)+x(n+2*N/5)*twiddle(3,5,q_twid)+x(n+3*N/5)*twiddle(2,5,q_twid)+x(n+4*N/5)*twiddle(1,5,q_twid))*twiddle(k*(n-1),N,q_twid)*twiddle(4*(n-1),N,q_twid));
%     
%     end
%     
% end
% end
% 
% if(y==1)
%     w=400;
%     z=400;
% for k=0:5:5^(2-(2-r))-1
%     
%     for n=1:5^(2-(2-r))/5
%         
%         X(k+1)=X(k+1)+quantizer((x(n)+x(n+N/5)+x(n+2*N/5)+x(n+3*N/5)+x(n+4*N/5))*twiddle(k*(n-1),N,q_twid,y),z,w);
%  
%         X(k+2)=X(k+2)+quantizer((x(n)+x(n+N/5)*twiddle(1,5,q_twid,y)+x(n+2*N/5)*twiddle(2,5,q_twid,y)+x(n+3*N/5)*twiddle(3,5,q_twid,y)+x(n+4*N/5)*twiddle(4,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(n-1,N,q_twid,y),z,w);
%   
%         X(k+3)=X(k+3)+quantizer((x(n)+x(n+N/5)*twiddle(2,5,q_twid,y)+x(n+2*N/5)*twiddle(4,5,q_twid,y)+x(n+3*N/5)*twiddle(1,5,q_twid,y)+x(n+4*N/5)*twiddle(3,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(2*(n-1),N,q_twid,y),z,w);
%  
%         X(k+4)=X(k+4)+quantizer((x(n)+x(n+N/5)*twiddle(3,5,q_twid,y)+x(n+2*N/5)*twiddle(1,5,q_twid,y)+x(n+3*N/5)*twiddle(4,5,q_twid,y)+x(n+4*N/5)*twiddle(2,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(3*(n-1),N,q_twid,y),z,w);
%     
%         X(k+5)=X(k+5)+quantizer((x(n)+x(n+N/5)*twiddle(4,5,q_twid,y)+x(n+2*N/5)*twiddle(3,5,q_twid,y)+x(n+3*N/5)*twiddle(2,5,q_twid,y)+x(n+4*N/5)*twiddle(1,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(4*(n-1),N,q_twid,y),z,w);
%     
%     end
%     
% end
% end
% 
% if(y==2)
%     w=20;
%     z=20;
% for k=0:5:5^(2-(2-r))-1
%     
%     for n=1:5^(2-(2-r))/5
%         
%         X(k+1)=X(k+1)+quantizet((x(n)+x(n+N/5)+x(n+2*N/5)+x(n+3*N/5)+x(n+4*N/5))*twiddle(k*(n-1),N,q_twid,y),z,w);
%  
%         X(k+2)=X(k+2)+quantizet((x(n)+x(n+N/5)*twiddle(1,5,q_twid,y)+x(n+2*N/5)*twiddle(2,5,q_twid,y)+x(n+3*N/5)*twiddle(3,5,q_twid,y)+x(n+4*N/5)*twiddle(4,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(n-1,N,q_twid,y),z,w);
%   
%         X(k+3)=X(k+3)+quantizet((x(n)+x(n+N/5)*twiddle(2,5,q_twid,y)+x(n+2*N/5)*twiddle(4,5,q_twid,y)+x(n+3*N/5)*twiddle(1,5,q_twid,y)+x(n+4*N/5)*twiddle(3,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(2*(n-1),N,q_twid,y),z,w);
%  
%         X(k+4)=X(k+4)+quantizet((x(n)+x(n+N/5)*twiddle(3,5,q_twid,y)+x(n+2*N/5)*twiddle(1,5,q_twid,y)+x(n+3*N/5)*twiddle(4,5,q_twid,y)+x(n+4*N/5)*twiddle(2,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(3*(n-1),N,q_twid,y),z,w);
%     
%         X(k+5)=X(k+5)+quantizet((x(n)+x(n+N/5)*twiddle(4,5,q_twid,y)+x(n+2*N/5)*twiddle(3,5,q_twid,y)+x(n+3*N/5)*twiddle(2,5,q_twid,y)+x(n+4*N/5)*twiddle(1,5,q_twid,y))*twiddle(k*(n-1),N,q_twid,y)*twiddle(4*(n-1),N,q_twid,y),z,w);
%     
%     end
%     
% end
% end
% 
% freq5=X;
% end

% function y  = fft5(x,S,q_twid,q_5,this,integer,fraction)                                                                                                         
% N=length(x);                                                                                                                                  
% fifth=1;
% x=ord(x,5);
% if q_5==0
%     for stage=1:S                                                             
%         for index=0:((5^(stage))):(N-1)                                 
%             for n=0:(fifth-1)                                                  
%                 pos=n+index+1;                                                                                                                              
%                  a=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)+                    x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)+                    x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)+                    x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid));   
%                 b=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(4,5,q_twid));     
%                 c=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(3,5,q_twid));
%                 d=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(2,5,q_twid)); 
%                 e=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(1,5,q_twid)); 
% 
%                 x(pos)=a;                                                       
%                 x(pos+fifth)=b;  
%                 x(pos+2*fifth)=c;
%                 x(pos+3*fifth)=d;
%                 x(pos+4*fifth)=e;
%             end
%         end
%     fifth=fifth*5;  
%     end
% end
% 
% if q_5==1
%     for stage=1:S                                                             
%         for index=0:((5^(stage))):(N-1)                                 
%             for n=0:(fifth-1)                                                  
%                 pos=n+index+1;                                                                                                                              
%                 a=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)+                    x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)+                    x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)+                    x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid));   
%                 b=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(4,5,q_twid));     
%                 c=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(3,5,q_twid));
%                 d=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(1,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(2,5,q_twid)); 
%                 e=(x(pos)+x(pos+fifth).*twiddle((5^(S-stage))*n,N,q_twid)*twiddle(4,5,q_twid)+x(pos+2*fifth).*twiddle((5^(S-stage))*2*n,N,q_twid)*twiddle(3,5,q_twid)+x(pos+3*fifth).*twiddle((5^(S-stage))*3*n,N,q_twid)*twiddle(2,5,q_twid)+x(pos+4*fifth).*twiddle((5^(S-stage))*4*n,N,q_twid)*twiddle(1,5,q_twid)); 
% 
%                 x(pos)=a;                                                       
%                 x(pos+fifth)=b;  
%                 x(pos+2*fifth)=c;
%                 x(pos+3*fifth)=d;
%                 x(pos+4*fifth)=e;
%             end
%         end
%     fifth=fifth*5;
% 
% %         if stage==this
%             x=quantizer(x,4,7);
% %         end 
%     end
% end
% 
% y=x;                                                          
% end
function y  = fft5(x,S,q_twid,q_5,this,integer,fraction)                                                                                                         
N=length(x);                                                                                                                                  
fifth=N/5;

if q_5==0
    for stage=1:S                                                             
        for index=0:(N/(5^(stage-1))):(N-1)                                 
            for n=0:(fifth-1)                                                  
                pos=n+index+1;                                                                                                                              
                a=x(pos)+x(pos+fifth)+x(pos+2*fifth)+x(pos+3*fifth)+x(pos+4*fifth);   
                b=(x(pos)+x(pos+fifth)*twiddle(1,5,q_twid)+x(pos+2*fifth)*twiddle(2,5,q_twid)+x(pos+3*fifth)*twiddle(3,5,q_twid)+x(pos+4*fifth)*twiddle(4,5,q_twid)).*twiddle((5^(stage-1))*n,N,q_twid);     
                c=(x(pos)+x(pos+fifth)*twiddle(2,5,q_twid)+x(pos+2*fifth)*twiddle(4,5,q_twid)+x(pos+3*fifth)*twiddle(1,5,q_twid)+x(pos+4*fifth)*twiddle(3,5,q_twid)).*twiddle((5^(stage-1))*2*n,N,q_twid);
                d=(x(pos)+x(pos+fifth)*twiddle(3,5,q_twid)+x(pos+2*fifth)*twiddle(1,5,q_twid)+x(pos+3*fifth)*twiddle(4,5,q_twid)+x(pos+4*fifth)*twiddle(2,5,q_twid)).*twiddle((5^(stage-1))*3*n,N,q_twid); 
                e=(x(pos)+x(pos+fifth)*twiddle(4,5,q_twid)+x(pos+2*fifth)*twiddle(3,5,q_twid)+x(pos+3*fifth)*twiddle(2,5,q_twid)+x(pos+4*fifth)*twiddle(1,5,q_twid)).*twiddle((5^(stage-1))*4*n,N,q_twid); 

                x(pos)=a;                                                       
                x(pos+fifth)=b;  
                x(pos+2*fifth)=c;
                x(pos+3*fifth)=d;
                x(pos+4*fifth)=e;
            end
        end
    fifth=fifth/5;  
    end
end

if q_5==1
    for stage=1:S                                                             
        for index=0:(N/(5^(stage-1))):(N-1)                                 
            for n=0:(fifth-1)                                                  
                pos=n+index+1;                                                                                                                              
                a=x(pos)+x(pos+fifth)+x(pos+2*fifth)+x(pos+3*fifth)+x(pos+4*fifth); 
                tempb=(x(pos)+quantizer(x(pos+fifth)*twiddle(1,5,q_twid),8,10)+quantizer(x(pos+2*fifth)*twiddle(2,5,q_twid),8,10)+quantizer(x(pos+3*fifth)*twiddle(3,5,q_twid),8,10)+quantizer(x(pos+4*fifth)*twiddle(4,5,q_twid),8,10));
                b=tempb.*twiddle((5^(stage-1))*n,N,q_twid);   
                tempc=(x(pos)+quantizer(x(pos+fifth)*twiddle(2,5,q_twid),8,10)+quantizer(x(pos+2*fifth)*twiddle(4,5,q_twid),8,10)+quantizer(x(pos+3*fifth)*twiddle(1,5,q_twid),8,10)+quantizer(x(pos+4*fifth)*twiddle(3,5,q_twid),8,10));
                c=tempc.*twiddle((5^(stage-1))*2*n,N,q_twid);
                tempd=(x(pos)+quantizer(x(pos+fifth)*twiddle(3,5,q_twid),8,10)+quantizer(x(pos+2*fifth)*twiddle(1,5,q_twid),8,10)+quantizer(x(pos+3*fifth)*twiddle(4,5,q_twid),8,10)+quantizer(x(pos+4*fifth)*twiddle(2,5,q_twid),8,10));
                d=tempd.*twiddle((5^(stage-1))*3*n,N,q_twid); 
                tempe=(x(pos)+quantizer(x(pos+fifth)*twiddle(4,5,q_twid),8,10)+quantizer(x(pos+2*fifth)*twiddle(3,5,q_twid),8,10)+quantizer(x(pos+3*fifth)*twiddle(2,5,q_twid),8,10)+quantizer(x(pos+4*fifth)*twiddle(1,5,q_twid),8,10));
                e=tempe.*twiddle((5^(stage-1))*4*n,N,q_twid); 

                x(pos)=a;                                                       
                x(pos+fifth)=b;  
                x(pos+2*fifth)=c;
                x(pos+3*fifth)=d;
                x(pos+4*fifth)=e;
            end
        end
        fifth=fifth/5; 
        intermediate =x.';
%         if stage==this
            x=quantizer(x,8,10);
%         end 
    end
end

y=ord(x,5);                                                           
end