function RV_f = RateMatching_and_HARQ(G, z, base_graph, data_size, RV, data_in)
    data_in_wanted_process = data_in;
    data_array_flipped = flip(data_in_wanted_process);
    if length(data_array_flipped) > data_size
        data_array = data_array_flipped(1:data_size);
    else 
        data_array = data_array_flipped;
    end
    %data_array = (1:data_size);
    NUM_ROWS = 20;
    NUM_COLS = 10;
    CELL_WIDTH = 128;
    %data_in_wanted_process = data_in;
    RVs_base_graph_1 = [0, 17*z, 33*z, 56*z];
    RVs_base_graph_2 = [0, 13*z, 25*z, 43*z];
    RV_ID = [0, 2, 3, 1];

    i = 0; %index counter
    j = 1; %read counter
    if base_graph == 1
        if RV == 0
            K0 = RVs_base_graph_1(1) + 1;
            RV_ID_index = RV_ID(1);

        elseif RV == 2
            K0 = RVs_base_graph_1(2) + 1;
            RV_ID_index = RV_ID(2);

        elseif RV == 3
            K0 = RVs_base_graph_1(3) + 1;
            RV_ID_index = RV_ID(3);

        elseif RV == 1
            K0 = RVs_base_graph_1(4) + 1;
            RV_ID_index = RV_ID(4);
        end

    elseif base_graph == 2
        if RV == 0
            K0 = RVs_base_graph_2(1) + 1;
            RV_ID_index = RV_ID(1);

        elseif RV == 2
            K0 = RVs_base_graph_2(2) + 1;
            RV_ID_index = RV_ID(2);

        elseif RV == 3
            K0 = RVs_base_graph_2(3) + 1;
            RV_ID_index = RV_ID(3);

        elseif RV == 1
            K0 = RVs_base_graph_2(4) + 1;
            RV_ID_index = RV_ID(4);
        end
    end

    disp(K0);

    % RV index 
    if RV == 0
        RV_f(1) = 0;
        RV_f(2) = 0;

    elseif RV == 2
        RV_f(1) = 0;
        RV_f(2) = 1;

    elseif RV == 3
        RV_f(1) = 1;
        RV_f(2) = 1;

    elseif RV == 1
        RV_f(1) = 1;
        RV_f(2) = 0;
    end 

    j = 3; % update j because we use j =1 and j =2 in RV index

    if length(data_array(K0:end)) < G % Repeation Case
        i = K0;
        while j <= G
            RV_f(j) = data_array(i);
            if i >= length(data_array)
                i = 1;
            else
                i = i + 1;
            end
            j = j + 1;
        end
    else % Truncation Case
        RV_f = [RV_f, data_array(K0:(K0 + G - 3))];
    end

end