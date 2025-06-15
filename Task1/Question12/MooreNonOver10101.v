`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:15 06/15/2025 
// Design Name: 
// Module Name:    MooreNonOver10101 
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
module MooreNonOver10101(
input clk,
    input reset,
    input din,
    output reg seq_detected
    );
	 localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5;
  reg [2:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      seq_detected <= 0;
    end else begin
      case (state)
        S0: state <= din ? S1 : S0;
        S1: state <= din ? S1 : S2;
        S2: state <= din ? S3 : S0;
        S3: state <= din ? S1 : S4;
        S4: state <= din ? S5 : S0;
        S5: state <= S0;  // Reset after detection (non-overlap)
        default: state <= S0;
      endcase

      seq_detected <= (state == S5);
    end
  end


endmodule
