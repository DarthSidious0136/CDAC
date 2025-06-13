`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:13 06/12/2025
// Design Name:   SRLatch
// Module Name:   /home/aareen/CDAC/srtest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SRLatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module srtest;

	// Inputs
	reg s;
	reg r;
	reg en;

	// Outputs
	wire q;
	wire qbar;

	// Instantiate the Unit Under Test (UUT)
	SRLatch uut (
		.s(s), 
		.r(r), 
		.en(en), 
		.q(q), 
		.qbar(qbar)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		r = 1;
		en = 1;

		// Wait 100 ns for global reset to finish
		#50;
        
		  
		// Add stimulus here
		s<=0;r<=0;
		#30;
		s<=0;r<=1;
		#30;
		s<=1;r<=1;
		#30
		en=0;
		s<=1;r<=0;
		#30 $finish;
		

	end
	
      
endmodule

