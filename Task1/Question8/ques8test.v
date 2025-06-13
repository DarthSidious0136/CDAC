`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:52 06/13/2025
// Design Name:   Ques8ffs
// Module Name:   /home/aareen/CDAC/ques8test.v
// Project Name:  CDAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ques8ffs
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ques8test;

	// Inputs
	reg s;
	reg r;
	reg clk;
	
	reg d;
	
	reg j;
	reg k;
	
	reg t;
	reg tclr;
	// Outputs
	wire qsr;
	wire qsrbar;
	
	wire qd;
	wire qdbar;
	
	wire qjk;
	wire qjkbar;
	
	wire qt;
	wire qtbar;

	// Instantiate the Unit Under Test (UUT)
	Ques8ffs uut (
		.s(s), 
		.r(r), 
		.qsr(qsr), 
		.qsrbar(qsrbar), 
		.clk(clk),
		
		.d(d),
		.qd(qd),
		.qdbar(qdbar),
		
		.j(j),
		.k(k),
		.qjk(qjk),
		.qjkbar(qjkbar),
		
		
		.t(t),
		.tclr(tclr),
		.qt(qt),
		.qtbar(qtbar)
		
	);
	initial 
	begin
	#10;
	forever #10 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		s = 0;
		r = 0;
		clk = 0;
		tclr=1;
		d=0;
		
		j=1;
		k=0;
		
		t=0;
		// Wait 100 ns for global reset to finish
		#30;
		s<=1;
		r<=0;
		tclr<=0;
		
		d<=1;
		
		j<=0;
		k<=1;
		t<=1;
		
		#20;
		s<=0;
		r<=1;
		d<=1;
		
		j<=1;
		k<=1;
		t<=0;
		#20;
		s<=0;
		r<=0;
		t<=1;
		d<=0;
		j<=0;
		k<=0;
		#20;
		
		
      $finish;
		// Add stimulus here

	end
      
endmodule

