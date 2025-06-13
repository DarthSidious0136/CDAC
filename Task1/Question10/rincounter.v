`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:32 06/13/2025 
// Design Name: 
// Module Name:    rincounter 
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
module rincounter(
    input clk,
    input reset,
    output reg [3:0] q
    );
	 always @(posedge clk)
	 begin
	 if(reset)
	 q=1;
	 else
	 begin
	 q[0]<=q[3];
	 q[1]<=q[0];
	 q[2]<=q[1];
	 q[3]<=q[2];
	 end
	 
	 end


endmodule
