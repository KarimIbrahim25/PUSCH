function [data_out] = Bit_Interleaver(E, Qm, data_in)
% Calculate NUM_ROWS based on Qm
switch Qm
    case 1
        NUM_ROWS = E;
    case 2
        NUM_ROWS = ceil(E/2);
    case 4
        NUM_ROWS = ceil(E/4);
    case 6
        NUM_ROWS = ceil(E/6);
end
%data_out = zeros(NUM_ROWS, Qm);


    % Fill the matrix row by row
    dataIndex = 1;
     for j = 1:NUM_ROWS
        for i = 1:Qm 
            matrix(j,i) = data_in(dataIndex);
            dataIndex = dataIndex + 1;
        end
     end
     
%     % Display the original matrix
%     disp('Original Matrix:');
%     disp(matrix);
    
    % Initialize the interleaved data array
    data_out = zeros(1, NUM_ROWS * Qm);

    % Read the matrix column by column
    interleavedIndex = 1;
    for i = 1:Qm
        for j = 1:NUM_ROWS 
            data_out(interleavedIndex) = matrix(j,i);
            interleavedIndex = interleavedIndex + 1;
        end
    end
end
