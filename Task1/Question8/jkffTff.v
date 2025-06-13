`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:25 06/13/2025 
// Design Name: 
// Module Name:    jkffTff 
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
module jkffTff(
    input j,
    input k,
    input reset,
    input clk,
    output qjk,
    output qjkbar
    );
	 
	 wire w3=(j&(~qjk))|(qjk&k);
	Tff t3(w3,reset,clk,qjk,qjkbar);

endmodule


