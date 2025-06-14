`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:48 06/14/2025 
// Design Name: 
// Module Name:    SerialAdderMealy 
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
module SerialAdderMealy(
    input a,
    input b,
    output reg y,
    input reset,
	 input clk
	 ,output reg q
    );
	 //reg q;//state of the adder ,i.e. whether carry is 0 or 1
	always @(posedge clk)
	begin
	if(reset)
	y=0;
	else
	begin
	if(q)
		begin
		case ({a,b})
		2'b00:begin
			q=0;
			y=1;
			end
		2'b01:begin
			q=1;
			y=0;
			end
		2'b10:begin
			q=1;
			y=0;
			end
		2'b11:begin
			q=1;
			y=1;
			end
			
			endcase
		end
	
	else
	begin
		case({a,b})
		2'b00:begin
				q=0;
				y=0;			
				end
		2'b01:begin
				q=0;
				y=1;
				end
		2'b10: begin
					q=0;
					y=1;
					end
		2'b11: begin
			q=1;
			y=0;
		end
		endcase
	end
	end
	
	end

endmodule
