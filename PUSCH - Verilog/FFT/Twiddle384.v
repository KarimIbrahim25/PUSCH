module Twiddle384 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:383];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:383];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<384 ? wn_re[addr] : 0;
assign  mx_im = addr<384 ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111111111; assign wn_im[1] = 18'b111111111111101111; 
assign wn_re[2] = 18'b000000001111111111; assign wn_im[2] = 18'b111111111111011110; 
assign wn_re[3] = 18'b000000001111111110; assign wn_im[3] = 18'b111111111111001101; 
assign wn_re[4] = 18'b000000001111111101; assign wn_im[4] = 18'b111111111110111101; 
assign wn_re[5] = 18'b000000001111111100; assign wn_im[5] = 18'b111111111110101100; 
assign wn_re[6] = 18'b000000001111111011; assign wn_im[6] = 18'b111111111110011011; 
assign wn_re[7] = 18'b000000001111111001; assign wn_im[7] = 18'b111111111110001010; 
assign wn_re[8] = 18'b000000001111110111; assign wn_im[8] = 18'b111111111101111010; 
assign wn_re[9] = 18'b000000001111110100; assign wn_im[9] = 18'b111111111101101001; 
assign wn_re[10] = 18'b000000001111110010; assign wn_im[10] = 18'b111111111101011001; 
assign wn_re[11] = 18'b000000001111101111; assign wn_im[11] = 18'b111111111101001000; 
assign wn_re[12] = 18'b000000001111101100; assign wn_im[12] = 18'b111111111100111000; 
assign wn_re[13] = 18'b000000001111101000; assign wn_im[13] = 18'b111111111100100111; 
assign wn_re[14] = 18'b000000001111100101; assign wn_im[14] = 18'b111111111100010111; 
assign wn_re[15] = 18'b000000001111100001; assign wn_im[15] = 18'b111111111100000111; 
assign wn_re[16] = 18'b000000001111011101; assign wn_im[16] = 18'b111111111011110110; 
assign wn_re[17] = 18'b000000001111011000; assign wn_im[17] = 18'b111111111011100110; 
assign wn_re[18] = 18'b000000001111010011; assign wn_im[18] = 18'b111111111011010110; 
assign wn_re[19] = 18'b000000001111001110; assign wn_im[19] = 18'b111111111011000110; 
assign wn_re[20] = 18'b000000001111001001; assign wn_im[20] = 18'b111111111010110110; 
assign wn_re[21] = 18'b000000001111000100; assign wn_im[21] = 18'b111111111010100111; 
assign wn_re[22] = 18'b000000001110111110; assign wn_im[22] = 18'b111111111010010111; 
assign wn_re[23] = 18'b000000001110111000; assign wn_im[23] = 18'b111111111010000111; 
assign wn_re[24] = 18'b000000001110110010; assign wn_im[24] = 18'b111111111001111000; 
assign wn_re[25] = 18'b000000001110101011; assign wn_im[25] = 18'b111111111001101000; 
assign wn_re[26] = 18'b000000001110100100; assign wn_im[26] = 18'b111111111001011001; 
assign wn_re[27] = 18'b000000001110011101; assign wn_im[27] = 18'b111111111001001010; 
assign wn_re[28] = 18'b000000001110010110; assign wn_im[28] = 18'b111111111000111011; 
assign wn_re[29] = 18'b000000001110001110; assign wn_im[29] = 18'b111111111000101100; 
assign wn_re[30] = 18'b000000001110000111; assign wn_im[30] = 18'b111111111000011101; 
assign wn_re[31] = 18'b000000001101111111; assign wn_im[31] = 18'b111111111000001110; 
assign wn_re[32] = 18'b000000001101110110; assign wn_im[32] = 18'b111111111000000000; 
assign wn_re[33] = 18'b000000001101101110; assign wn_im[33] = 18'b111111110111110001; 
assign wn_re[34] = 18'b000000001101100101; assign wn_im[34] = 18'b111111110111100011; 
assign wn_re[35] = 18'b000000001101011100; assign wn_im[35] = 18'b111111110111010101; 
assign wn_re[36] = 18'b000000001101010011; assign wn_im[36] = 18'b111111110111000111; 
assign wn_re[37] = 18'b000000001101001010; assign wn_im[37] = 18'b111111110110111001; 
assign wn_re[38] = 18'b000000001101000000; assign wn_im[38] = 18'b111111110110101011; 
assign wn_re[39] = 18'b000000001100110110; assign wn_im[39] = 18'b111111110110011110; 
assign wn_re[40] = 18'b000000001100101100; assign wn_im[40] = 18'b111111110110010000; 
assign wn_re[41] = 18'b000000001100100010; assign wn_im[41] = 18'b111111110110000011; 
assign wn_re[42] = 18'b000000001100010111; assign wn_im[42] = 18'b111111110101110110; 
assign wn_re[43] = 18'b000000001100001100; assign wn_im[43] = 18'b111111110101101001; 
assign wn_re[44] = 18'b000000001100000001; assign wn_im[44] = 18'b111111110101011100; 
assign wn_re[45] = 18'b000000001011110110; assign wn_im[45] = 18'b111111110101010000; 
assign wn_re[46] = 18'b000000001011101011; assign wn_im[46] = 18'b111111110101000100; 
assign wn_re[47] = 18'b000000001011011111; assign wn_im[47] = 18'b111111110100110111; 
assign wn_re[48] = 18'b000000001011010100; assign wn_im[48] = 18'b111111110100101011; 
assign wn_re[49] = 18'b000000001011001000; assign wn_im[49] = 18'b111111110100100000; 
assign wn_re[50] = 18'b000000001010111011; assign wn_im[50] = 18'b111111110100010100; 
assign wn_re[51] = 18'b000000001010101111; assign wn_im[51] = 18'b111111110100001001; 
assign wn_re[52] = 18'b000000001010100011; assign wn_im[52] = 18'b111111110011111110; 
assign wn_re[53] = 18'b000000001010010110; assign wn_im[53] = 18'b111111110011110011; 
assign wn_re[54] = 18'b000000001010001001; assign wn_im[54] = 18'b111111110011101000; 
assign wn_re[55] = 18'b000000001001111100; assign wn_im[55] = 18'b111111110011011101; 
assign wn_re[56] = 18'b000000001001101111; assign wn_im[56] = 18'b111111110011010011; 
assign wn_re[57] = 18'b000000001001100001; assign wn_im[57] = 18'b111111110011001001; 
assign wn_re[58] = 18'b000000001001010100; assign wn_im[58] = 18'b111111110010111111; 
assign wn_re[59] = 18'b000000001001000110; assign wn_im[59] = 18'b111111110010110101; 
assign wn_re[60] = 18'b000000001000111000; assign wn_im[60] = 18'b111111110010101100; 
assign wn_re[61] = 18'b000000001000101010; assign wn_im[61] = 18'b111111110010100011; 
assign wn_re[62] = 18'b000000001000011100; assign wn_im[62] = 18'b111111110010011010; 
assign wn_re[63] = 18'b000000001000001110; assign wn_im[63] = 18'b111111110010010001; 
assign wn_re[64] = 18'b000000001000000000; assign wn_im[64] = 18'b111111110010001001; 
assign wn_re[65] = 18'b000000000111110001; assign wn_im[65] = 18'b111111110010000000; 
assign wn_re[66] = 18'b000000000111100010; assign wn_im[66] = 18'b111111110001111000; 
assign wn_re[67] = 18'b000000000111010011; assign wn_im[67] = 18'b111111110001110001; 
assign wn_re[68] = 18'b000000000111000100; assign wn_im[68] = 18'b111111110001101001; 
assign wn_re[69] = 18'b000000000110110101; assign wn_im[69] = 18'b111111110001100010; 
assign wn_re[70] = 18'b000000000110100110; assign wn_im[70] = 18'b111111110001011011; 
assign wn_re[71] = 18'b000000000110010111; assign wn_im[71] = 18'b111111110001010100; 
assign wn_re[72] = 18'b000000000110000111; assign wn_im[72] = 18'b111111110001001101; 
assign wn_re[73] = 18'b000000000101111000; assign wn_im[73] = 18'b111111110001000111; 
assign wn_re[74] = 18'b000000000101101000; assign wn_im[74] = 18'b111111110001000001; 
assign wn_re[75] = 18'b000000000101011000; assign wn_im[75] = 18'b111111110000111011; 
assign wn_re[76] = 18'b000000000101001001; assign wn_im[76] = 18'b111111110000110110; 
assign wn_re[77] = 18'b000000000100111001; assign wn_im[77] = 18'b111111110000110001; 
assign wn_re[78] = 18'b000000000100101001; assign wn_im[78] = 18'b111111110000101100; 
assign wn_re[79] = 18'b000000000100011001; assign wn_im[79] = 18'b111111110000100111; 
assign wn_re[80] = 18'b000000000100001001; assign wn_im[80] = 18'b111111110000100010; 
assign wn_re[81] = 18'b000000000011111000; assign wn_im[81] = 18'b111111110000011110; 
assign wn_re[82] = 18'b000000000011101000; assign wn_im[82] = 18'b111111110000011010; 
assign wn_re[83] = 18'b000000000011011000; assign wn_im[83] = 18'b111111110000010111; 
assign wn_re[84] = 18'b000000000011000111; assign wn_im[84] = 18'b111111110000010011; 
assign wn_re[85] = 18'b000000000010110111; assign wn_im[85] = 18'b111111110000010000; 
assign wn_re[86] = 18'b000000000010100110; assign wn_im[86] = 18'b111111110000001101; 
assign wn_re[87] = 18'b000000000010010110; assign wn_im[87] = 18'b111111110000001011; 
assign wn_re[88] = 18'b000000000010000101; assign wn_im[88] = 18'b111111110000001000; 
assign wn_re[89] = 18'b000000000001110101; assign wn_im[89] = 18'b111111110000000110; 
assign wn_re[90] = 18'b000000000001100100; assign wn_im[90] = 18'b111111110000000100; 
assign wn_re[91] = 18'b000000000001010011; assign wn_im[91] = 18'b111111110000000011; 
assign wn_re[92] = 18'b000000000001000010; assign wn_im[92] = 18'b111111110000000010; 
assign wn_re[93] = 18'b000000000000110010; assign wn_im[93] = 18'b111111110000000001; 
assign wn_re[94] = 18'b000000000000100001; assign wn_im[94] = 18'b111111110000000000; 
assign wn_re[95] = 18'b000000000000010000; assign wn_im[95] = 18'b111111110000000000; 
assign wn_re[96] = 18'b000000000000000000; assign wn_im[96] = 18'b111111110000000000; 
assign wn_re[97] = 18'b111111111111101111; assign wn_im[97] = 18'b111111110000000000; 
assign wn_re[98] = 18'b111111111111011110; assign wn_im[98] = 18'b111111110000000000; 
assign wn_re[99] = 18'b111111111111001101; assign wn_im[99] = 18'b111111110000000001; 
assign wn_re[100] = 18'b111111111110111101; assign wn_im[100] = 18'b111111110000000010; 
assign wn_re[101] = 18'b111111111110101100; assign wn_im[101] = 18'b111111110000000011; 
assign wn_re[102] = 18'b111111111110011011; assign wn_im[102] = 18'b111111110000000100; 
assign wn_re[103] = 18'b111111111110001010; assign wn_im[103] = 18'b111111110000000110; 
assign wn_re[104] = 18'b111111111101111010; assign wn_im[104] = 18'b111111110000001000; 
assign wn_re[105] = 18'b111111111101101001; assign wn_im[105] = 18'b111111110000001011; 
assign wn_re[106] = 18'b111111111101011001; assign wn_im[106] = 18'b111111110000001101; 
assign wn_re[107] = 18'b111111111101001000; assign wn_im[107] = 18'b111111110000010000; 
assign wn_re[108] = 18'b111111111100111000; assign wn_im[108] = 18'b111111110000010011; 
assign wn_re[109] = 18'b111111111100100111; assign wn_im[109] = 18'b111111110000010111; 
assign wn_re[110] = 18'b111111111100010111; assign wn_im[110] = 18'b111111110000011010; 
assign wn_re[111] = 18'b111111111100000111; assign wn_im[111] = 18'b111111110000011110; 
assign wn_re[112] = 18'b111111111011110110; assign wn_im[112] = 18'b111111110000100010; 
assign wn_re[113] = 18'b111111111011100110; assign wn_im[113] = 18'b111111110000100111; 
assign wn_re[114] = 18'b111111111011010110; assign wn_im[114] = 18'b111111110000101100; 
assign wn_re[115] = 18'b111111111011000110; assign wn_im[115] = 18'b111111110000110001; 
assign wn_re[116] = 18'b111111111010110110; assign wn_im[116] = 18'b111111110000110110; 
assign wn_re[117] = 18'b111111111010100111; assign wn_im[117] = 18'b111111110000111011; 
assign wn_re[118] = 18'b111111111010010111; assign wn_im[118] = 18'b111111110001000001; 
assign wn_re[119] = 18'b111111111010000111; assign wn_im[119] = 18'b111111110001000111; 
assign wn_re[120] = 18'b111111111001111000; assign wn_im[120] = 18'b111111110001001101; 
assign wn_re[121] = 18'b111111111001101000; assign wn_im[121] = 18'b111111110001010100; 
assign wn_re[122] = 18'b111111111001011001; assign wn_im[122] = 18'b111111110001011011; 
assign wn_re[123] = 18'b111111111001001010; assign wn_im[123] = 18'b111111110001100010; 
assign wn_re[124] = 18'b111111111000111011; assign wn_im[124] = 18'b111111110001101001; 
assign wn_re[125] = 18'b111111111000101100; assign wn_im[125] = 18'b111111110001110001; 
assign wn_re[126] = 18'b111111111000011101; assign wn_im[126] = 18'b111111110001111000; 
assign wn_re[127] = 18'b111111111000001110; assign wn_im[127] = 18'b111111110010000000; 
assign wn_re[128] = 18'b111111111000000000; assign wn_im[128] = 18'b111111110010001001; 
assign wn_re[129] = 18'b111111110111110001; assign wn_im[129] = 18'b111111110010010001; 
assign wn_re[130] = 18'b111111110111100011; assign wn_im[130] = 18'b111111110010011010; 
assign wn_re[131] = 18'b111111110111010101; assign wn_im[131] = 18'b111111110010100011; 
assign wn_re[132] = 18'b111111110111000111; assign wn_im[132] = 18'b111111110010101100; 
assign wn_re[133] = 18'b111111110110111001; assign wn_im[133] = 18'b111111110010110101; 
assign wn_re[134] = 18'b111111110110101011; assign wn_im[134] = 18'b111111110010111111; 
assign wn_re[135] = 18'b111111110110011110; assign wn_im[135] = 18'b111111110011001001; 
assign wn_re[136] = 18'b111111110110010000; assign wn_im[136] = 18'b111111110011010011; 
assign wn_re[137] = 18'b111111110110000011; assign wn_im[137] = 18'b111111110011011101; 
assign wn_re[138] = 18'b111111110101110110; assign wn_im[138] = 18'b111111110011101000; 
assign wn_re[139] = 18'b111111110101101001; assign wn_im[139] = 18'b111111110011110011; 
assign wn_re[140] = 18'b111111110101011100; assign wn_im[140] = 18'b111111110011111110; 
assign wn_re[141] = 18'b111111110101010000; assign wn_im[141] = 18'b111111110100001001; 
assign wn_re[142] = 18'b111111110101000100; assign wn_im[142] = 18'b111111110100010100; 
assign wn_re[143] = 18'b111111110100110111; assign wn_im[143] = 18'b111111110100100000; 
assign wn_re[144] = 18'b111111110100101011; assign wn_im[144] = 18'b111111110100101011; 
assign wn_re[145] = 18'b111111110100100000; assign wn_im[145] = 18'b111111110100110111; 
assign wn_re[146] = 18'b111111110100010100; assign wn_im[146] = 18'b111111110101000100; 
assign wn_re[147] = 18'b111111110100001001; assign wn_im[147] = 18'b111111110101010000; 
assign wn_re[148] = 18'b111111110011111110; assign wn_im[148] = 18'b111111110101011100; 
assign wn_re[149] = 18'b111111110011110011; assign wn_im[149] = 18'b111111110101101001; 
assign wn_re[150] = 18'b111111110011101000; assign wn_im[150] = 18'b111111110101110110; 
assign wn_re[151] = 18'b111111110011011101; assign wn_im[151] = 18'b111111110110000011; 
assign wn_re[152] = 18'b111111110011010011; assign wn_im[152] = 18'b111111110110010000; 
assign wn_re[153] = 18'b111111110011001001; assign wn_im[153] = 18'b111111110110011110; 
assign wn_re[154] = 18'b111111110010111111; assign wn_im[154] = 18'b111111110110101011; 
assign wn_re[155] = 18'b111111110010110101; assign wn_im[155] = 18'b111111110110111001; 
assign wn_re[156] = 18'b111111110010101100; assign wn_im[156] = 18'b111111110111000111; 
assign wn_re[157] = 18'b111111110010100011; assign wn_im[157] = 18'b111111110111010101; 
assign wn_re[158] = 18'b111111110010011010; assign wn_im[158] = 18'b111111110111100011; 
assign wn_re[159] = 18'b111111110010010001; assign wn_im[159] = 18'b111111110111110001; 
assign wn_re[160] = 18'b111111110010001001; assign wn_im[160] = 18'b111111110111111111; 
assign wn_re[161] = 18'b111111110010000000; assign wn_im[161] = 18'b111111111000001110; 
assign wn_re[162] = 18'b111111110001111000; assign wn_im[162] = 18'b111111111000011101; 
assign wn_re[163] = 18'b111111110001110001; assign wn_im[163] = 18'b111111111000101100; 
assign wn_re[164] = 18'b111111110001101001; assign wn_im[164] = 18'b111111111000111011; 
assign wn_re[165] = 18'b111111110001100010; assign wn_im[165] = 18'b111111111001001010; 
assign wn_re[166] = 18'b111111110001011011; assign wn_im[166] = 18'b111111111001011001; 
assign wn_re[167] = 18'b111111110001010100; assign wn_im[167] = 18'b111111111001101000; 
assign wn_re[168] = 18'b111111110001001101; assign wn_im[168] = 18'b111111111001111000; 
assign wn_re[169] = 18'b111111110001000111; assign wn_im[169] = 18'b111111111010000111; 
assign wn_re[170] = 18'b111111110001000001; assign wn_im[170] = 18'b111111111010010111; 
assign wn_re[171] = 18'b111111110000111011; assign wn_im[171] = 18'b111111111010100111; 
assign wn_re[172] = 18'b111111110000110110; assign wn_im[172] = 18'b111111111010110110; 
assign wn_re[173] = 18'b111111110000110001; assign wn_im[173] = 18'b111111111011000110; 
assign wn_re[174] = 18'b111111110000101100; assign wn_im[174] = 18'b111111111011010110; 
assign wn_re[175] = 18'b111111110000100111; assign wn_im[175] = 18'b111111111011100110; 
assign wn_re[176] = 18'b111111110000100010; assign wn_im[176] = 18'b111111111011110110; 
assign wn_re[177] = 18'b111111110000011110; assign wn_im[177] = 18'b111111111100000111; 
assign wn_re[178] = 18'b111111110000011010; assign wn_im[178] = 18'b111111111100010111; 
assign wn_re[179] = 18'b111111110000010111; assign wn_im[179] = 18'b111111111100100111; 
assign wn_re[180] = 18'b111111110000010011; assign wn_im[180] = 18'b111111111100111000; 
assign wn_re[181] = 18'b111111110000010000; assign wn_im[181] = 18'b111111111101001000; 
assign wn_re[182] = 18'b111111110000001101; assign wn_im[182] = 18'b111111111101011001; 
assign wn_re[183] = 18'b111111110000001011; assign wn_im[183] = 18'b111111111101101001; 
assign wn_re[184] = 18'b111111110000001000; assign wn_im[184] = 18'b111111111101111010; 
assign wn_re[185] = 18'b111111110000000110; assign wn_im[185] = 18'b111111111110001010; 
assign wn_re[186] = 18'b111111110000000100; assign wn_im[186] = 18'b111111111110011011; 
assign wn_re[187] = 18'b111111110000000011; assign wn_im[187] = 18'b111111111110101100; 
assign wn_re[188] = 18'b111111110000000010; assign wn_im[188] = 18'b111111111110111101; 
assign wn_re[189] = 18'b111111110000000001; assign wn_im[189] = 18'b111111111111001101; 
assign wn_re[190] = 18'b111111110000000000; assign wn_im[190] = 18'b111111111111011110; 
assign wn_re[191] = 18'b111111110000000000; assign wn_im[191] = 18'b111111111111101111; 
assign wn_re[192] = 18'b111111110000000000; assign wn_im[192] = 18'b111111111111111111; 
assign wn_re[193] = 18'b111111110000000000; assign wn_im[193] = 18'b000000000000010000; 
assign wn_re[194] = 18'b111111110000000000; assign wn_im[194] = 18'b000000000000100001; 
assign wn_re[195] = 18'b111111110000000001; assign wn_im[195] = 18'b000000000000110010; 
assign wn_re[196] = 18'b111111110000000010; assign wn_im[196] = 18'b000000000001000010; 
assign wn_re[197] = 18'b111111110000000011; assign wn_im[197] = 18'b000000000001010011; 
assign wn_re[198] = 18'b111111110000000100; assign wn_im[198] = 18'b000000000001100100; 
assign wn_re[199] = 18'b111111110000000110; assign wn_im[199] = 18'b000000000001110101; 
assign wn_re[200] = 18'b111111110000001000; assign wn_im[200] = 18'b000000000010000101; 
assign wn_re[201] = 18'b111111110000001011; assign wn_im[201] = 18'b000000000010010110; 
assign wn_re[202] = 18'b111111110000001101; assign wn_im[202] = 18'b000000000010100110; 
assign wn_re[203] = 18'b111111110000010000; assign wn_im[203] = 18'b000000000010110111; 
assign wn_re[204] = 18'b111111110000010011; assign wn_im[204] = 18'b000000000011000111; 
assign wn_re[205] = 18'b111111110000010111; assign wn_im[205] = 18'b000000000011011000; 
assign wn_re[206] = 18'b111111110000011010; assign wn_im[206] = 18'b000000000011101000; 
assign wn_re[207] = 18'b111111110000011110; assign wn_im[207] = 18'b000000000011111000; 
assign wn_re[208] = 18'b111111110000100010; assign wn_im[208] = 18'b000000000100001001; 
assign wn_re[209] = 18'b111111110000100111; assign wn_im[209] = 18'b000000000100011001; 
assign wn_re[210] = 18'b111111110000101100; assign wn_im[210] = 18'b000000000100101001; 
assign wn_re[211] = 18'b111111110000110001; assign wn_im[211] = 18'b000000000100111001; 
assign wn_re[212] = 18'b111111110000110110; assign wn_im[212] = 18'b000000000101001001; 
assign wn_re[213] = 18'b111111110000111011; assign wn_im[213] = 18'b000000000101011000; 
assign wn_re[214] = 18'b111111110001000001; assign wn_im[214] = 18'b000000000101101000; 
assign wn_re[215] = 18'b111111110001000111; assign wn_im[215] = 18'b000000000101111000; 
assign wn_re[216] = 18'b111111110001001101; assign wn_im[216] = 18'b000000000110000111; 
assign wn_re[217] = 18'b111111110001010100; assign wn_im[217] = 18'b000000000110010111; 
assign wn_re[218] = 18'b111111110001011011; assign wn_im[218] = 18'b000000000110100110; 
assign wn_re[219] = 18'b111111110001100010; assign wn_im[219] = 18'b000000000110110101; 
assign wn_re[220] = 18'b111111110001101001; assign wn_im[220] = 18'b000000000111000100; 
assign wn_re[221] = 18'b111111110001110001; assign wn_im[221] = 18'b000000000111010011; 
assign wn_re[222] = 18'b111111110001111000; assign wn_im[222] = 18'b000000000111100010; 
assign wn_re[223] = 18'b111111110010000000; assign wn_im[223] = 18'b000000000111110001; 
assign wn_re[224] = 18'b111111110010001001; assign wn_im[224] = 18'b000000000111111111; 
assign wn_re[225] = 18'b111111110010010001; assign wn_im[225] = 18'b000000001000001110; 
assign wn_re[226] = 18'b111111110010011010; assign wn_im[226] = 18'b000000001000011100; 
assign wn_re[227] = 18'b111111110010100011; assign wn_im[227] = 18'b000000001000101010; 
assign wn_re[228] = 18'b111111110010101100; assign wn_im[228] = 18'b000000001000111000; 
assign wn_re[229] = 18'b111111110010110101; assign wn_im[229] = 18'b000000001001000110; 
assign wn_re[230] = 18'b111111110010111111; assign wn_im[230] = 18'b000000001001010100; 
assign wn_re[231] = 18'b111111110011001001; assign wn_im[231] = 18'b000000001001100001; 
assign wn_re[232] = 18'b111111110011010011; assign wn_im[232] = 18'b000000001001101111; 
assign wn_re[233] = 18'b111111110011011101; assign wn_im[233] = 18'b000000001001111100; 
assign wn_re[234] = 18'b111111110011101000; assign wn_im[234] = 18'b000000001010001001; 
assign wn_re[235] = 18'b111111110011110011; assign wn_im[235] = 18'b000000001010010110; 
assign wn_re[236] = 18'b111111110011111110; assign wn_im[236] = 18'b000000001010100011; 
assign wn_re[237] = 18'b111111110100001001; assign wn_im[237] = 18'b000000001010101111; 
assign wn_re[238] = 18'b111111110100010100; assign wn_im[238] = 18'b000000001010111011; 
assign wn_re[239] = 18'b111111110100100000; assign wn_im[239] = 18'b000000001011001000; 
assign wn_re[240] = 18'b111111110100101011; assign wn_im[240] = 18'b000000001011010100; 
assign wn_re[241] = 18'b111111110100110111; assign wn_im[241] = 18'b000000001011011111; 
assign wn_re[242] = 18'b111111110101000100; assign wn_im[242] = 18'b000000001011101011; 
assign wn_re[243] = 18'b111111110101010000; assign wn_im[243] = 18'b000000001011110110; 
assign wn_re[244] = 18'b111111110101011100; assign wn_im[244] = 18'b000000001100000001; 
assign wn_re[245] = 18'b111111110101101001; assign wn_im[245] = 18'b000000001100001100; 
assign wn_re[246] = 18'b111111110101110110; assign wn_im[246] = 18'b000000001100010111; 
assign wn_re[247] = 18'b111111110110000011; assign wn_im[247] = 18'b000000001100100010; 
assign wn_re[248] = 18'b111111110110010000; assign wn_im[248] = 18'b000000001100101100; 
assign wn_re[249] = 18'b111111110110011110; assign wn_im[249] = 18'b000000001100110110; 
assign wn_re[250] = 18'b111111110110101011; assign wn_im[250] = 18'b000000001101000000; 
assign wn_re[251] = 18'b111111110110111001; assign wn_im[251] = 18'b000000001101001010; 
assign wn_re[252] = 18'b111111110111000111; assign wn_im[252] = 18'b000000001101010011; 
assign wn_re[253] = 18'b111111110111010101; assign wn_im[253] = 18'b000000001101011100; 
assign wn_re[254] = 18'b111111110111100011; assign wn_im[254] = 18'b000000001101100101; 
assign wn_re[255] = 18'b111111110111110001; assign wn_im[255] = 18'b000000001101101110; 
assign wn_re[256] = 18'b111111110111111111; assign wn_im[256] = 18'b000000001101110110; 
assign wn_re[257] = 18'b111111111000001110; assign wn_im[257] = 18'b000000001101111111; 
assign wn_re[258] = 18'b111111111000011101; assign wn_im[258] = 18'b000000001110000111; 
assign wn_re[259] = 18'b111111111000101100; assign wn_im[259] = 18'b000000001110001110; 
assign wn_re[260] = 18'b111111111000111011; assign wn_im[260] = 18'b000000001110010110; 
assign wn_re[261] = 18'b111111111001001010; assign wn_im[261] = 18'b000000001110011101; 
assign wn_re[262] = 18'b111111111001011001; assign wn_im[262] = 18'b000000001110100100; 
assign wn_re[263] = 18'b111111111001101000; assign wn_im[263] = 18'b000000001110101011; 
assign wn_re[264] = 18'b111111111001111000; assign wn_im[264] = 18'b000000001110110010; 
assign wn_re[265] = 18'b111111111010000111; assign wn_im[265] = 18'b000000001110111000; 
assign wn_re[266] = 18'b111111111010010111; assign wn_im[266] = 18'b000000001110111110; 
assign wn_re[267] = 18'b111111111010100111; assign wn_im[267] = 18'b000000001111000100; 
assign wn_re[268] = 18'b111111111010110110; assign wn_im[268] = 18'b000000001111001001; 
assign wn_re[269] = 18'b111111111011000110; assign wn_im[269] = 18'b000000001111001110; 
assign wn_re[270] = 18'b111111111011010110; assign wn_im[270] = 18'b000000001111010011; 
assign wn_re[271] = 18'b111111111011100110; assign wn_im[271] = 18'b000000001111011000; 
assign wn_re[272] = 18'b111111111011110110; assign wn_im[272] = 18'b000000001111011101; 
assign wn_re[273] = 18'b111111111100000111; assign wn_im[273] = 18'b000000001111100001; 
assign wn_re[274] = 18'b111111111100010111; assign wn_im[274] = 18'b000000001111100101; 
assign wn_re[275] = 18'b111111111100100111; assign wn_im[275] = 18'b000000001111101000; 
assign wn_re[276] = 18'b111111111100111000; assign wn_im[276] = 18'b000000001111101100; 
assign wn_re[277] = 18'b111111111101001000; assign wn_im[277] = 18'b000000001111101111; 
assign wn_re[278] = 18'b111111111101011001; assign wn_im[278] = 18'b000000001111110010; 
assign wn_re[279] = 18'b111111111101101001; assign wn_im[279] = 18'b000000001111110100; 
assign wn_re[280] = 18'b111111111101111010; assign wn_im[280] = 18'b000000001111110111; 
assign wn_re[281] = 18'b111111111110001010; assign wn_im[281] = 18'b000000001111111001; 
assign wn_re[282] = 18'b111111111110011011; assign wn_im[282] = 18'b000000001111111011; 
assign wn_re[283] = 18'b111111111110101100; assign wn_im[283] = 18'b000000001111111100; 
assign wn_re[284] = 18'b111111111110111101; assign wn_im[284] = 18'b000000001111111101; 
assign wn_re[285] = 18'b111111111111001101; assign wn_im[285] = 18'b000000001111111110; 
assign wn_re[286] = 18'b111111111111011110; assign wn_im[286] = 18'b000000001111111111; 
assign wn_re[287] = 18'b111111111111101111; assign wn_im[287] = 18'b000000001111111111; 
assign wn_re[288] = 18'b111111111111111111; assign wn_im[288] = 18'b000000010000000000; 
assign wn_re[289] = 18'b000000000000010000; assign wn_im[289] = 18'b000000001111111111; 
assign wn_re[290] = 18'b000000000000100001; assign wn_im[290] = 18'b000000001111111111; 
assign wn_re[291] = 18'b000000000000110010; assign wn_im[291] = 18'b000000001111111110; 
assign wn_re[292] = 18'b000000000001000010; assign wn_im[292] = 18'b000000001111111101; 
assign wn_re[293] = 18'b000000000001010011; assign wn_im[293] = 18'b000000001111111100; 
assign wn_re[294] = 18'b000000000001100100; assign wn_im[294] = 18'b000000001111111011; 
assign wn_re[295] = 18'b000000000001110101; assign wn_im[295] = 18'b000000001111111001; 
assign wn_re[296] = 18'b000000000010000101; assign wn_im[296] = 18'b000000001111110111; 
assign wn_re[297] = 18'b000000000010010110; assign wn_im[297] = 18'b000000001111110100; 
assign wn_re[298] = 18'b000000000010100110; assign wn_im[298] = 18'b000000001111110010; 
assign wn_re[299] = 18'b000000000010110111; assign wn_im[299] = 18'b000000001111101111; 
assign wn_re[300] = 18'b000000000011000111; assign wn_im[300] = 18'b000000001111101100; 
assign wn_re[301] = 18'b000000000011011000; assign wn_im[301] = 18'b000000001111101000; 
assign wn_re[302] = 18'b000000000011101000; assign wn_im[302] = 18'b000000001111100101; 
assign wn_re[303] = 18'b000000000011111000; assign wn_im[303] = 18'b000000001111100001; 
assign wn_re[304] = 18'b000000000100001001; assign wn_im[304] = 18'b000000001111011101; 
assign wn_re[305] = 18'b000000000100011001; assign wn_im[305] = 18'b000000001111011000; 
assign wn_re[306] = 18'b000000000100101001; assign wn_im[306] = 18'b000000001111010011; 
assign wn_re[307] = 18'b000000000100111001; assign wn_im[307] = 18'b000000001111001110; 
assign wn_re[308] = 18'b000000000101001001; assign wn_im[308] = 18'b000000001111001001; 
assign wn_re[309] = 18'b000000000101011000; assign wn_im[309] = 18'b000000001111000100; 
assign wn_re[310] = 18'b000000000101101000; assign wn_im[310] = 18'b000000001110111110; 
assign wn_re[311] = 18'b000000000101111000; assign wn_im[311] = 18'b000000001110111000; 
assign wn_re[312] = 18'b000000000110000111; assign wn_im[312] = 18'b000000001110110010; 
assign wn_re[313] = 18'b000000000110010111; assign wn_im[313] = 18'b000000001110101011; 
assign wn_re[314] = 18'b000000000110100110; assign wn_im[314] = 18'b000000001110100100; 
assign wn_re[315] = 18'b000000000110110101; assign wn_im[315] = 18'b000000001110011101; 
assign wn_re[316] = 18'b000000000111000100; assign wn_im[316] = 18'b000000001110010110; 
assign wn_re[317] = 18'b000000000111010011; assign wn_im[317] = 18'b000000001110001110; 
assign wn_re[318] = 18'b000000000111100010; assign wn_im[318] = 18'b000000001110000111; 
assign wn_re[319] = 18'b000000000111110001; assign wn_im[319] = 18'b000000001101111111; 
assign wn_re[320] = 18'b000000000111111111; assign wn_im[320] = 18'b000000001101110110; 
assign wn_re[321] = 18'b000000001000001110; assign wn_im[321] = 18'b000000001101101110; 
assign wn_re[322] = 18'b000000001000011100; assign wn_im[322] = 18'b000000001101100101; 
assign wn_re[323] = 18'b000000001000101010; assign wn_im[323] = 18'b000000001101011100; 
assign wn_re[324] = 18'b000000001000111000; assign wn_im[324] = 18'b000000001101010011; 
assign wn_re[325] = 18'b000000001001000110; assign wn_im[325] = 18'b000000001101001010; 
assign wn_re[326] = 18'b000000001001010100; assign wn_im[326] = 18'b000000001101000000; 
assign wn_re[327] = 18'b000000001001100001; assign wn_im[327] = 18'b000000001100110110; 
assign wn_re[328] = 18'b000000001001101111; assign wn_im[328] = 18'b000000001100101100; 
assign wn_re[329] = 18'b000000001001111100; assign wn_im[329] = 18'b000000001100100010; 
assign wn_re[330] = 18'b000000001010001001; assign wn_im[330] = 18'b000000001100010111; 
assign wn_re[331] = 18'b000000001010010110; assign wn_im[331] = 18'b000000001100001100; 
assign wn_re[332] = 18'b000000001010100011; assign wn_im[332] = 18'b000000001100000001; 
assign wn_re[333] = 18'b000000001010101111; assign wn_im[333] = 18'b000000001011110110; 
assign wn_re[334] = 18'b000000001010111011; assign wn_im[334] = 18'b000000001011101011; 
assign wn_re[335] = 18'b000000001011001000; assign wn_im[335] = 18'b000000001011011111; 
assign wn_re[336] = 18'b000000001011010100; assign wn_im[336] = 18'b000000001011010100; 
assign wn_re[337] = 18'b000000001011011111; assign wn_im[337] = 18'b000000001011001000; 
assign wn_re[338] = 18'b000000001011101011; assign wn_im[338] = 18'b000000001010111011; 
assign wn_re[339] = 18'b000000001011110110; assign wn_im[339] = 18'b000000001010101111; 
assign wn_re[340] = 18'b000000001100000001; assign wn_im[340] = 18'b000000001010100011; 
assign wn_re[341] = 18'b000000001100001100; assign wn_im[341] = 18'b000000001010010110; 
assign wn_re[342] = 18'b000000001100010111; assign wn_im[342] = 18'b000000001010001001; 
assign wn_re[343] = 18'b000000001100100010; assign wn_im[343] = 18'b000000001001111100; 
assign wn_re[344] = 18'b000000001100101100; assign wn_im[344] = 18'b000000001001101111; 
assign wn_re[345] = 18'b000000001100110110; assign wn_im[345] = 18'b000000001001100001; 
assign wn_re[346] = 18'b000000001101000000; assign wn_im[346] = 18'b000000001001010100; 
assign wn_re[347] = 18'b000000001101001010; assign wn_im[347] = 18'b000000001001000110; 
assign wn_re[348] = 18'b000000001101010011; assign wn_im[348] = 18'b000000001000111000; 
assign wn_re[349] = 18'b000000001101011100; assign wn_im[349] = 18'b000000001000101010; 
assign wn_re[350] = 18'b000000001101100101; assign wn_im[350] = 18'b000000001000011100; 
assign wn_re[351] = 18'b000000001101101110; assign wn_im[351] = 18'b000000001000001110; 
assign wn_re[352] = 18'b000000001101110110; assign wn_im[352] = 18'b000000001000000000; 
assign wn_re[353] = 18'b000000001101111111; assign wn_im[353] = 18'b000000000111110001; 
assign wn_re[354] = 18'b000000001110000111; assign wn_im[354] = 18'b000000000111100010; 
assign wn_re[355] = 18'b000000001110001110; assign wn_im[355] = 18'b000000000111010011; 
assign wn_re[356] = 18'b000000001110010110; assign wn_im[356] = 18'b000000000111000100; 
assign wn_re[357] = 18'b000000001110011101; assign wn_im[357] = 18'b000000000110110101; 
assign wn_re[358] = 18'b000000001110100100; assign wn_im[358] = 18'b000000000110100110; 
assign wn_re[359] = 18'b000000001110101011; assign wn_im[359] = 18'b000000000110010111; 
assign wn_re[360] = 18'b000000001110110010; assign wn_im[360] = 18'b000000000110000111; 
assign wn_re[361] = 18'b000000001110111000; assign wn_im[361] = 18'b000000000101111000; 
assign wn_re[362] = 18'b000000001110111110; assign wn_im[362] = 18'b000000000101101000; 
assign wn_re[363] = 18'b000000001111000100; assign wn_im[363] = 18'b000000000101011000; 
assign wn_re[364] = 18'b000000001111001001; assign wn_im[364] = 18'b000000000101001001; 
assign wn_re[365] = 18'b000000001111001110; assign wn_im[365] = 18'b000000000100111001; 
assign wn_re[366] = 18'b000000001111010011; assign wn_im[366] = 18'b000000000100101001; 
assign wn_re[367] = 18'b000000001111011000; assign wn_im[367] = 18'b000000000100011001; 
assign wn_re[368] = 18'b000000001111011101; assign wn_im[368] = 18'b000000000100001001; 
assign wn_re[369] = 18'b000000001111100001; assign wn_im[369] = 18'b000000000011111000; 
assign wn_re[370] = 18'b000000001111100101; assign wn_im[370] = 18'b000000000011101000; 
assign wn_re[371] = 18'b000000001111101000; assign wn_im[371] = 18'b000000000011011000; 
assign wn_re[372] = 18'b000000001111101100; assign wn_im[372] = 18'b000000000011000111; 
assign wn_re[373] = 18'b000000001111101111; assign wn_im[373] = 18'b000000000010110111; 
assign wn_re[374] = 18'b000000001111110010; assign wn_im[374] = 18'b000000000010100110; 
assign wn_re[375] = 18'b000000001111110100; assign wn_im[375] = 18'b000000000010010110; 
assign wn_re[376] = 18'b000000001111110111; assign wn_im[376] = 18'b000000000010000101; 
assign wn_re[377] = 18'b000000001111111001; assign wn_im[377] = 18'b000000000001110101; 
assign wn_re[378] = 18'b000000001111111011; assign wn_im[378] = 18'b000000000001100100; 
assign wn_re[379] = 18'b000000001111111100; assign wn_im[379] = 18'b000000000001010011; 
assign wn_re[380] = 18'b000000001111111101; assign wn_im[380] = 18'b000000000001000010; 
assign wn_re[381] = 18'b000000001111111110; assign wn_im[381] = 18'b000000000000110010; 
assign wn_re[382] = 18'b000000001111111111; assign wn_im[382] = 18'b000000000000100001; 
assign wn_re[383] = 18'b000000001111111111; assign wn_im[383] = 18'b000000000000010000; 

endmodule
