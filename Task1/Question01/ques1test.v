`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:12:07 06/11/2025
// Design Name:   ques1
// Module Name:   /home/aareen/CDAC/ques1test.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ques1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ques1test;

	// Outputs
	wire outand,outnot1,outnot2,outor,outnand,outnor,outxor,outxnor,
	outand1,outor1,not1in1,not1in2,outnand1,outnor1,outxor1,outxnor1,
	outand2,outor2,not2in1,not2in2,outnand2,outnor2,outxor2,outxnor2;
	reg in1_tb,in2_tb;
	// Instantiate the Unit Under Test (UUT)
	ques1 uut (
		.in1(in1_tb),.in2(in2_tb),.outand(outand),.outor(outor),.notin1(outnot1),.notin2(outnot2),.outnand(outnand),.outnor(outnor),.outxor(outxor),.outxnor(outxnor),
		.outand1(outand1),.outand2(outand2),.outor1(outor1),.outor2(outor2),.outnand1(outnand1),.outnand2(outnand2),.outnor1(outnor1),.outnor2(outnor2),.outxor1(outxor1),.outxor2(outxor2),.outxnor1(outxnor1),.outxnor2(outxnor2),.notin11(not1in1),.notin21(not2in1),.notin12(not1in2),.notin22(not2in2)
	);
	initial 
	begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#5in1_tb<=0;in2_tb<=0;
		#5in1_tb<=1;in2_tb<=0;
		#5in1_tb<=0;in2_tb<=1;
		#5in1_tb<=1;in2_tb<=1;
		#5 $finish;
	end
      
endmodule

