function out = Quantizer (in,i,f)
% No of fraction bits f
% No of integer bits i

Roundedx=round(in*2^f)/2^(i+f);
Roundedx(Roundedx>=1)=1-2^(-i-f); % Saturation +ve
Roundedx(Roundedx<-1)=-1; % Saturation -ve
out=Roundedx*2^i;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% ins 10 bit seq length, 5 bit seq no, 1 bit group no
% phase is 1 integer bits & 12 fraction bits
% step is 1 integer bits & 24 fraction bits
% out is 1 sign bit & 1 integer bits & 6 fraction bits

% q_dash is 10 integer bits & 5 fraction bits
% q is 10 integer bits
% Nzc is 10 integer bits