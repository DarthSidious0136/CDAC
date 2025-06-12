`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:45 06/11/2025
// Design Name:   thirtoone
// Module Name:   /home/aareen/CDAC/thirtoonetest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: thirtoone
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module thirtoonetest;

	// Inputs
	reg i1;
	reg i2;
	reg i3;
	reg i4;
	reg i5;
	reg i6;
	reg i7;
	reg i8;
	reg i9;
	reg i10;
	reg i11;
	reg i12;
	reg i13;
	reg [3:0] select;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	thirtoone uut (
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.i4(i4), 
		.i5(i5), 
		.i6(i6), 
		.i7(i7), 
		.i8(i8), 
		.i9(i9), 
		.i10(i10), 
		.i11(i11), 
		.i12(i12), 
		.i13(i13), 
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
		i8 = 0;
		i9 = 0;
		i10 = 0;
		i11 = 0;
		i12 = 0;
		i13 = 0;
		select = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 i1=1;i2=0;i3=0;i4=1;i5=0;i6=1;i7=1;i8=0;i9=0;i10=1;i11=0;i12=1;i13=0;
		#10 select=1;
		#10 select=0;
		#10 select=3;
		#10 select =2;
		#10 select=4;
		#10 select=5;
		#10 select=6;
		#10 select=7;
		#10 select=8;
		#10 select=9;
		#10 select=10;
		#10 select=11;
		#10 select=12;
		#10 select=13;
		#10 $finish ;
	end
      
endmodule

