`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:26:18 06/13/2025
// Design Name:   mod10asych
// Module Name:   /home/aareen/CDAC/mod10asynchTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod10asych
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mod10asynchTest;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	mod10asych uut (
		.reset(reset), 
		.clk(clk), 
		.q(q)
	);
	initial begin
	clk=0;
	forever #10 clk=~clk;
	end
	
	initial begin
		// Initialize Inputs
		reset = 1;
		//clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset=0;
		  #300;
		  reset=1;
		  #50;
		  reset=0;
		  #500;
		  $finish;
		  
		// Add stimulus here

	end
      
endmodule

