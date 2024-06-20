            if (Counter >= Last_indx) begin
                Symbol_now = Sym_Start + 1 ; 
                Sym_Done = 1 ;
                 EN_Counter = 1'b0 ; 
 
            end else begin
                Symbol_now = Sym_Start ;
                Sym_Done = 0 ;
             EN_Counter = 1'b1 ; 
       
            end
