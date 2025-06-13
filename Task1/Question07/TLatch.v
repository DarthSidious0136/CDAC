`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:57:56 06/12/2025 
// Design Name: 
// Module Name:    TLatch 
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
module TLatch(
    input t,
    input en,
	 input reset,
    output reg q
    );
	 always @(en,t,reset)
	 begin
	 if(reset)
	 begin
	 q<=0;
	 end
	 
	 else if(en)
	  begin
		if(t)
			q<=~q;
		else
			q<=q;
		end
		else
		q<=q;
		
			
	 end


endmodule
