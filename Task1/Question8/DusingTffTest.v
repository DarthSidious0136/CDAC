`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:57 06/13/2025
// Design Name:   DusingTff
// Module Name:   /home/aareen/CDAC/DusingTffTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DusingTff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DusingTffTest;

	// Inputs
	reg d;
	reg clk;
	reg reset;

	// Outputs
	wire qd;
	wire qdbar;

	// Instantiate the Unit Under Test (UUT)
	DusingTff uut (
		.d(d), 
		.clk(clk), 
		.reset(reset), 
		.qd(qd), 
		.qdbar(qdbar)
	);
	initial 
	begin
	clk=0;
	#1;
	forever #10 clk=~clk;
	end

	initial begin
        // Initialize inputs
        d = 0;
        reset = 1;

        // Apply reset for 1 clock cycle
        #20 reset = 0; // Deassert reset at 20

        // Test case 1: d=1 (after reset)
        @(posedge clk); // Wait for next clock edge (time 30)
        d = 1;
        
        // Test case 2: d=0
        @(posedge clk); // Wait for next clock edge (time 50)
        d = 0;

        // Test case 3: Re-apply reset
        @(posedge clk); // Time 70
        //reset = 1;
        #20 reset = 0; // Release reset at 90

        // Test case 4: d=1 after reset
        @(posedge clk); // Time 90
        d = 1;

        // End simulation
        #200 $finish; // Time 110

	end
      
endmodule

