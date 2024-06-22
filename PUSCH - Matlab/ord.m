function reorder=ord(x,N)
out=zeros(1,length(x));
max=dec2base(length(x)-1,N);
for i=0:length(x)-1
    if i == 0
        base = '0';
    else

    % Initialize variables
    remainder = i;
    base = '';
    
    % Perform base-3 conversion
    while remainder > 0
        digit = mod(remainder, N);
        base = [num2str(digit), base];
        remainder = floor(remainder / N);
    end
    end
    for p=1:length(max)-length(base)
        base=['0' base];
    end
    base=reverse(base);
    base=str2num(base(:));
    m=0;
    for k=0:length(base)-1
        m=N^(length(base)-1-k)*base(k+1)+m;
    end
    out(m+1)=x(i+1);
end
reorder=out;
end