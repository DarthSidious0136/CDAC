`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:34 06/13/2025
// Design Name:   jkffTff
// Module Name:   /home/aareen/CDAC/jkfftfftest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jkffTff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jkfftfftest;

	// Inputs
	reg j;
	reg k;
	reg reset;
	reg clk;

	// Outputs
	wire qjk;
	wire qjkbar;

	// Instantiate the Unit Under Test (UUT)
	jkffTff uut (
		.j(j), 
		.k(k), 
		.reset(reset), 
		.clk(clk), 
		.qjk(qjk), 
		.qjkbar(qjkbar)
	);
	initial 
	begin
	clk=0;
	forever #10 clk=~clk;
	end
	
	
	initial begin
		// Initialize Inputs
		j = 0;
		k = 0;
		reset = 1;
		#20

		// Wait 100 ns for global reset to finish
		reset=0;
		j=0;
		k=1;
		#30;
		j=1;
		k=0;
		#30;
		j=1;
		k=1;
		#20;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

