`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:10 06/12/2025 
// Design Name: 
// Module Name:    fourbitfulladder 
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
module fourbitfulladder(
    input cin,
    input [3:0] a,
    input [3:0] b,
    output cout,
    output [3:0] sum
    );
	 wire w1,w2,w3;
	 fulladder fa0(cin,a[0],b[0],sum[0],w1);
	 fulladder fa1(w1,a[1],b[1],sum[1],w2);
	 fulladder fa2(w2,a[2],b[2],sum[2],w3);
	 fulladder fa3(w3,a[3],b[3],sum[3],cout);


endmodule
