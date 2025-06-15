`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:05 06/11/2025 
// Design Name: 
// Module Name:    ques1 
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
module ques1(

input in1,input in2,
//gate level outputs
output outand, output outor,output outxor,output outnand,output outnor,output outxnor,output notin1,output notin2,
output outand1, output outor1,output outxor1,output outnand1,output outnor1,output outxnor1,output notin11,output notin21,
output reg outand2, output reg outor2,output reg outxor2,output reg outnand2,output reg outnor2,output reg outxnor2,output reg notin12,output reg notin22

    );
	 /////////////Gate level modelling////////////
	 and(outand,in1,in2);
	 or(outor,in1,in2);
	 nand(outnand,in1,in2);
	 nor(outnor,in1,in2);
	 xor(outxor,in1,in2);
	 xnor(outxnor,in1,in2);
	 not(notin1,in1);
	 not(notin2,in2);
	 
	 ////////// Dataflow modelling ///////////////////
	 assign outand1=in1&in2;
	 assign outor1=in1|in2;
	 assign notin11=~in1;
	 assign notin21=~in2;
	 assign outnand1=~(in1&in2);
	 assign outnor1=~(in1|in2);
	 assign outxor1=in1^in2;
	 assign outxnor1=~(in1^in2);
	 
	 /////////Behavioral modelling///////////////////
	 always @(*)
	 begin
	 outand2=in1&in2;
	 outor2=in1|in2;
	 notin12=~in1;
	 notin22=~in2;
	 outnand2=~(in1&in2);
	 outnor2=~(in1&in2);
	 outxor2=in1^in2;
	 outxnor2=~(in1^in2);
	 end
	 


endmodule
