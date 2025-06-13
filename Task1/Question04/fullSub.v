`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:25 06/12/2025 
// Design Name: 
// Module Name:    fullSub 
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
module fullSub(
    input a,
    input b,
    input Bin,
    output Bout,
    output diff
    );
assign diff= Bin^(a^b);
assign Bout =Bin&(~(a^b))| (~a&b);

endmodule
