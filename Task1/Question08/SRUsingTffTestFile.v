`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:22 06/13/2025
// Design Name:   SRusingtff
// Module Name:   /home/aareen/CDAC/SRUsingTffTestFile.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SRusingtff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SRUsingTffTestFile;

	// Inputs
	reg s;
	reg r;
	reg clr;
	reg clk;

	// Outputs
	wire qsr;
	wire qsrbar;

	// Instantiate the Unit Under Test (UUT)
	SRusingtff uut (
		.s(s), 
		.r(r), 
		.qsr(qsr), 
		.qsrbar(qsrbar), 
		.clr(clr), 
		.clk(clk)
	);
	initial 
	begin
	clk=0;
	forever #10 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		s = 0;
		r = 0;
		//clr = 0;
		clr=1;
		

		// Wait 100 ns for global reset to finish
		#50;
		clr=0;
		#50;
		s=1;
		r=0;
		#30
		s=1;
		r=0;
		#40;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

