function W=twiddle(kn,N,y,integer,fraction)
integer=8;
fraction=10;
if(y==0)
   W=exp(-1i*2*pi*kn/N);
end

if(y==1)
   W=Quantizer(exp(-1i*2*pi*kn/N),integer,fraction);
end

if(y==2)
   W=Quantizet(exp(-1i*2*pi*kn/N),1,7);
end

end