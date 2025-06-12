`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:46 06/12/2025 
// Design Name: 
// Module Name:    SRLatch 
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
module SRLatch(
    input s,
    input r,
	 input en,
    output reg q,
    output reg qbar
    );
	always @(*)
	begin
		if(en)
		begin
		case ({s,r})
		00:begin
			q<=q;
			qbar<=qbar;
		end
		01:begin
		q<=0;
		qbar<=1;
		end
		10: begin
			q<=1;
			qbar<=0;
			end
		11: begin
		q<=0;
		qbar<=0;
				end
		endcase
		end
		else
		begin
			q<=q;
			qbar<=qbar;
		end
				
			
		
		
	end

endmodule
