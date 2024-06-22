function out = SinLUT (phase)
% Number of entries in the lookup table
table_size = 256;
phase = Quantizer(phase,1,15);
phase = Wrapper(phase);
%%%%%%%%%%%%%%%%%%%%%%%
ind = round(4 * phase * (table_size-1)) + 1;

i = 0 : table_size - 1;
% Generate sine values from 0 to 90 degrees
sine_lut = sin(pi * i / (2 * table_size));
% Sin LUT size is 7 bit points and 7 bits wordsize
sine_lut = Quantizer(sine_lut,0,8);

% calculation of the sin value
if phase <= 1/4 % from 0 -> 90
    out = sine_lut(ind);

elseif phase <= 1/2 % from 90 -> 180
    out = sine_lut(2*table_size - ind);

elseif phase <= 3/4 % from 180 -> 270
    out = - sine_lut(ind - 2*table_size + 2);

else % from 270 -> 360
    out = - sine_lut(4*table_size - ind - 2);

end
end