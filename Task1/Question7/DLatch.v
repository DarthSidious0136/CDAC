`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:12 06/13/2025 
// Design Name: 
// Module Name:    DLatch 
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
module DLatch(
    input d,
    input en,
    output reg q
    );
	 always @(en,d)
	 begin
		if(en)
			q=d;
	 end


endmodule
