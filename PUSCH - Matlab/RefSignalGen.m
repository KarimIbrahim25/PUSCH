function PAPR_seq = RefSignalGen (N_slot_frame, N_rb, n_cell_ID, En_hopping)

L = 31;
N_sym_slot = 14;
c = [];

if En_hopping == 1
    C_init = floor(n_cell_ID/30);
    GoldSeq = goldcode_ref(C_init, L);
    index = mod(8*(N_sym_slot*N_slot_frame), 31)+1 : mod(8*(N_sym_slot*N_slot_frame)+7, 31)+1;
    c = GoldSeq(index);

elseif En_hopping == 2
    C_init = n_cell_ID;
    GoldSeq = goldcode_ref(C_init, L);
    index = mod(N_sym_slot*N_slot_frame, 31)+1;
    c = GoldSeq(index);

elseif En_hopping == 0
    c = 0;

% end
end

[v, u, Mzc] = Hopping (N_rb, n_cell_ID, En_hopping, c);

PAPR_seq = DMRS (u, v, Mzc);

end