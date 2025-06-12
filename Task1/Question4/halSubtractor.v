`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:29 06/12/2025 
// Design Name: 
// Module Name:    halSubtractor 
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
module halSubtractor(
    input a,
    input b,
    output diff,
    output borrow
    );
	 assign diff=a^b;
	 assign borrow =(~a)&b;


endmodule
