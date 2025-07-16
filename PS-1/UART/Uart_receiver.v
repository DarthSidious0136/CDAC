`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 22:55:48
// Design Name: 
// Module Name: Uart_receiver
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


module Uart_receiver (
    input rx_clk,        // 16x baud rate clock
    input enable,        // Synchronous reset
    input RX,            // Serial input
    output reg [7:0] data_in,  // Received byte
    output reg done            // Done signal (1 cycle pulse)
);

    reg [3:0] sample_count = 0;     // Counts 0 to 15 for each bit
    reg [3:0] bit_index = 0;        // 0 to 7 for 8 data bits
    reg [7:0] rx_shift = 0;         // Shift register
    reg [1:0] state = 0;
    reg rx_sync = 1, rx_prev = 1;

    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam DONE  = 2'd3;

    always @(posedge rx_clk) begin
        if (enable) begin
            // Reset
            state <= IDLE;
            sample_count <= 0;
            bit_index <= 0;
            data_in <= 0;
            rx_shift <= 0;
            done <= 0;
            rx_sync <= 1;
            rx_prev <= 1;
        end else begin
            // 1-bit input synchronizer (optional but good practice)
            rx_prev <= rx_sync;
            rx_sync <= RX;
            done <= 0;

            case (state)
                IDLE: begin
                    if (rx_prev && !rx_sync) begin  // Falling edge (start bit detected)
                        state <= START;
                        sample_count <= 0;
                    end
                end

                START: begin
                    if (sample_count == 7) begin
                        if (!rx_sync) begin
                            sample_count <= 0;
                            bit_index <= 0;
                            state <= DATA;
                        end else begin
                            state <= IDLE;  // False start bit
                        end
                    end else begin
                        sample_count <= sample_count + 1;
                    end
                end

                DATA: begin
                    if (sample_count == 15) begin
                        rx_shift[bit_index] <= rx_sync;
                        bit_index <= bit_index + 1;
                        sample_count <= 0;

                        if (bit_index == 7)
                            state <= DONE;
                    end else begin
                        sample_count <= sample_count + 1;
                    end
                end

                DONE: begin
                    data_in <= rx_shift;
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule

