`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:41 06/15/2025 
// Design Name: 
// Module Name:    nonOverlappingMoore10011 
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
module nonOverlappingMoore10011(
    input clk,
    input reset,
    input din,
    output reg seq_detected
    );

  localparam S0 = 3'b000,
             S1 = 3'b001,
             S2 = 3'b010,
             S3 = 3'b011,
             S4 = 3'b100,
             S5 = 3'b101;

  reg [2:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      seq_detected <= 1'b0;
    end
    else begin
      case (state)
        S0: begin
          seq_detected <= 1'b0;
          if (din)
            state <= S1;
          else
            state <= S0;
        end

        S1: begin
          seq_detected <= 1'b0;
          if (~din)
            state <= S2;
          else
            state <= S1;
        end

        S2: begin
          seq_detected <= 1'b0;
          if (~din)
            state <= S3;
          else
            state <= S1;
        end

        S3: begin
          seq_detected <= 1'b0;
          if (din)
            state <= S4;
          else
            state <= S0;
        end

        S4: begin
          seq_detected <= 1'b0;
          if (din)
            state <= S5;
          else
            state <= S2;
        end

        S5: begin
          seq_detected <= 1'b1;
          if (din)
            state <= S1;
          else
            state <= S0;
        end

        default: begin
          state <= S0;
          seq_detected <= 1'b0;
        end
      endcase
    end
  end

endmodule
