function W=twiddleR(kn,N,y)

if(y==0)
   W=exp(-1i*2*pi*kn/N);
end

if(y==1)
   W=Quantizer(exp(-1i*2*pi*kn/N),14,19);
end

if(y==2)
   W=Quantizer(exp(-1i*2*pi*kn/N),15,10);
end

end