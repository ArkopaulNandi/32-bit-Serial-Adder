`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 20:29:43
// Design Name: 
// Module Name: SIPOreg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIPOreg(
    input clk, rst, shift, serial_in,
    output [31:0] parallel_out
    );
    
    wire [31:0] q;
    wire [31:0] d;   
    
        dff ff0 (clk, rst, d[31], q[31]);
        dff ff1 (clk, rst, d[30], q[30]);
        dff ff2 (clk, rst, d[29], q[29]);
        dff ff3 (clk, rst, d[28], q[28]);
        dff ff4 (clk, rst, d[27], q[27]);
        dff ff5 (clk, rst, d[26], q[26]);
        dff ff6 (clk, rst, d[25], q[25]);
        dff ff7 (clk, rst, d[24], q[24]);
        dff ff8 (clk, rst, d[23], q[23]);
        dff ff9 (clk, rst, d[22], q[22]);
        dff ff10 (clk, rst, d[21], q[21]);
        dff ff11 (clk, rst, d[20], q[20]);
        dff ff12 (clk, rst, d[19], q[19]);
        dff ff13 (clk, rst, d[18], q[18]);
        dff ff14 (clk, rst, d[17], q[17]);
        dff ff15 (clk, rst, d[16], q[16]);
        dff ff16 (clk, rst, d[15], q[15]);
        dff ff17 (clk, rst, d[14], q[14]);
        dff ff18 (clk, rst, d[13], q[13]);
        dff ff19 (clk, rst, d[12], q[12]);
        dff ff20 (clk, rst, d[11], q[11]);
        dff ff21 (clk, rst, d[10], q[10]);
        dff ff22 (clk, rst, d[9], q[9]);
        dff ff23 (clk, rst, d[8], q[8]);
        dff ff24 (clk, rst, d[7], q[7]);
        dff ff25 (clk, rst, d[6], q[6]);
        dff ff26 (clk, rst, d[5], q[5]);
        dff ff27 (clk, rst, d[4], q[4]);
        dff ff28 (clk, rst, d[3], q[3]);
        dff ff29 (clk, rst, d[2], q[2]);
        dff ff30 (clk, rst, d[1], q[1]);
        dff ff31 (clk, rst, d[0], q[0]); 
    
    assign d[31] = shift ? serial_in : q[31];
    
    genvar i;
    generate
        for(i = 0; i < 31; i = i + 1) begin
            assign d[i] = shift ? q[i + 1] : q[i];
        end
    endgenerate    
    
    assign parallel_out = q;
endmodule
