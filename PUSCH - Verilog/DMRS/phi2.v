module phi2 (
        input   [4:0]   u,   //  Sequence number
        input   [9:0]   counter,   //  Counter of the generator
        output wire [1:0]  phi_value  //  phase of the sequence
    );

    wire [1:0] phi2 [0:29][0:11];

    assign phi_value = phi2[u][counter];
        
assign phi2 [0][0] = 2'b11;
assign phi2 [0][1] = 2'b00;
assign phi2 [0][2] = 2'b11;
assign phi2 [0][3] = 2'b11;
assign phi2 [0][4] = 2'b11;
assign phi2 [0][5] = 2'b01;
assign phi2 [0][6] = 2'b11;
assign phi2 [0][7] = 2'b10;
assign phi2 [0][8] = 2'b00;
assign phi2 [0][9] = 2'b00;
assign phi2 [0][10] = 2'b00;
assign phi2 [0][11] = 2'b11;
assign phi2 [1][0] = 2'b11;
assign phi2 [1][1] = 2'b01;
assign phi2 [1][2] = 2'b00;
assign phi2 [1][3] = 2'b11;
assign phi2 [1][4] = 2'b00;
assign phi2 [1][5] = 2'b01;
assign phi2 [1][6] = 2'b10;
assign phi2 [1][7] = 2'b10;
assign phi2 [1][8] = 2'b00;
assign phi2 [1][9] = 2'b01;
assign phi2 [1][10] = 2'b01;
assign phi2 [1][11] = 2'b01;
assign phi2 [2][0] = 2'b11;
assign phi2 [2][1] = 2'b01;
assign phi2 [2][2] = 2'b01;
assign phi2 [2][3] = 2'b00;
assign phi2 [2][4] = 2'b11;
assign phi2 [2][5] = 2'b01;
assign phi2 [2][6] = 2'b10;
assign phi2 [2][7] = 2'b00;
assign phi2 [2][8] = 2'b01;
assign phi2 [2][9] = 2'b11;
assign phi2 [2][10] = 2'b01;
assign phi2 [2][11] = 2'b11;
assign phi2 [3][0] = 2'b11;
assign phi2 [3][1] = 2'b11;
assign phi2 [3][2] = 2'b10;
assign phi2 [3][3] = 2'b01;
assign phi2 [3][4] = 2'b01;
assign phi2 [3][5] = 2'b01;
assign phi2 [3][6] = 2'b11;
assign phi2 [3][7] = 2'b01;
assign phi2 [3][8] = 2'b11;
assign phi2 [3][9] = 2'b00;
assign phi2 [3][10] = 2'b10;
assign phi2 [3][11] = 2'b11;
assign phi2 [4][0] = 2'b11;
assign phi2 [4][1] = 2'b10;
assign phi2 [4][2] = 2'b10;
assign phi2 [4][3] = 2'b00;
assign phi2 [4][4] = 2'b01;
assign phi2 [4][5] = 2'b00;
assign phi2 [4][6] = 2'b00;
assign phi2 [4][7] = 2'b10;
assign phi2 [4][8] = 2'b00;
assign phi2 [4][9] = 2'b10;
assign phi2 [4][10] = 2'b11;
assign phi2 [4][11] = 2'b00;
assign phi2 [5][0] = 2'b11;
assign phi2 [5][1] = 2'b11;
assign phi2 [5][2] = 2'b01;
assign phi2 [5][3] = 2'b00;
assign phi2 [5][4] = 2'b11;
assign phi2 [5][5] = 2'b11;
assign phi2 [5][6] = 2'b11;
assign phi2 [5][7] = 2'b10;
assign phi2 [5][8] = 2'b01;
assign phi2 [5][9] = 2'b10;
assign phi2 [5][10] = 2'b00;
assign phi2 [5][11] = 2'b01;
assign phi2 [6][0] = 2'b00;
assign phi2 [6][1] = 2'b10;
assign phi2 [6][2] = 2'b01;
assign phi2 [6][3] = 2'b10;
assign phi2 [6][4] = 2'b10;
assign phi2 [6][5] = 2'b10;
assign phi2 [6][6] = 2'b11;
assign phi2 [6][7] = 2'b10;
assign phi2 [6][8] = 2'b00;
assign phi2 [6][9] = 2'b00;
assign phi2 [6][10] = 2'b00;
assign phi2 [6][11] = 2'b11;
assign phi2 [7][0] = 2'b10;
assign phi2 [7][1] = 2'b11;
assign phi2 [7][2] = 2'b01;
assign phi2 [7][3] = 2'b10;
assign phi2 [7][4] = 2'b11;
assign phi2 [7][5] = 2'b11;
assign phi2 [7][6] = 2'b11;
assign phi2 [7][7] = 2'b10;
assign phi2 [7][8] = 2'b00;
assign phi2 [7][9] = 2'b10;
assign phi2 [7][10] = 2'b00;
assign phi2 [7][11] = 2'b11;
assign phi2 [8][0] = 2'b11;
assign phi2 [8][1] = 2'b10;
assign phi2 [8][2] = 2'b01;
assign phi2 [8][3] = 2'b00;
assign phi2 [8][4] = 2'b11;
assign phi2 [8][5] = 2'b10;
assign phi2 [8][6] = 2'b11;
assign phi2 [8][7] = 2'b01;
assign phi2 [8][8] = 2'b00;
assign phi2 [8][9] = 2'b01;
assign phi2 [8][10] = 2'b01;
assign phi2 [8][11] = 2'b00;
assign phi2 [9][0] = 2'b11;
assign phi2 [9][1] = 2'b10;
assign phi2 [9][2] = 2'b10;
assign phi2 [9][3] = 2'b11;
assign phi2 [9][4] = 2'b11;
assign phi2 [9][5] = 2'b10;
assign phi2 [9][6] = 2'b11;
assign phi2 [9][7] = 2'b01;
assign phi2 [9][8] = 2'b00;
assign phi2 [9][9] = 2'b01;
assign phi2 [9][10] = 2'b10;
assign phi2 [9][11] = 2'b11;
assign phi2 [10][0] = 2'b11;
assign phi2 [10][1] = 2'b01;
assign phi2 [10][2] = 2'b11;
assign phi2 [10][3] = 2'b01;
assign phi2 [10][4] = 2'b01;
assign phi2 [10][5] = 2'b11;
assign phi2 [10][6] = 2'b10;
assign phi2 [10][7] = 2'b10;
assign phi2 [10][8] = 2'b01;
assign phi2 [10][9] = 2'b01;
assign phi2 [10][10] = 2'b00;
assign phi2 [10][11] = 2'b11;
assign phi2 [11][0] = 2'b11;
assign phi2 [11][1] = 2'b10;
assign phi2 [11][2] = 2'b11;
assign phi2 [11][3] = 2'b10;
assign phi2 [11][4] = 2'b10;
assign phi2 [11][5] = 2'b11;
assign phi2 [11][6] = 2'b01;
assign phi2 [11][7] = 2'b01;
assign phi2 [11][8] = 2'b10;
assign phi2 [11][9] = 2'b10;
assign phi2 [11][10] = 2'b00;
assign phi2 [11][11] = 2'b11;
assign phi2 [12][0] = 2'b11;
assign phi2 [12][1] = 2'b10;
assign phi2 [12][2] = 2'b01;
assign phi2 [12][3] = 2'b11;
assign phi2 [12][4] = 2'b11;
assign phi2 [12][5] = 2'b10;
assign phi2 [12][6] = 2'b11;
assign phi2 [12][7] = 2'b00;
assign phi2 [12][8] = 2'b10;
assign phi2 [12][9] = 2'b11;
assign phi2 [12][10] = 2'b01;
assign phi2 [12][11] = 2'b01;
assign phi2 [13][0] = 2'b11;
assign phi2 [13][1] = 2'b00;
assign phi2 [13][2] = 2'b10;
assign phi2 [13][3] = 2'b10;
assign phi2 [13][4] = 2'b01;
assign phi2 [13][5] = 2'b01;
assign phi2 [13][6] = 2'b11;
assign phi2 [13][7] = 2'b10;
assign phi2 [13][8] = 2'b10;
assign phi2 [13][9] = 2'b11;
assign phi2 [13][10] = 2'b10;
assign phi2 [13][11] = 2'b11;
assign phi2 [14][0] = 2'b00;
assign phi2 [14][1] = 2'b01;
assign phi2 [14][2] = 2'b11;
assign phi2 [14][3] = 2'b00;
assign phi2 [14][4] = 2'b01;
assign phi2 [14][5] = 2'b01;
assign phi2 [14][6] = 2'b01;
assign phi2 [14][7] = 2'b00;
assign phi2 [14][8] = 2'b10;
assign phi2 [14][9] = 2'b00;
assign phi2 [14][10] = 2'b10;
assign phi2 [14][11] = 2'b01;
assign phi2 [15][0] = 2'b11;
assign phi2 [15][1] = 2'b00;
assign phi2 [15][2] = 2'b01;
assign phi2 [15][3] = 2'b10;
assign phi2 [15][4] = 2'b10;
assign phi2 [15][5] = 2'b11;
assign phi2 [15][6] = 2'b11;
assign phi2 [15][7] = 2'b10;
assign phi2 [15][8] = 2'b10;
assign phi2 [15][9] = 2'b01;
assign phi2 [15][10] = 2'b00;
assign phi2 [15][11] = 2'b11;
assign phi2 [16][0] = 2'b10;
assign phi2 [16][1] = 2'b10;
assign phi2 [16][2] = 2'b10;
assign phi2 [16][3] = 2'b10;
assign phi2 [16][4] = 2'b00;
assign phi2 [16][5] = 2'b11;
assign phi2 [16][6] = 2'b10;
assign phi2 [16][7] = 2'b01;
assign phi2 [16][8] = 2'b01;
assign phi2 [16][9] = 2'b10;
assign phi2 [16][10] = 2'b11;
assign phi2 [16][11] = 2'b00;
assign phi2 [17][0] = 2'b10;
assign phi2 [17][1] = 2'b00;
assign phi2 [17][2] = 2'b00;
assign phi2 [17][3] = 2'b10;
assign phi2 [17][4] = 2'b00;
assign phi2 [17][5] = 2'b01;
assign phi2 [17][6] = 2'b01;
assign phi2 [17][7] = 2'b10;
assign phi2 [17][8] = 2'b10;
assign phi2 [17][9] = 2'b11;
assign phi2 [17][10] = 2'b00;
assign phi2 [17][11] = 2'b11;
assign phi2 [18][0] = 2'b11;
assign phi2 [18][1] = 2'b00;
assign phi2 [18][2] = 2'b01;
assign phi2 [18][3] = 2'b01;
assign phi2 [18][4] = 2'b10;
assign phi2 [18][5] = 2'b10;
assign phi2 [18][6] = 2'b11;
assign phi2 [18][7] = 2'b01;
assign phi2 [18][8] = 2'b01;
assign phi2 [18][9] = 2'b11;
assign phi2 [18][10] = 2'b01;
assign phi2 [18][11] = 2'b11;
assign phi2 [19][0] = 2'b11;
assign phi2 [19][1] = 2'b11;
assign phi2 [19][2] = 2'b01;
assign phi2 [19][3] = 2'b11;
assign phi2 [19][4] = 2'b10;
assign phi2 [19][5] = 2'b01;
assign phi2 [19][6] = 2'b01;
assign phi2 [19][7] = 2'b01;
assign phi2 [19][8] = 2'b10;
assign phi2 [19][9] = 2'b11;
assign phi2 [19][10] = 2'b00;
assign phi2 [19][11] = 2'b11;
assign phi2 [20][0] = 2'b01;
assign phi2 [20][1] = 2'b00;
assign phi2 [20][2] = 2'b01;
assign phi2 [20][3] = 2'b00;
assign phi2 [20][4] = 2'b01;
assign phi2 [20][5] = 2'b11;
assign phi2 [20][6] = 2'b10;
assign phi2 [20][7] = 2'b00;
assign phi2 [20][8] = 2'b01;
assign phi2 [20][9] = 2'b00;
assign phi2 [20][10] = 2'b10;
assign phi2 [20][11] = 2'b11;
assign phi2 [21][0] = 2'b11;
assign phi2 [21][1] = 2'b01;
assign phi2 [21][2] = 2'b00;
assign phi2 [21][3] = 2'b01;
assign phi2 [21][4] = 2'b11;
assign phi2 [21][5] = 2'b00;
assign phi2 [21][6] = 2'b00;
assign phi2 [21][7] = 2'b00;
assign phi2 [21][8] = 2'b00;
assign phi2 [21][9] = 2'b01;
assign phi2 [21][10] = 2'b11;
assign phi2 [21][11] = 2'b01;
assign phi2 [22][0] = 2'b11;
assign phi2 [22][1] = 2'b01;
assign phi2 [22][2] = 2'b01;
assign phi2 [22][3] = 2'b01;
assign phi2 [22][4] = 2'b10;
assign phi2 [22][5] = 2'b11;
assign phi2 [22][6] = 2'b11;
assign phi2 [22][7] = 2'b10;
assign phi2 [22][8] = 2'b11;
assign phi2 [22][9] = 2'b00;
assign phi2 [22][10] = 2'b01;
assign phi2 [22][11] = 2'b11;
assign phi2 [23][0] = 2'b01;
assign phi2 [23][1] = 2'b10;
assign phi2 [23][2] = 2'b11;
assign phi2 [23][3] = 2'b01;
assign phi2 [23][4] = 2'b11;
assign phi2 [23][5] = 2'b10;
assign phi2 [23][6] = 2'b01;
assign phi2 [23][7] = 2'b01;
assign phi2 [23][8] = 2'b01;
assign phi2 [23][9] = 2'b11;
assign phi2 [23][10] = 2'b10;
assign phi2 [23][11] = 2'b11;
assign phi2 [24][0] = 2'b11;
assign phi2 [24][1] = 2'b10;
assign phi2 [24][2] = 2'b00;
assign phi2 [24][3] = 2'b11;
assign phi2 [24][4] = 2'b00;
assign phi2 [24][5] = 2'b01;
assign phi2 [24][6] = 2'b01;
assign phi2 [24][7] = 2'b01;
assign phi2 [24][8] = 2'b10;
assign phi2 [24][9] = 2'b11;
assign phi2 [24][10] = 2'b01;
assign phi2 [24][11] = 2'b01;
assign phi2 [25][0] = 2'b11;
assign phi2 [25][1] = 2'b01;
assign phi2 [25][2] = 2'b00;
assign phi2 [25][3] = 2'b10;
assign phi2 [25][4] = 2'b01;
assign phi2 [25][5] = 2'b01;
assign phi2 [25][6] = 2'b11;
assign phi2 [25][7] = 2'b00;
assign phi2 [25][8] = 2'b10;
assign phi2 [25][9] = 2'b00;
assign phi2 [25][10] = 2'b10;
assign phi2 [25][11] = 2'b00;
assign phi2 [26][0] = 2'b10;
assign phi2 [26][1] = 2'b00;
assign phi2 [26][2] = 2'b01;
assign phi2 [26][3] = 2'b11;
assign phi2 [26][4] = 2'b00;
assign phi2 [26][5] = 2'b10;
assign phi2 [26][6] = 2'b00;
assign phi2 [26][7] = 2'b10;
assign phi2 [26][8] = 2'b10;
assign phi2 [26][9] = 2'b11;
assign phi2 [26][10] = 2'b00;
assign phi2 [26][11] = 2'b10;
assign phi2 [27][0] = 2'b11;
assign phi2 [27][1] = 2'b11;
assign phi2 [27][2] = 2'b01;
assign phi2 [27][3] = 2'b01;
assign phi2 [27][4] = 2'b01;
assign phi2 [27][5] = 2'b11;
assign phi2 [27][6] = 2'b10;
assign phi2 [27][7] = 2'b00;
assign phi2 [27][8] = 2'b11;
assign phi2 [27][9] = 2'b01;
assign phi2 [27][10] = 2'b00;
assign phi2 [27][11] = 2'b11;
assign phi2 [28][0] = 2'b00;
assign phi2 [28][1] = 2'b10;
assign phi2 [28][2] = 2'b01;
assign phi2 [28][3] = 2'b00;
assign phi2 [28][4] = 2'b00;
assign phi2 [28][5] = 2'b10;
assign phi2 [28][6] = 2'b10;
assign phi2 [28][7] = 2'b10;
assign phi2 [28][8] = 2'b00;
assign phi2 [28][9] = 2'b01;
assign phi2 [28][10] = 2'b11;
assign phi2 [28][11] = 2'b00;
assign phi2 [29][0] = 2'b11;
assign phi2 [29][1] = 2'b01;
assign phi2 [29][2] = 2'b11;
assign phi2 [29][3] = 2'b01;
assign phi2 [29][4] = 2'b11;
assign phi2 [29][5] = 2'b11;
assign phi2 [29][6] = 2'b01;
assign phi2 [29][7] = 2'b10;
assign phi2 [29][8] = 2'b10;
assign phi2 [29][9] = 2'b00;
assign phi2 [29][10] = 2'b01;
assign phi2 [29][11] = 2'b11;

endmodule