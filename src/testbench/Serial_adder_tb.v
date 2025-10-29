`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 23:28:44
// Design Name: 
// Module Name: Serial_adder_tb
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


module Serial_adder_tb;
    reg clk, rst, start;
    reg [31:0] operand_A, operand_B;
    wire [31:0] sum;
    wire carry_out, done;
    
    Serial_adder adder(clk, rst, start, operand_A, operand_B, sum, carry_out, done);
    
    always #5 clk = ~clk;
    
    task addition;
        input [31:0] a, b, expected_sum;
        input expected_carry;
        begin
            operand_A = a;
            operand_B = b;
            
            while (done == 1'b1) @ (posedge clk);
            
            start = 1;
            @ (posedge clk);
            start = 0;
            
            while (done == 1'b0) @ (posedge clk);
            @ (posedge clk);
            
            if(sum !== expected_sum || carry_out !== expected_carry) begin
                $display("ERROR: %h + %h = {sum: %h, carry: %b}, Expected: {sum: %h, carry: %b}", a, b, sum, carry_out, 
                expected_sum, expected_carry);
            end else begin
                $display("PASS: %h + %h = {sum: %h, carry: %b}", a, b, sum, carry_out);
            end
            
            while (done == 1'b1) @ (posedge clk);
            #20;
        end
    endtask
    
    initial begin
        clk = 0;
        rst = 1; start = 0; operand_A = 0; operand_B = 0;
        
        #20 rst = 0;
        #10;
        
        $display("Starting Comprehensive Serial Adder Tests...");
        $display("============================================");
        
        // Test Group 1 -> Basic Arithmetic
        $display("\n---Basic Arithmetic Tests---");        
        addition(32'h00000001, 32'h00000001, 32'h00000002, 1'b0);
        addition(32'h0000000A, 32'h00000005, 32'h0000000F, 1'b0);
        addition(32'h00000004, 32'h00000009, 32'h0000000D, 1'b0);
        
        // Test Group 2 -> Zero and Identity
        $display("\n---Zero and Identity Tests---");
        addition(32'h00000000, 32'h00000000, 32'h00000000, 1'b0);
        addition(32'h00000000, 32'h00000003, 32'h00000003, 1'b0);
        addition(32'h12345678, 32'h00000000, 32'h12345678, 1'b0);
        
        // Test Group 3 -> Max Values and Carry Generation
        $display("\n---Carry Generation Tests---");
        addition(32'hFFFFFFFF, 32'h00000001, 32'h00000000, 1'b1);
        addition(32'hFFFFFFFF, 32'h00000002, 32'h00000001, 1'b1);
        addition(32'hFFFFFFFF, 32'hFFFFFFFF, 32'hFFFFFFFE, 1'b1);
        
        // Test Group 4 -> Carry Propagation
        $display("\n---Carry Propagation Tests---");
        addition(32'hF0F0F0F0, 32'h0F0F0F0F, 32'hFFFFFFFF, 1'b0);
        addition(32'hEEEEEEEE, 32'h11111111, 32'hFFFFFFFF, 1'b0);
        addition(32'h55555555, 32'hAAAAAAAA, 32'hFFFFFFFF, 1'b0);
        
        // Test Group 5 -> Large Number
        $display("\n---Large Number Tests---");
        addition(32'h12345678, 32'h87654321, 32'h99999999, 1'b0);
        addition(32'hDEADBEEF, 32'hCAFEBABE, 32'hA9AC79AD, 1'b1);
        addition(32'h7FFFFFFF, 32'h00000001, 32'h80000000, 1'b0);
               
        $display("All Comprehensive Test Completed");
        $display("================================");
        $finish;
    end
    
    
endmodule
