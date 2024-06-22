function [v, u, Mzc] = Hopping (N_rb, n_cell_ID, En_hopping, c1)
    
    Mzc = 6 * N_rb;
    %L = 1600; % input stream length
    c2 = c1(1);
    
    % N_symb_slot = 14; % 4 bits
    f_gh = 0; % 5 bits
    power = 1; % 7 bits
    if En_hopping == 0
        f_gh = 0;
        v = 0;
    elseif En_hopping == 2
        f_gh = 0;
        v = c2;
    else
        for m = 0 : 7
            f_gh = f_gh + (power * c1(m+1));
            power = power * 2; % shift register
        end
        v = 0;
    end
    
    f_gh = mod(f_gh, 30);
    u = mod(f_gh + n_cell_ID, 30);

end