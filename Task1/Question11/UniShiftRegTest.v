`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:59:49 06/13/2025
// Design Name:   UniShiftReg
// Module Name:   /home/aareen/CDAC/UniShiftRegTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UniShiftReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UniShiftRegTest;

	// Inputs
	reg serialright;
	reg serialleft;
	reg [3:0] in;
	reg clk;
	reg clr;
	reg [1:0] sel;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	UniShiftReg uut (
		.q(q), 
		.serialright(serialright), 
		.serialleft(serialleft), 
		.in(in), 
		.clk(clk), 
		.clr(clr), 
		.sel(sel)
	);
	initial 
	begin
	clk=0;
	forever #10 clk=~clk;
	
	end

	initial begin
		// Initialize Inputs
		serialright = 0;
		serialleft = 0;
		in = 0;
		clk = 0;
		clr = 1;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#60;
		clr=0;
		sel<=3;
		in<=4'b0110;
		#20;
		serialright=1;
		sel=1;
		#60;
		sel=0;
		#40;
		clr=1;
		#20
		clr=0;
		#30
		sel=2;
		serialleft=1;
		#90;
		sel=0;
		#50;
		
		
		
		$finish;
        
		// Add stimulus here

	end
      
endmodule

