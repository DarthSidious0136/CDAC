`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:37 06/14/2025 
// Design Name: 
// Module Name:    MooreSeqDet 
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
module MooreSeqDet(
    input x,
    input reset,
    output reg z,input clk,output reg [2:0]q,output reg znxt,output reg [2:0]qnxt
    );
	 
	 always @(posedge clk)
	 begin
	 if(reset)
	 begin
	 q=3'b000;
	 z=0;
	 end
	 else 
	 begin
	 q[2]=(x&q[1]&q[0])|((~q[0])&q[2]&x);
	 q[1]<=(~x)&(q[2]|(q[1]^q[0]));
	 q[0]<=((~q[1])&x)|(q[1]&(~q[0]));
	
	 z=znxt;
	 end
	 end
	 
	 
	always @(x,clk)
	 begin
	 qnxt[2]=(x&q[1]&q[0])|((~q[0])&q[2]&x);
	 qnxt[1]=(~x)&(q[2]|(q[1]^q[0]));
	 qnxt[0]=((~q[1])&x)|(q[1]&(~q[0]));
	 znxt=qnxt[2]&qnxt[0];
	 end
	 
	 

	
endmodule
