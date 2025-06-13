`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:14 06/12/2025
// Design Name:   bintgrayconvques3
// Module Name:   /home/aareen/CDAC/testbintog.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bintgrayconvques3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbintog;

	// Inputs
	reg [3:0] b;

	// Outputs
	wire [3:0] g;

	// Instantiate the Unit Under Test (UUT)
	bintgrayconvques3 uut (
		.b(b), 
		.g(g)
	);

	initial begin
		// Initialize Inputs
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		end
        
		// Add stimulus here
		always #10 b=b+1;
		
		always @(b)
		begin
		#1;
		$display(" Input (bin): %4b | Output (gray): %4b | Expected : %4b",b,g,{b[3],b[3]^b[2],b[1]^b[2],b[1]^b[0]});
		end	

	
      
endmodule

