`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:23 06/14/2025
// Design Name:   SerialAdderMealy
// Module Name:   /home/aareen/CDAC/SerialAdderMealyTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SerialAdderMealy
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SerialAdderMealyTest;

	// Inputs
	reg a;
	reg b;
	reg reset;
	reg clk;

	// Outputs
	wire y;
	wire q;

	// Instantiate the Unit Under Test (UUT)
	SerialAdderMealy uut (
		.a(a), 
		.b(b), 
		.y(y), 
		.reset(reset), 
		.clk(clk),
		.q(q)
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
	//clk = 0;

		// Wait 100 ns for global reset to finish
		#30;
		reset=0;
		#22;
		a=1;
		b=1;
		#20;
		a=0;
		b=0;
		#10;
		a=1;
		#10;
		b=1;
		#20;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

