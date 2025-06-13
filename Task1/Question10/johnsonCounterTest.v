`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:57 06/13/2025
// Design Name:   johnsonCounter
// Module Name:   /home/aareen/CDAC/johnsonCounterTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: johnsonCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module johnsonCounterTest;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	johnsonCounter uut (
		.q(q), 
		.reset(reset), 
		.clk(clk)
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
		  #150;
		  reset=1;
		  #30;
			reset=0;
			#200;
			$finish;
		// Add stimulus here

	end
      
endmodule

