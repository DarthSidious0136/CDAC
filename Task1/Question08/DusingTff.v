`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:16 06/13/2025 
// Design Name: 
// Module Name:    DusingTff 
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
module DusingTff(
    input d,
    input clk,
    input reset,
    output qd,
    output qdbar
);
    
    wire t_in = d ^ qd;

    
    Tff tff_inst(t_in,reset,clk,qd,qdbar);
endmodule

