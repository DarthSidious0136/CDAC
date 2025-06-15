`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:48:02 06/15/2025
// Design Name:   MealyNonOver10101
// Module Name:   /home/aareen/CDAC/mealyNonover10101.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MealyNonOver10101
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mealyNonover10101;

	// Inputs
	reg clk;
	reg reset;
	reg din;

	// Outputs
	wire seq_detected;

	// Instantiate the Unit Under Test (UUT)
	MealyNonOver10101 uut (
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
    #10 reset = 0;
#2;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
	 din = 0; #10;
	 din = 1;

    #20;
  end
      
endmodule

