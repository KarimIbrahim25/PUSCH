function out1=mixed(x,a1,a2,a3)
q_twid=1;
q_2=1;
q_3=1;
q_5=1;
which_stage=0;
integer_bits=8;
fraction_bits=10;
N=length(x);

if(mod(N,2)==0)
    rows=2^a1;
    columns=N/rows;

else
    if(mod(N,3)==0)
         rows=3^a2;
         columns=N/rows;
    else
        if(mod(N,5)==0)
            rows=5^a3;
            columns=N/rows;
        end
    end
end

if(columns==5^a3 || columns==3^a2 || columns==2^a1)
    recur=0;
else
    recur=1;
end
k=1;
for j=1:columns
    for i=1:rows
        Map(i,j)=x(k);
        k=k+1;
    end
end

if(recur)
    for i=1:rows
        Map(i,:)=mixed(Map(i,:),a1,a2,a3);
    end
else
    if(recur==0)
%%%dft row 
        for i=1:rows
            if(columns==2^a1)
                Map(i,:)=fft2(Map(i,:),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
            else
                if(columns==3^a2)
                    Map(i,:)=fft3(Map(i,:),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
                else
                    if(columns==5^a3)
                        Map(i,:)=fft5(Map(i,:),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
                    end
                end
            end
        end
%%%twiddle boundary
        k=1;
        for j=1:columns
            for i=1:rows
                Map(i,j)=Map(i,j)*twiddle((i-1)*(j-1),N,q_twid);
                k=k+1;
            end
        end
%%%dft column
        for j=1:columns
            if(rows==2^a1)
                Map(:,j)=fft2(Map(:,j),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
            else
                 if(rows==3^a2)
                    Map(:,j)=fft3(Map(:,j),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
                 else
                      if(rows==5^a3)
                        Map(:,j)=fft5(Map(:,j),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
                      end
                 end
            end
        end
    end
end

if(recur==1)
    k=1;
        for j=1:columns
            for i=1:rows
                Map(i,j)=Map(i,j)*twiddle((i-1)*(j-1),N,q_twid);
                k=k+1;
            end
        end
    for j=1:columns
          if(rows==2^a1)
                Map(:,j)=fft2(Map(:,j),a1,q_twid,q_2,which_stage,integer_bits,fraction_bits);
            else
                 if(rows==3^a2)
                    Map(:,j)=fft3(Map(:,j),a2,q_twid,q_3,which_stage,integer_bits,fraction_bits);
                 else
                      if(rows==5^a3)
                        Map(:,j)=fft5(Map(:,j),a3,q_twid,q_5,which_stage,integer_bits,fraction_bits);
                      end
                 end
           end
    end
end
k=1;
for j=1:rows
    for i=1:columns
       X(k)= Map(j,i);
        k=k+1;
    end
end
out1=X;
% out2=q_twid;
% out3=q_2;
% out4=q_3;
% out5=q_5;
% out6=which_stage;
% out7=integer_bits;
% out8=fraction_bits;
end