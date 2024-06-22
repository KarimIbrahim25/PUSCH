module IFFT_MEM #(parameter   WIDTH = 26, IFFT_SIZE = 2048)
(
    input wire    clk, 
    input wire    rst,         
    input wire    VALID,
    input wire  [10:0] address,          
    input wire  signed  [WIDTH-1:0] serial_in_r ,
    input wire  signed  [WIDTH-1:0] serial_in_i ,   
    output reg  signed  [WIDTH-1:0] serial_out_r,
    output reg  signed  [WIDTH-1:0] serial_out_i,
    output reg [7:0]  counter1,
    output reg  OUT_VALID
);

reg  signed  [WIDTH-1:0] mem_out_r[0:IFFT_SIZE-1];
reg  signed  [WIDTH-1:0] mem_out_i[0:IFFT_SIZE-1];

reg [11:0] counter;
// reg [7:0]  counter1;

reg enable;

integer i;

//  Sequantial always
always @(posedge clk or negedge rst) begin 
    if(~rst) begin
        OUT_VALID  <= 0;
        for (i = 0; i < IFFT_SIZE; i = i + 1) begin
            mem_out_r[i] <= 0;
            mem_out_i[i] <= 0;           
        end         
    end else begin
        if (enable) begin
            if (VALID == 1) begin
                counter   <= counter + 1;
                //counter1   <= counter1 + 1;
                OUT_VALID <= 1;                    
            end else begin /// valid = 0
                //counter1<=counter1;
                if (counter1 == 1 || counter1 == 8) begin
                    if(counter == 2207) begin                    
                        counter   <= 0;
                        OUT_VALID <= 0;
                    end else if (counter == 0) begin 
                        counter   <= 0;
                        OUT_VALID <= 0;              
                    end else begin
                        counter   <= counter + 1;                    
                    end
                end else begin // cnt                   
                    if(counter == 2191) begin                    
                        counter   <= 0;
                        OUT_VALID <= 0;
                    end else if (counter == 0) begin 
                        counter   <= 0;
                        OUT_VALID <= 0;                                          
                    end else begin
                        counter   <= counter + 1;                    
                    end                    
                end                 
            end                
        end else begin  // enable = 0 
            counter  <= 0;
            //counter1 <= 0;
        end

    end
end

//  Comp always
always @(*) begin
    counter1=counter1;
    serial_out_r=serial_out_r;
    serial_out_i=serial_out_i;
    if (!rst) begin
        counter1=0;
    end else begin

    if (VALID) begin
        mem_out_r[counter] = serial_in_r;
        mem_out_i[counter] = serial_in_i;
        serial_out_r       = mem_out_r[counter];
        serial_out_i       = mem_out_i[counter];
        enable = 1;
        OUT_VALID = 1;
        if (counter == 0) begin
            counter1   = counter1 + 1;
        end else begin
            counter1   = counter1;
        end
     end else begin
        // if (address == 0) begin
        //     counter1   = counter1;
        // end else begin
        //     counter1   = counter1;
        // end
        serial_out_r=serial_out_r;
        serial_out_i=serial_out_i;        
        mem_out_r[counter] = mem_out_r[counter];
        mem_out_i[counter] = mem_out_i[counter];
        //counter1   = counter1;
        // OUT_VALID = 0;         
     end
    end   
end

endmodule
