`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:16 06/12/2025
// Design Name:   TLatch
// Module Name:   /home/aareen/CDAC/TLatchTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TLatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TLatchTest;

	// Inputs
	reg t;
	reg en;
	reg reset;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	TLatch uut (
		.t(t), 
		.en(en), 
		.reset(reset), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		t = 0;
		en = 0;
		reset = 0;
		#5;
		reset=1;//generating a pulse edge to reset the latch to  a valid initial state
		#10
		reset=0;
		en=1;
		

		// Wait 100 ns for global reset to finish
		#100;
        t=1;
		  #20;
		  t=1;
		  en=0;
		  #20
		  t=0;
		  #20
		  $finish;
		// Add stimulus here

	end
      
endmodule

