`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:37 06/14/2025
// Design Name:   fourbitfulladderNonRipple
// Module Name:   /home/aareen/CDAC/foubitadderNonRippleTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fourbitfulladderNonRipple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module foubitadderNonRippleTest;

	// Outputs
	reg [3:0] a, b;
    reg cin;
wire [3:0] sum;
    wire cout;

	// Instantiate the Unit Under Test (UUT)
	fourbitfulladderNonRipple uut (
		.a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		//#100;
		 $monitor("Time=%0t: a=%d, b=%d, cin=%b → sum=%d, cout=%b", 
                 $time, a, b, cin, sum, cout);
        
        a = 4'b0011; b = 4'b0010; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1000; b = 4'b1000; cin = 1; #10;
        
        $finish;
        
		// Add stimulus here

	end
      
endmodule

