`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:52:55 06/12/2025
// Design Name:   halSubtractor
// Module Name:   /home/aareen/CDAC/halfSubTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halSubtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module halfSubTest;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	halSubtractor uut (
		.a(a), 
		.b(b), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("Testing Half Subtractor:");
        $display("a | b | diff | borrow | Expected diff | Expected borrow");
        
        a = 0; b = 0; #10;
        $display("%b | %b |  %b   |   %b    |       0       |        0", a, b, diff, borrow);
        
        a = 0; b = 1; #10;
        $display("%b | %b |  %b   |   %b    |       1       |        1", a, b, diff, borrow);
        
        a = 1; b = 0; #10;
        $display("%b | %b |  %b   |   %b    |       1       |        0", a, b, diff, borrow);
        
        a = 1; b = 1; #10;
        $display("%b | %b |  %b   |   %b    |       0       |        0", a, b, diff, borrow);
        
        $finish;

	end
      
endmodule

