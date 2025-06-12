`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:33:01 06/12/2025
// Design Name:   graytobinques3
// Module Name:   /home/aareen/CDAC/gtobques3test.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: graytobinques3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gtobques3test;

	// Inputs
	//reg [3:0] g;
	reg [3:0] bin;

	// Outputs
	wire [3:0] b;
	wire [3:0]gray;

	// Instantiate the Unit Under Test (UUT)
	graytobinques3 uut (
		.b(b), 
		.g(gray)
	);
	
	bintgrayconvques3 uut2(.b(bin),.g(gray));

	initial begin
		// Initialize Inputs
		bin = 0;
		#10;

		// Wait 100 ns for global reset to finish
	
		for(bin=0;bin<16;bin=bin+1)
		begin
		#10;
		if(bin!=b)
		$display("Mismatch  at gray =%4b, b =%4b | Expected : %4b",gray,b,bin);
		else
		$display("Gray Code : %4b  | Binary Code : %4b",gray,b);
		end
		
        
		// Add stimulus here
		end
		

	
      
endmodule

