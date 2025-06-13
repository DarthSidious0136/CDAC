`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:26 06/13/2025 
// Design Name: 
// Module Name:    UniShiftReg 
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
module UniShiftReg(
    output reg[3:0] q,
    input serialright,
    input serialleft,
    input [3:0] in,
	 input clk,
	 input clr,
	 input [1:0]sel
    );
	 
	 always @(posedge clk)
	 begin
	 if(clr)
	 q=0;
	 else
		case(sel)
			2'b00:begin
					q<=q;
					end
			2'b01:begin///shift right
						q<={q[2:0],serialright};
						
					end
					
			2'b10: begin
					q<={serialleft,q[3:1]};
						end
			2'b11: begin//parallel load
						q<=in;
					 end
					 endcase
						
	 
	 
	 
	 end


endmodule
