`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 15:54:25
// Design Name: 
// Module Name: Uart_Baud
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



module Uart_Baud(
    input clk,
    input reset, // Synchronous reset
    output reg txclk,
    output reg rxclk,
    output reg one_sec
);

    parameter master_clock = 50_000_000;
    parameter baud_rate = 115200;

    reg [31:0] count_rx, count_tx, clock_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count_rx    <= 0;
            count_tx    <= 0;
            clock_count <= 0;
            txclk       <= 0;
            rxclk       <= 0;
            one_sec     <= 0;
        end else begin
            // RX Counter and Clock
            if (count_rx == ((master_clock/(baud_rate * 16)) - 1))
                count_rx <= 0;
            else
                count_rx <= count_rx + 1;

            // TX Counter and Clock
            if (count_tx == ((master_clock/baud_rate) - 1))
                count_tx <= 0;
            else
                count_tx <= count_tx + 1;

            // 1 Second Counter and Clock
            if (clock_count == (master_clock - 1))
                clock_count <= 0;
            else
                clock_count <= clock_count + 1;

            // Output Clocks
            txclk   <= (count_tx < ((master_clock/baud_rate)/2)) ? 1'b1 : 1'b0; // 50% duty cycle
            rxclk   <= (count_rx < (master_clock/(baud_rate * 32))) ? 1'b1 : 1'b0; // 50% duty cycle
            one_sec <= (clock_count < (master_clock/2)) ? 1'b1 : 1'b0; // 1 second clock
        end
    end

endmodule
