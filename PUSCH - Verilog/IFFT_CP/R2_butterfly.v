module R2_butterfly # (parameter WIDTH = 26 , POINTS = 1024 , N = 2048)
    (
  input wire clk, rst,
  input signed [WIDTH-1:0] data_in_r  ,
  input signed [WIDTH-1:0] data_in_i  ,
  input wire VALID_R,
  input wire VALID_I,

  output reg [11:0] radix_address,                /// radix address
  output reg OUT_VALID,                           /// Signal indicate that first serial out is ready to go to next block R4-1
  output reg signed [WIDTH-1:0] data_out_r ,
  output reg signed [WIDTH-1:0] data_out_i            
);

reg signed [WIDTH-1:0] shift_reg_r [0:POINTS-1];            // Shift register storing data input REAL    
reg signed [WIDTH-1:0] shift_reg_i [0:POINTS-1];            // Shift register storing data input IMAJ  

reg signed [WIDTH-1:0] subtraction_part_r [0:POINTS-1];     // REAL Subtraction part output from Butterfly  
reg signed [WIDTH-1:0] subtraction_part_i [0:POINTS-1];     // IMAJ Subtraction part output from Butterfly

reg [9:0] counter;
 
reg radix_valid;                             // valid for radix address to begin count
                             

reg [1:0] cs,ns;

localparam IDLE  = 2'b00;                   // IDLE MODE indicate if input data is valid or not to begin processing
localparam MODE1 = 2'b01;                   // MODE 1 For storing first half data (0-1023)
localparam MODE2 = 2'b10;                   // MODE 2 For Radix-2 butterfly operation and storing first half output data 
localparam MODE3 = 2'b11;                   // MODE 3 For storing second half data (1024-2047)

integer i , j ;

always @(posedge clk or negedge rst) begin 
    if(!rst) begin
         counter   <= 0;
         radix_address  <= 0;                 
        cs <= IDLE;
    end else begin
        cs <= ns ;

         if (cs==MODE1||cs==MODE2) begin
            if(counter == 10'd1023) begin
                counter <= 0;
                radix_address<=0;
            end else begin
                counter <= counter + 1;
                radix_address<=0;
            end          
        end else if(cs==MODE3) begin
            if (radix_valid) begin
                if(radix_address == 10'd1023) begin
                    radix_address  <= 0;
                    counter <= 0;
                end else begin
                    radix_address  <= radix_address + 1;
                    counter <= counter + 1;
                end
            end else begin
                radix_address  <= 0;
            end            
        end else begin
            counter <=0;
            radix_address<=0;
        end 
        
    end
end

always @(*) begin
    // Default assignments for combinational logic
    OUT_VALID = 0;
    radix_valid = 0;
    data_out_r = data_out_r;
    data_out_i = data_out_i;
    for (i = 0; i < 1024; i = i + 1) begin
        shift_reg_r[i] = shift_reg_r[i];  // Maintain current state unless changed
        shift_reg_i[i] = shift_reg_i[i];  // Maintain current state unless changed
        subtraction_part_r[i] = subtraction_part_r[i];  // Maintain current state unless changed
        subtraction_part_i[i] = subtraction_part_i[i];  // Maintain current state unless changed
    end

    // State machine
    case (cs)
        IDLE: begin  
            if (VALID_R && VALID_I) begin
                ns = MODE1;    
            end else begin
                ns = IDLE;
            end    
        end

        MODE1: begin
            shift_reg_r[counter] = data_in_r;
            shift_reg_i[counter] = data_in_i;
            if (counter == 10'd1023) begin
                ns = MODE2;
            end else begin
                ns = MODE1;
            end            
        end

        MODE2: begin
            subtraction_part_r[counter] = data_in_r - shift_reg_r[counter];
            data_out_r = data_in_r + shift_reg_r[counter];

            subtraction_part_i[counter] = data_in_i - shift_reg_i[counter];
            data_out_i = data_in_i + shift_reg_i[counter];

            OUT_VALID = 1;
            if (counter == 10'd1023) begin
                ns = MODE3;
            end else begin
                ns = MODE2;
            end
        end

        MODE3: begin
            data_out_r = subtraction_part_r[counter];
            data_out_i = subtraction_part_i[counter];
            radix_valid = 1;
            if (counter == 10'd1023 || radix_address == 11'd1023) begin
                ns = IDLE;
            end else begin
                ns = MODE3;
            end
        end

    endcase
end

endmodule

// data_out[0-1023] = addition_part[0-1023]
// data_out[1024-2047] = subtraction_part[0-1023]

