`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module MealyOver10101(
input clk,
    input reset,
    input din,
    output reg seq_detected
    );
localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;
  reg [2:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      seq_detected <= 0;
    end else begin
      case (state)
        S0: begin
          seq_detected <= 0;
          state <= din ? S1 : S0;
        end
        S1: begin
          seq_detected <= 0;
          state <= din ? S1 : S2;
        end
        S2: begin
          seq_detected <= 0;
          state <= din ? S3 : S0;
        end
        S3: begin
          seq_detected <= 0;
          state <= din ? S1 : S4;
        end
        S4: begin
          seq_detected <= din ? 1'b1 : 1'b0;
          state <= din ? S3: S0;
        end
        default: begin
          state <= S0;
          seq_detected <= 0;
        end
      endcase
    end
  end


endmodule
