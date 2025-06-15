`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:22:22 06/15/2025
// Design Name:   mooreover10011
// Module Name:   /home/aareen/CDAC/moore10011Test.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mooreover10011
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module moore10011Test;

	// Inputs
	reg clk;
	reg reset;
	reg din;

	// Outputs
	wire seq_detected;

	// Instantiate the Unit Under Test (UUT)
	mooreover10011 uut (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.seq_detected(seq_detected)
	);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  
  initial begin
    reset = 1;
    din = 0;
    #12;         
    reset = 0;

    din = 1; #10;
    din = 0; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 1; #10;

    #20; 
    $stop;
  end
      
endmodule

