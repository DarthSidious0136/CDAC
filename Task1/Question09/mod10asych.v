`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:45 06/13/2025 
// Design Name: 
// Module Name:    mod10asych 
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
module mod10asych(
    input reset,
    input clk,
    output reg [3:0] q
    );
	 always @(negedge clk or posedge reset)
	 begin
	 if(reset)
	 q[0]=0;
	 else 
	 q[0]=~q[0];
	 end
	 
	 
	 always @(negedge q[0] or posedge reset)
	 begin
	 if(reset)
	 q[1]=0;
	 else
	 q[1]=~q[1];
	 end
	 
	 always @(negedge q[1] or posedge reset)
	 begin
	 if(reset)
	 q[2]=0;
	 else
	 q[2]=~q[2];
	 end
	 
	 always @(negedge q[2] or posedge reset)
	 begin
	 if(reset)
	 q[3]=0;
	 else
	 q[3]=~q[3];
	 end

endmodule
