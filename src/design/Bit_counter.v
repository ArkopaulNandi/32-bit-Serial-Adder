`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 21:59:38
// Design Name: 
// Module Name: Bit_counter
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


module Bit_counter(
    input clk, rst, count_en,
    output reg [5:0] count,
    output done
    );
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            count <= 6'b0;
        end else if(count_en) begin
            count <= count + 1;
        end
    end
    
    assign done = (count == 6'd31);
endmodule
