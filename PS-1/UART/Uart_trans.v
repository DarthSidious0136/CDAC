`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 20:47:55
// Design Name: 
// Module Name: Uart_trans
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Uart_trans(
    input tx_clk,
    input enable,
    input load_send,
    input [7:0] data_in,
    output reg TX,
    output reg done,
    output [9:0] outputframe,
    output [1:0] txstate
    );

    reg [1:0] state;
    reg [9:0] frame;
    reg [3:0] count;

    assign txstate = state;
    assign outputframe = frame;

    localparam idle_state = 2'd0;
    localparam send_state = 2'd1;
    localparam done_state = 2'd2;

    always @(posedge tx_clk) begin
        if (enable) begin
            // Asynchronous reset behavior
            state <= idle_state;
            TX <= 1;
            done <= 0;
            count <= 0;
            frame <= 10'b1111111111;
        end else begin
            case (state)
                idle_state: begin
                    TX <= 1;
                    done <= 0;
                    count <= 0;

                    if (load_send) begin
                        frame <= {1'b1, data_in, 1'b0}; // stop_bit | data | start_bit
                        state <= send_state;
                    end
                end

                send_state: begin
                    TX <= frame[0];              // Send LSB first
                    frame <= frame >> 1;         // Shift right to get next bit
                    count <= count + 1;

                    if (count == 9)
                        state <= done_state;
                end

                done_state: begin
                    TX <= 1;
                    done <= 1;
                    state <= idle_state;
                end

                default: begin
                    state <= idle_state;
                    TX <= 1;
                    done <= 0;
                end
            endcase
        end
    end
endmodule

