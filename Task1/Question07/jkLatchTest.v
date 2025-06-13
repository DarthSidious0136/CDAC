`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:42 06/12/2025
// Design Name:   jkLatcch
// Module Name:   /home/aareen/CDAC/jkLatchTest.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jkLatcch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jkLatchTest;

	// Inputs
	reg j;
	reg k;
	reg clk;

	// Outputs
	wire q;
	wire qbar;

	// Instantiate the Unit Under Test (UUT)
	jkLatcch uut (
		.j(j), 
		.k(k), 
		.clk(clk), 
		.q(q), 
		.qbar(qbar)
	);
	initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        j = 0;
        k = 0;

        // Test sequence
        // 1. Hold mode (J=0, K=0)
        $display("Testing Hold mode (J=0, K=0)");
        #20; // Wait for 2 clock cycles

        // 2. Set mode (J=1, K=0)
        j = 1; k = 0;
        $display("Testing Set mode (J=1, K=0)");
        #20;

        // 3. Reset mode (J=0, K=1)
        j = 0; k = 1;
        $display("Testing Reset mode (J=0, K=1)");
        #20;

        // 4. Toggle mode (J=1, K=1)
        j = 1; k = 1;
        $display("Testing Toggle mode (J=1, K=1)");
        #20;

        // 5. Hold mode again (J=0, K=0)
        j = 0; k = 0;
        $display("Testing Hold mode again (J=0, K=0)");
        #20;

        // End simulation
        $display("Simulation completed.");
        $finish;
    end

    // Optional: Monitor outputs for all time
    initial begin
        $monitor("Time=%0t: clk=%b, j=%b, k=%b, q=%b, qbar=%b",
                 $time, clk, j, k, q, qbar);
    end

      
endmodule

