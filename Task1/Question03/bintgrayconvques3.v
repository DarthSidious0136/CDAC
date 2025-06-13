`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:29 06/12/2025 
// Design Name: 
// Module Name:    bintgrayconvques3 
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
module bintgrayconvques3(input [3:0]b,output [3:0]g
    );
	 assign g[3]=b[3];
	 assign g[2]=b[2]^b[3];
	 assign g[1]=b[1]^b[2];
	 assign g[0]=b[1]^b[0];
	
	

endmodule
