`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:10 06/12/2025
// Design Name:   fullSub
// Module Name:   /home/aareen/CDAC/fullsubtest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullSub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullsubtest;

	// Inputs
	reg a;
	reg b;
	reg Bin;

	// Outputs
	wire Bout;
	wire diff;

	// Instantiate the Unit Under Test (UUT)
	fullSub uut (
		.a(a), 
		.b(b), 
		.Bin(Bin), 
		.Bout(Bout), 
		.diff(diff)
	);
	integer i; 
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		Bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("a | b | Bin | diff | Bout | Expected diff | Expected Bout");
        
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, Bin} = i; // Assign 3-bit input from loop variable
            #10; // Wait for outputs to stabilize
            
            // Calculate expected values using the same logic as your code
            $display(
                "%b | %b |  %b  |  %b   |  %b  |       %b       |      %b",
                a, b, Bin, diff, Bout,
                Bin ^ (a ^ b),               // Expected diff
                (Bin & ~(a ^ b)) | (~a & b)  // Expected Bout
            );
        end
        $finish;

	end
      
endmodule

