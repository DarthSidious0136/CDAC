`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:59:34 06/21/2025
// Design Name:   fifoSync
// Module Name:   /home/aareen/CDAC/Task2/fifoSync_tb.v
// Project Name:  Task2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifoSync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifoSync_tb;

	// Inputs
	reg reset;
	reg clk;
	reg rd;
	reg wr;
	reg [7:0] w_data;

	// Outputs
	wire empty;
	wire full;
	wire [7:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	fifoSync uut (
		.reset(reset), 
		.clk(clk), 
		.rd(rd), 
		.wr(wr), 
		.w_data(w_data), 
		.empty(empty), 
		.full(full), 
		.r_data(r_data)
	);
	integer i;
	integer seed =1;
	initial begin
	clk=0;
	forever #10 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		reset = 1;
		//clk = 0;
		rd = 0;
		wr = 0;
		w_data = 0;
		
		#10 reset=0;
		rd=0;
		wr=1;
		#12;
		 for (i = 0; i < 17; i = i + 1) begin
            w_data = $random(seed) % 256;
           #20;
        end
			
	
		#10;
		rd=1;
		wr=1;
		
		 for (i = 0; i < 10; i = i + 1) begin
            w_data = $random(seed) % 256;
           #40;
        end
		  
		  wr=0;
		  rd=1;
		  #10;
		  for (i = 0; i < 10; i = i + 1) begin
            w_data = $random(seed) % 256;
           #20;
        end
		  #10;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

