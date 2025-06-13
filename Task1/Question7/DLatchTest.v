`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:35 06/13/2025
// Design Name:   DLatch
// Module Name:   /home/aareen/CDAC/DLatchTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DLatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DLatchTest;

	// Inputs
	reg d;
	reg en;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	DLatch uut (
		.d(d), 
		.en(en), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		d = 0;
		en = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
		en=1;
		#10;
		d=1;
		#10;
		en=0;
		#10
		d=0;
		#10;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

