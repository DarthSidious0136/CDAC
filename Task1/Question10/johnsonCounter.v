`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:10 06/13/2025 
// Design Name: 
// Module Name:    johnsonCounter 
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
module johnsonCounter(
    output reg [3:0] q,
    input reset,
    input clk
    );
	always @(posedge clk)
	begin
		if(reset)
		q<=0;
		else
		q<={q[2:0],~q[3]};
	end

endmodule
