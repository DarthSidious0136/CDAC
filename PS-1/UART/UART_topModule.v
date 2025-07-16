`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 16:42:26
// Design Name: 
// Module Name: UART_topModule
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


module UART_topModule(
    input clk_main,           // main system clock
    input reset,              // active high synchronous reset

    input [7:0] data_in_ext,  // external input to be transmitted
    input wr_en_ext,          // external write enable to TX FIFO
    input rd_en_ext,          // external read enable from RX FIFO
    input clk_ext,            // external clock for writing to TX FIFO and reading from RX FIFO
    
    input clk_ext_rd,
    //input tx_fifo_rd_en,
    
    input winc_rxFIFO,
    output [7:0] data_out_ext,// received data output
    output tx_line,
    output tx_done,
    output rx_done,
    output fifo_tx_full,
    output fifo_rx_empty,
    
    output [9:0]outputframe,
    output [7:0]tx_data_fifo_out_mon,
    output [1:0]txstate,
    output tx_fifo_empty_mon,
    output txclk_mon,
    
    output [7:0]data_rx_uart_mon,
    output wclk_mon
);

    wire txclk, rxclk, one_sec;
    wire [7:0] tx_data_fifo_out;
    wire [7:0] rx_data_fifo_in;
    wire [7:0] data_rx_uart;//goes from receiver to receiver  FIFO's input

    wire tx_fifo_rd_en;
    wire rx_fifo_wr_en;
    wire tx_fifo_empty;
    wire rx_fifo_full;
    //wire winc_rxFIFO;
    
    assign txclk_mon=txclk;
    assign tx_fifo_empty_mon=tx_fifo_empty;
    assign tx_data_fifo_out_mon=tx_data_fifo_out;
    // Baud generator
    Uart_Baud baud_gen (
        .clk(clk_main),
        .reset(reset),
        .txclk(txclk),
        .rxclk(rxclk),
        .one_sec(one_sec)
    );

    // UART Transmitter
    Uart_trans transmitter (
        .tx_clk(txclk),
        .enable(reset),//active high
        .load_send(!tx_fifo_empty),  // load only when FIFO has data
        .data_in(tx_data_fifo_out),
        .TX(tx_line),
        .done(tx_done),
        .outputframe(outputframe),
        .txstate(txstate)
    );

    // UART Receiver
    Uart_receiver receiver (
        .rx_clk(rxclk),
        .enable(reset),
        .RX(tx_line),
        .data_in(data_rx_uart),
        .done(rx_done)
    );

    // TX FIFO: external -> UART transmitter
    asynchFIFO #(.DSIZE(8), .ASIZE(4)) fifo_tx (
        .wdata(data_in_ext),
        .winc(wr_en_ext),
        .wclk(clk_ext),
        .wrst_n(~reset),

        .rdata(tx_data_fifo_out),
        .rinc(tx_fifo_rd_en),
        .rclk(txclk),
        .rrst_n(~reset),

        .rempty(tx_fifo_empty),
        .wfull(fifo_tx_full)
    );
    assign data_rx_uart_mon=data_rx_uart;
   //assign winc_rxFIFO= rx_done;
    assign tx_fifo_rd_en = !tx_fifo_empty && (transmitter.txstate == 2'b00); // when we're in idle state and our FIFO isn't empty only then we can load 

    assign wclk_mon=rxclk;
    // RX FIFO: UART receiver -> external
    asynchFIFO #(.DSIZE(8), .ASIZE(4)) fifo_rx (
        .wdata(data_rx_uart),
        .winc(winc_rxFIFO),//
        .wclk(rxclk),
        .wrst_n(~reset),

        .rdata(data_out_ext),
        .rinc(rd_en_ext),
        .rclk(clk_ext_rd),
        .rrst_n(~reset),

        .rempty(fifo_rx_empty),
        .wfull(rx_fifo_full)
    );

endmodule
