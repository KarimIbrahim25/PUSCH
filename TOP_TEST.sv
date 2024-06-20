module PUSCH_Top_tb;

  // Parameters
  parameter WIDTH_IFFT = 26;
  parameter period_new = 32;
  parameter period = 16*period_new;
  

  // Inputs
  reg clk;
  reg reset;
  reg reset_fft;
  reg enable;
  reg Data_in;
  reg [1:0] base_graph;
  reg [1:0] rv_number;
  reg [3:0] process_number;
  reg [16:0] available_coded_bits;
  reg [2:0] modulation_order;
  reg [5:0] N_Rapid;
  reg [15:0] N_Rnti;
  reg [9:0] N_cell_ID;
  reg Config;
  reg [3:0] N_slot_frame;
  reg [6:0] N_rb;
  reg [1:0] En_hopping;
  reg [3:0] N_symbol;
  reg [10:0] N_sc_start;
  reg [3:0] Sym_Start_REM;
  reg [3:0] Sym_End_REM;

  // Outputs
  wire signed [WIDTH_IFFT-1:0] Data_r;
  wire signed [WIDTH_IFFT-1:0] Data_i;
  wire Data_valid;



  // Instantiate the Design Under Test (DUT)
  PUSCH_Top #(WIDTH_IFFT) Dut (
      .clk(clk),
      //.clk_new(clk_new),
      .reset(reset),
      .reset_fft(reset_fft),
      .enable(enable),
      .Data_in(Data_in),
      .base_graph(base_graph),
      .rv_number(rv_number),
      .process_number(process_number),
      .available_coded_bits(available_coded_bits),
      .modulation_order(modulation_order),
      .N_Rapid(N_Rapid),
      .N_Rnti(N_Rnti),
      .N_cell_ID(N_cell_ID),
      .Config(Config),
      .N_slot_frame(N_slot_frame),
      .N_rb(N_rb),
      .En_hopping(En_hopping),
      .N_symbol(N_symbol),
      .N_sc_start(N_sc_start),
      .Sym_Start_REM(Sym_Start_REM),
      .Sym_End_REM(Sym_End_REM),
      .Data_r(Data_r),
      .Data_i(Data_i),
      .Data_valid(Data_valid)
  );

  always #(period_new/2) clk = ~clk;
  //always #(period_new/2) clk_new = ~clk_new;
  

  initial begin
    reset_fft=0;
    #(period_new*2);
    #(500)reset_fft=1;
    #(period_new)reset_fft=0;
  end

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;
    enable = 0;
    Data_in = 0;
    modulation_order = 3'd2;
    N_Rapid = 15;
    N_Rnti = 50000;
    N_cell_ID = 900;
    Config = 0;
    N_slot_frame = 0;
    N_rb = 10;
    En_hopping = 0;
    N_symbol = 3;
    N_sc_start = 193;
    Sym_Start_REM = 1;
    Sym_End_REM = 8;


    // CRC 
    #(period);
    reset = 1;
    enable = 1;
    Data_in = 1;

    #(period);
	enable = 0;

	#(period*18);
	// HARQ
	base_graph = 2; 
	rv_number = 1;
    process_number = 1;
    available_coded_bits = 144;

    #(period*81);
    // Scrambler
    
    
	
	#(period*1000);

    /*
    // Add stimulus here
    reset = 1;
    #10;
    reset = 0;
    #10;
    enable = 1;
    base_graph = 2'b01;
    rv_number = 2'b10;
    process_number = 4'b0001;
    available_coded_bits = 17'd1023;
    modulation_order = 3'b010;
    N_Rapid = 6'b100110;
    N_Rnti = 16'b0000111100001111;
    N_cell_ID = 10'b0000011001;
    Config = 1;
    N_slot_frame = 4'b0100;
    N_rb = 7'b0010100;
    En_hopping = 2'b01;
    N_symbol = 4'b0011;
    N_sc_start = 11'b00011000001;
    Sym_Start_REM = 4'b0001;
    Sym_End_REM = 4'b1000;

    // Apply input data sequence
    Data_in = 1'b1;
    #20;
    Data_in = 1'b0;
    #20;
    Data_in = 1'b1;
    #20;
    Data_in = 1'b0;
    
    // Wait for some time to observe the output
    #1000;

    */
    //wait(Dut.FFT_Block.Finish);
    $stop;
  end


endmodule
