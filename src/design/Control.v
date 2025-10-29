`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2025 22:09:28
// Design Name: 
// Module Name: Control
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


module Control(
    input clk, rst, start, count_done,
    output reg load, shift, count_en, done
    );
    
    parameter IDLE = 2'b00;
    parameter LOAD = 2'b01;
    parameter ADD = 2'b10;
    parameter DONE = 2'b11;
    
    reg [1:0] pst, nst;
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            pst <= IDLE;
        end else begin
            pst <= nst;
        end
    end
    
    always @ (*) begin
        case(pst)
         
            IDLE: begin
                if(start == 1'b1) begin
                    nst = LOAD;
                end else begin
                    nst = IDLE;
                end
            end
            
            LOAD: begin
                nst = ADD;
            end
            
            ADD: begin
                if(count_done == 1'b1) begin
                    nst = DONE;
                end else begin
                    nst = ADD;
                end
            end
            
            DONE: begin
                if(start == 1'b0) begin
                    nst = IDLE;
                end else begin
                    nst = DONE;
                end
            end
            
            default: begin
                nst = IDLE;
            end
        endcase
    end
    
    always @ (*) begin
        load = 1'b0;    shift = 1'b0;   count_en = 1'b0;    done = 1'b0;
        
        case(pst)
            IDLE: begin             
            end
            
            LOAD: begin
                load = 1'b1;
            end
            
            ADD: begin
                shift = 1'b1;
                count_en = 1'b1;
            end 
            
            DONE: begin
                done = 1'b1;
            end
            
            default: begin
            end
        endcase
    end
endmodule
