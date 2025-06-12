`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:32 06/12/2025 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
    input cin,
    input a,
    input b,
    output sum,
    output cout
    );
	 assign sum= (a^b) | (b^cin) | (a^cin);
	 assign cout = (a&b) | (a&cin)|( b&cin);


endmodule
