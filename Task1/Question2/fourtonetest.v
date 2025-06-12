`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:44 06/11/2025
// Design Name:   ques2
// Module Name:   /home/aareen/CDAC/fourtonetest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ques2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fourtonetest;

	// Inputs
	reg i0;
	reg i1;
	reg i2;
	reg i3;
	reg [1:0] select;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	ques2 uut (
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.select(select), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		i0 = 0;
		i1 = 0;
		i2 = 0;
		i3 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		#5 i0=1;i1=0;i2=0;i3=0;select=0;
		#5 i0=0;i1=1;i2=0;i3=0;
		#5 select=1;
		#5 i0=0;i1=0;i2=1;i3=0;
		#5 select=2;
		#5 i0=0;i1=0;i2=0;i3=1;
		#5 select=3;
	//	#5 $finish;
		

	end
      
endmodule

