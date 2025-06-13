`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:42 06/13/2025
// Design Name:   syncMod10
// Module Name:   /home/aareen/CDAC/mod10syncTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: syncMod10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mod10syncTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	syncMod10 uut (
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);
	initial begin
	clk=0;
	forever#10 clk=~clk;
	end

	initial begin
		// Initialize Inputs
	//	clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		#150;
		reset=1;
		#30;
		reset=0;
		#50;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

