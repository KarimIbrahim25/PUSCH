module PingPongMemory #(
    parameter MEM_DEPTH = 2048,
    parameter DATA_WIDTH = 26,
    parameter FFT_Len = 18 , 
    parameter WRITE_ADDR_SHIFT = 420  // Address shift for zero padding
)(
    input wire CLK,
    input wire CLK_new , 
    input wire RST,
    input wire signed [FFT_Len-1:0] data_in,
    input wire write_enable,
    input wire Sym_Done,
    input wire RE_Valid_OUT , 
    input wire RE_Done , 
    input wire [10:0] write_addr,  // External write address input
    output reg signed [DATA_WIDTH-1:0] data_out , // Output data
    output reg Ping_VALID   // for testing 
);

    // Memories
    reg  [17:0] extend ; 
    reg out_ping ; 
    reg signed [FFT_Len-1:0] ping [0:MEM_DEPTH-1];
    reg signed [FFT_Len-1:0] pong [0:MEM_DEPTH-1];
    reg flag ; 
    reg [10:0] Last_indx ;
    reg [1:0] Counter ; 
    reg Done_REG ; 
 
    // Memory select flag
    reg use_ping;
    integer i;
    // Memory select and reset logic
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            use_ping <= 1;
        end else if (Done_REG) begin
            use_ping <= ~use_ping;
        end
    end
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Done_REG <= 0;
        end else begin
            Done_REG <= Sym_Done;
        end
    end    
    always@(posedge CLK_new or negedge RST) begin 
        if(! RST )
            out_ping <= 1 ; 
        else if(Last_indx == MEM_DEPTH-1 ) begin 
            out_ping <= ~out_ping;
        end    
    end 
    // Write logic with address shift
    always @(posedge CLK) begin
        if (!RST) begin
          for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                    pong[i] <= 0;
                    ping[i] <=0 ;
          end
        end
        /*else if (RE_Done == 1 ) begin
            for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                    pong[i] <= 0;
                    ping[i] <= 0;
            end
        end*/
        else if (Sym_Done) begin
            if(!use_ping ) begin 
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
        
        else if (write_enable && RE_Valid_OUT) begin
            if (use_ping) begin
                if (write_addr + WRITE_ADDR_SHIFT < MEM_DEPTH)
                    ping[write_addr + WRITE_ADDR_SHIFT] <= data_in;
            end else begin
                if (write_addr + WRITE_ADDR_SHIFT < MEM_DEPTH)
                    pong[write_addr + WRITE_ADDR_SHIFT] <= data_in;
            end
        end
    end
    
    // Read logic on Sym_Done signal
    always @(posedge CLK_new or negedge RST) begin
     if(!RST) begin 
          data_out <= 0 ; 
          Last_indx <= 0 ;
          extend <= 0 ;   
          Ping_VALID <= 0 ; 
     end
     else if (flag) begin
            if (out_ping) begin
                extend <= ping[Last_indx-1] ; 
                if(extend[17] == 1 ) begin
                data_out<={8'b11111111,extend};
                Last_indx <= Last_indx +1 ;
                                Ping_VALID <=1 ;

                end else begin
                data_out<={8'b0,extend};
                 Last_indx <= Last_indx +1 ;
                                 Ping_VALID <=1 ;

                end
            end else begin
                 extend <= pong[Last_indx-1] ; 
                    if(extend[17] == 1 ) begin
                    data_out<={8'b11111111,extend};
                    Last_indx <= Last_indx +1 ;
                                    Ping_VALID <=1 ;

                    end else begin
                    data_out<={8'b0,extend};
                    Last_indx <= Last_indx +1 ;
                                    Ping_VALID <=1 ;

                    end      
                end
 


     end   else begin
            data_out <= 'b0 ;
            Last_indx <= 1 ; 
            Ping_VALID <= 0 ; 
            extend <= 0 ; 
            end
    end
 
always@(posedge CLK_new or negedge RST) begin 
    if(!RST)
            flag = 0 ; 
    else if(Done_REG) begin 
            flag = 1 ; 
    end else if (Last_indx == MEM_DEPTH-1)  
            flag = 0 ; 
 
end
endmodule
