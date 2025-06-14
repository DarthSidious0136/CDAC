`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:37 06/14/2025
// Design Name:   MealySeqDet
// Module Name:   /home/aareen/CDAC/MealySeqDetTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MealySeqDet
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MealySeqDetTest;

	// Inputs
	reg clk;
	reg x;
	reg reset;

	// Outputs
	wire z;
	wire [2:0] q;

	// Instantiate the Unit Under Test (UUT)
	MealySeqDet uut (
		.clk(clk), 
		.x(x), 
		.reset(reset), 
		.z(z), 
		.q(q)
	);
	initial
   begin	
	clk=0;
	forever #5 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		x = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
		#23;
		x=1;
		#10;
		x=0;
		#20;
		x=1;
		#30;
		$finish;
		
       
		// Add stimulus here

	end
      
endmodule

