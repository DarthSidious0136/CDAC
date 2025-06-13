`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:07:19 06/13/2025
// Design Name:   rincounter
// Module Name:   /home/aareen/CDAC/ringCounterTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rincounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ringCounterTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	rincounter uut (
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);
	initial begin
	clk=0;
	forever #10 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		//clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		#50
		reset=1;
		#50
		reset=0;
		#50
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

