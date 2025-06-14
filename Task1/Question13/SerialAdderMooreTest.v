`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:10 06/14/2025
// Design Name:   SerialAdderMoore
// Module Name:   /home/aareen/CDAC/SerialAdderMooreTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SerialAdderMoore
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SerialAdderMooreTest;

	// Inputs
	reg a;
	reg b;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] q;
	wire y;

	// Instantiate the Unit Under Test (UUT)
	SerialAdderMoore uut (
		.a(a), 
		.b(b), 
		.reset(reset), 
		.q(q), 
		.y(y),
		.clk(clk)
	);
	initial begin
	clk=0;
	forever #5 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
		#23;
		a=1;
		b=0;
		#20;
		a=1;
		b=1;
		#20;
		a=0;
		b=1;
		#20;
		a=0;
		b=0;
		#30;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

