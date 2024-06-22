function out = Wrapper (in)
max = 1; % 360
min = 0; % 0
%%%%%%%%%%%%% from 0 -> 1 %%%%%%%%%%%%%
if in >= max
    out = in - 1;

elseif in < min
    out = in + 1;
else
    out = in;
end
end