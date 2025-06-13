`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:16 06/13/2025 
// Design Name: 
// Module Name:    SRusingtff 
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
module SRusingtff(
    input s,
    input r,
    output qsr,
    output qsrbar,
    input clr,
    input clk
);
    wire w1;
    assign w1 = (s & ~r & ~qsr) | (r & ~s & qsr);
    Tff tff1(w1, clr, clk, qsr, qsrbar);
endmodule


