`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2025 17:44:52
// Design Name: 
// Module Name: dff
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


module dff(
    input clk, rst, d,
    output reg q
    );
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            q <= 1'b0;
        end else begin
            q <= d;
        end
    end
endmodule
