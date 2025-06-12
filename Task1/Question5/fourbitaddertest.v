`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:12 06/12/2025
// Design Name:   fourbitfulladder
// Module Name:   /home/aareen/CDAC/fourbitaddertest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fourbitfulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fourbitaddertest;

	// Inputs
	reg cin;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire cout;
	wire [3:0] sum;

	// Instantiate the Unit Under Test (UUT)
	fourbitfulladder uut (
		.cin(cin), 
		.a(a), 
		.b(b), 
		.cout(cout), 
		.sum(sum)
	);
	integer i,j;
	initial begin
		// Initialize Inputs
		cin = 0;
		a = 0;
		b = 0;
			i=0;
		// Wait 100 ns for global reset to finish
		
		 #1
		// Add stimulus here
		for(i=0;i<16;i=i+1)
		begin
		a=i;
			for(j=0;j<16;j=j+1)
			begin
			   b=j;
				#10;
				$display("a: %4b , b: %4b, sum : %4b , cout : %b ",a,b,sum,cout);
				
			end
			
		end
		
		#10;
		cin=1;
		for(i=0;i<16;i=i+1)
		begin
		a=i;
			for(j=0;j<16;j=j+1)
			begin
			   b=j;
				#10;
				$display("a: %4b , b: %4b, sum : %4b , cout : %b ",a,b,sum,cout);
				
			end
			
		end
		
	end
      
endmodule

