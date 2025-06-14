`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:39 06/14/2025 
// Design Name: 
// Module Name:    MealySeqDet 
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
module MealySeqDet(
    input clk,
    input x,
    input reset,
    output reg z,
	 output reg [2:0]q
    );
	always @(posedge clk)
	begin
	if(reset) begin
	z=0;
	q=0;
	end
	else
	q[2]<=q[1]&q[0]&x;
	q[1]<=((~x)&(~q[1])&q[0])|((~x)&q[1]&(~q[0]))|((~x)&q[2]);
	q[0]<=((~q[0])&q[1])|((~q[0])&(~q[1])&x);
	z<=x&q[2];
	end

endmodule
