module PingPongMem_MOD #(
    parameter MEM_DEPTH = 1200,
    parameter DATA_WIDTH = 18
)(
    input wire CLK,
    input wire RST,

    input wire [DATA_WIDTH-1:0] data_in,
    input wire BUSY , 
    input wire [10:0] Last_addr,
    input wire write_enable,
    input wire Mod_Valid_OUT ,
    input wire PINGPONG_SWITCH ,  
    input wire MOD_DONE , 
    input wire [10:0] write_addr,  // External write address input
    output reg [DATA_WIDTH-1:0] data_out  // Output data
);

    // Memories
    reg  [10:0] Last_addr_mem [1:0] ; 
    reg signed [DATA_WIDTH-1:0] ping [0:MEM_DEPTH-1];
    reg signed [DATA_WIDTH-1:0] pong [0:MEM_DEPTH-1];
    reg [10:0] Last_indx ; 
    reg flag ; 
    reg [1:0] Counter ; 
    // Memory select flag
    reg use_ping;
    integer i;
    integer k ; 
    reg out_ping ; 
    // Memory select and reset logic
    
     always @(*) begin
        if (!RST) begin
            use_ping = 1;
        end else if (PINGPONG_SWITCH) begin
            use_ping = ~use_ping;
        end
    end
    always@(posedge CLK or negedge RST) begin 
        if(! RST )
            out_ping <= 1 ; 
        else if(Last_indx == Last_addr_mem[0]) begin 
            out_ping <= ~out_ping;
        end    
    end    
    
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
          for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                    pong[i] <= 0;
                    ping[i] <=0 ;
             end
        end 
        else if (MOD_DONE && (Counter == 0)) begin
            if(use_ping) begin 
                for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                    ping[i] <=0 ;
                end

            end
            else begin 
                for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                    pong[i] <= 0;
                end

            end       

        end 
    // Write logic with address shift
        else if (write_enable && Mod_Valid_OUT) begin
            if (use_ping) begin
                if (write_addr  < MEM_DEPTH+1)
                    ping[write_addr-1] <= data_in;
            end else begin
                if (write_addr< MEM_DEPTH+1)
                    pong[write_addr-1] <= data_in;
            end
        end
    end


    // Read logic on Sym_Done signal
    always @(posedge CLK) begin
     if(! RST) begin 
          data_out <= 0 ; 
          Last_indx <= 1 ;   
     end    
    else if (MOD_DONE && (Counter == 0) ) begin 
            data_out <= 'b0 ;
            Last_indx <= 1 ;  
    end    
     else if (flag & ! BUSY) begin
            // if done counter > 1 , but we havent reached the last index yet continue to output from 
            if (out_ping ) begin
                 data_out <= ping[Last_indx-1];            
            end else begin
                 data_out <= pong[Last_indx-1];
            end   
            
         // index for ouput return to initial value every time it reaches the last_Addr   
            if(Last_indx == Last_addr_mem[0] ) begin 
                Last_indx = 1 ;
            end else begin 
                Last_indx <= Last_indx +1 ; 
            end 
  
     end   else begin
            data_out <= 'b0 ;
            Last_indx <= 1 ;  
     end
    end
 
always@(posedge CLK or negedge RST) begin 
    if(!RST) begin 
            Counter <= 0 ; 
            flag <= 0 ;      
    end
    else if(MOD_DONE) begin 
            Counter <= Counter + 1 ; 
            flag <= 1 ; 
    end
     else if (Last_indx == Last_addr_mem[0]  ) begin  
                 Counter <= Counter - 1; 
     end           
                 if ( (Counter == 0)) begin 
                        flag <= 0 ; 
                 end
                 else begin 
                        flag <= 1 ;  
                 end          
    
end


always @(posedge CLK or negedge RST) begin 
    if(!RST) begin 
        Last_addr_mem[0] <= 0 ; 
        Last_addr_mem[1] <= 0 ; 
        k <= 0 ; 
    end
    else if(MOD_DONE) begin
        Last_addr_mem[k] <= Last_addr ; 
        k <= k +1 ; 
    end else if (Last_indx == Last_addr_mem[0]) begin 
         Last_addr_mem [0] <= Last_addr_mem[1] ;        
         Last_addr_mem [1] <= 0 ;   
         k <= 0 ;      
    end
end    

   
endmodule
