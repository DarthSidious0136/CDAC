`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:02 06/13/2025 
// Design Name: 
// Module Name:    syncMod10 
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
module syncMod10(
    input clk,input reset ,
    output reg [3:0] q
    );
	always @(posedge clk)
	begin
	if(reset)
	q=0;
	else
	q=(q+1)%10;
	end

endmodule
