`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:08 06/13/2025 
// Design Name: 
// Module Name:    Ques8ffs 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Ques8ffs(input s,input r,output reg qsr,output reg qsrbar,input clk,
input d,output reg qd, output reg qdbar,
input j,input k,output reg qjk,output reg qjkbar,
input t,output reg qt,output reg qtbar,input tclr
    );
	 //////////////SR Flip Flop//////////////////////
	 always @(posedge clk)
	 begin
	 qsr=s|((~r)&qsr);
	 qsrbar=~qsr;
	  end
	  
	  ///////////D Flip Flop//////////////////////////
	  always @(posedge clk)
	  begin
	  qd=d;
	  qdbar=~qd;
	  end
	  
	  ///////////JK FlipFlop////////////////////////
	  always @(posedge clk)
	  begin
	  qjk=(j&(qjkbar))|((~k)&qjk);
	  qjkbar=~qjk;
	  
	  
	  end
	  
	  ////////T Flip Flop////////////////////
	  always @(posedge clk)
	  begin
	  if(tclr)
		begin
		qt=0;
		qtbar=1;
		end
		else begin
	  qt=t^qt;
	  qtbar=~qt;
	  end
	  end


endmodule
