`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 23:02:35
// Design Name: 
// Module Name: Serial_adder
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


module Serial_adder(
    input clk, rst, start, 
    input [31:0] operand_A, operand_B,
    output [31:0] sum,
    output carry_out, done
    );
    
    wire load, shift, count_en;
    wire a_bit, b_bit, sum_bit, current_carry, next_carry;
    wire count_done;
    wire [31:0] A_out, B_out;
    wire [5:0] count;
    
    PISOreg reg_a(clk, rst, shift, load, operand_A, a_bit, A_out);
    
    PISOreg reg_b(clk, rst, shift, load, operand_B, b_bit, B_out);
    
    SIPOreg reg_sum(clk, rst, shift, sum_bit, sum);
    
    Full_adder fa(a_bit, b_bit, current_carry, sum_bit, next_carry);
    
    dff carry_ff(clk, (rst | load), next_carry, current_carry);
    
    Bit_counter counter(clk, (rst | load), count_en, count, count_done);
    
    Control fsm(clk, rst, start, count_done, load, shift, count_en, done);
    
    assign carry_out = current_carry;
endmodule
