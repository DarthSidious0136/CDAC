`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:28 06/12/2025
// Design Name:   fulladder
// Module Name:   /home/aareen/CDAC/fulladdertest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fulladdertest;

	// Inputs
	reg cin;
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.cin(cin), 
		.a(a), 
		.b(b), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		cin = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1;
		$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		#10 a=0;b=1;cin=0;
		#1;
	$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		 #10 a=1;b=0;cin=0;  // Removed stray `
    #1;
    $display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		#10 a=1;b=1;cin=0;
		#1;
		$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		#10 a=0;b=0;cin=1;
		#1;
		$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		#10 a=1;b=0;cin=1;
		#1;
		$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);

		#10 a=1;b=1;cin=1;
		#1;
		$display ("a: %b | b: %b | cin: %b | sum: %b | cout: %b",a,b,cin,sum,cout);
		#10 $finish;
		
		

	end
      
endmodule

