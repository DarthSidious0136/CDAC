`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:08:00 06/12/2025
// Design Name:   halfadder
// Module Name:   /home/aareen/CDAC/haddertest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module haddertest;

	// Inputs
	reg a;
	reg b;

	// Instantiate the Unit Under Test (UUT)
	halfadder uut (
		.a(a), 
		.b(b),
		.sum(sum),
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a=0;b=0;
		#1;
		$display("a : %b|b : %b | sum : %b |carry : %b",a,b,sum,carry);
		#10;
		a=1;b=0;
		#1;
		$display("a : %b|b : %b | sum : %b |carry : %b",a,b,sum,carry);
		#10;
		a=0;b=1;
		#1;
		$display("a : %b|b : %b | sum : %b |carry : %b",a,b,sum,carry);
		#10
		a=1;b=1;
		#1;
		$display("a : %b|b : %b | sum : %b |carry : %b",a,b,sum,carry);
		#100 $finish;
	end
      
endmodule

