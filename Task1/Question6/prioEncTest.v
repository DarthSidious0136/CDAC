`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:56 06/12/2025
// Design Name:   priorityEncoder
// Module Name:   /home/aareen/CDAC/prioEncTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priorityEncoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prioEncTest;

	// Inputs
	reg i0;
	reg i1;
	reg i2;
	reg i3;

	// Outputs
	wire [1:0] y;

	// Instantiate the Unit Under Test (UUT)
	priorityEncoder uut (
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.y(y)
	);
	integer i;
	initial begin
		// Initialize Inputs
		i0 = 0;
		i1 = 0;
		i2 = 0;
		i3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10
		for(i=0;i<16;i=i+1)
		begin
		#10
		{i3,i2,i1,i0}=i;
		end
		
	
	end
      
endmodule

