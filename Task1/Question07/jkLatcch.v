`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:05 06/12/2025 
// Design Name: 
// Module Name:    jkLatcch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module jkLatcch(
    input j,
    input k,
	 input clk,
    output reg q,
    output reg qbar
    );
	always @(clk, j, k) begin
        if (clk) begin
            // Standard JK latch logic
            q    <= (j & ~q) | (~k & q);
            qbar <= ~q;
        end
        // Else: latch holds previous value (implicit in reg behavior)
    end
	

endmodule
