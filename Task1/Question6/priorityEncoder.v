`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:56 06/12/2025 
// Design Name: 
// Module Name:    priorityEncoder 
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
module priorityEncoder(
    input i0,
    input i1,
    input i2,
    input i3,
    output reg [1:0] y
    );
	 always @(*)
	 begin
		if(i3)
		y=3;
		else if(i2)
		y=2;
		else if(i1)
		y=1;
		else
		y=0;
	 end
	 


endmodule
