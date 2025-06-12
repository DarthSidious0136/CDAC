`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:41 06/11/2025
// Design Name:   seventoone
// Module Name:   /home/aareen/CDAC/seventoonetest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seventoone
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seventoonetest;

	// Inputs
	reg i1;
	reg i2;
	reg i3;
	reg i4;
	reg i5;
	reg i6;
	reg i7;
	reg [2:0] select;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	seventoone uut (
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.i4(i4), 
		.i5(i5), 
		.i6(i6), 
		.i7(i7), 
		.select(select), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		i1 = 0;
		i2 = 0;
		i3 = 0;
		i4 = 0;
		i5 = 0;
		i6 = 0;
		i7 = 0;
		select = 1;

		// Wait 100 ns for global reset to finish
		#100;
		#10 i1=0;i2=1;i3=0;i4=1;i5=0;i6=1;i7=1;
		//#10 select=0;
		#10 select=1;
		#10 select =2;
		#10 select=3;
		#10 select=4;
		#10 select =5;
		#10 select=6;
		#10 select=7;
		#10 $finish;
		
		
		
		
		
		
		
       
		 
		// Add stimulus here

	end
      
endmodule

