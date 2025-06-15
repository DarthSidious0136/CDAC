`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Mealy10011NonOverlapping(
    input clk,
    input reset,
    input din,
    output reg seq_detected
    );
localparam S0 = 3'b000,
             S1 = 3'b001,
             S2 = 3'b010,
             S3 = 3'b011,
             S4 = 3'b100;

  reg [2:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      seq_detected <= 1'b0;
    end else begin
      case (state)
        S0: begin
          if (din)
            state <= S1;
          else
            state <= S0;
          seq_detected <= 1'b0;
        end

        S1: begin
          if (~din)
            state <= S2;
          else
            state <= S1;
          seq_detected <= 1'b0;
        end

        S2: begin
          if (~din)
            state <= S3;
          else
            state <= S1;
          seq_detected <= 1'b0;
        end

        S3: begin
          if (din)
            state <= S4;
          else
            state <= S0;
          seq_detected <= 1'b0;
        end

        S4: begin
          if (din) begin
            seq_detected <= 1'b1;
            state <= S0;  
          end else begin
            seq_detected <= 1'b0;
            state <= S0;
          end
        end

        default: begin
          state <= S0;
          seq_detected <= 1'b0;
        end
      endcase
    end
  end

endmodule
