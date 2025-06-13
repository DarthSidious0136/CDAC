`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:47 06/13/2025 
// Design Name: 
// Module Name:    ModellingUsingTff 
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
module Tff(
    input t,
    input reset,
    input clk,
    output reg qt,
    output reg qtbar
);
reg next_qt;
    always @(posedge clk) begin
        if (reset) begin
            qt <= 0;
            qtbar <= 1;
        end
        else begin
				next_qt=t^qt;
            qt <= next_qt;
            qtbar <=~next_qt; 
        end
    end
endmodule



