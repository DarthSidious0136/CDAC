`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:18 06/14/2025 
// Design Name: 
// Module Name:    SerialAdderMoore 
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
module SerialAdderMoore(
    input a,
    input b,
    input reset,
    output reg [1:0]q,
    output reg y,input clk
    );
	 reg [1:0]nxtq;
	 reg nxty;
	 always @(posedge clk)
	 begin
	 if(reset)
	 begin
	 q=0;
	 y=0;
	 end
	 
	 else
	 begin
	 q[0]<=(~a&~b&~q[1]&q[0])|(~a&~b&q[1]&~q[0])|(~a&b&~q[1]&~q[0])|(b&q[1]&q[0])|(q[0]&a&b)|(a&b&q[1])|(a&q[1]&q[0])|(a&~b&~q[1]&~q[0]);
	 q[1]<=(a&b)|(q[1]&q[0])|(b&q[0])|(b&q[1])|(a&q[0])|(a&q[1]);
	 y<=nxty;
	 end
	 
	 end
	 
	 always @(a,b,clk)
	 begin
	 nxtq[0]=(~a&~b&~q[1]&q[0])|(~a&~b&q[1]&~q[0])|(~a&b&~q[1]&~q[0])|(b&q[1]&q[0])|(q[0]&a&b)|(a&b&q[1])|(a&q[1]&q[0])|(a&~b&~q[1]&~q[0]);
	 nxtq[1]=(a&b)|(q[1]&q[0])|(b&q[0])|(b&q[1])|(a&q[0])|(a&q[1]);
	 nxty=nxtq[0];
	 end


endmodule
