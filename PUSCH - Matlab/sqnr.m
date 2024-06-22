function avg=sqnr(x,y)
P_FFT=abs(mean(abs(x).^2));
y=abs(x-y);
P_Noise=abs(mean(y).^2);
avg=10*log10(P_FFT/P_Noise);
end