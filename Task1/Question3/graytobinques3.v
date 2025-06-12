`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:11 06/12/2025 
// Design Name: 
// Module Name:    graytobinques3 
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
module graytobinques3(
    output [3:0] b,
    input [3:0] g
    );
	 assign b[0]=^g;
	 assign b[1]=g[1]^g[2]^g[3];
	 assign b[2]=g[2]^g[3];
	 assign b[3]=g[3];


endmodule
