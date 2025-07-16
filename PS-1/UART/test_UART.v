`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 20:23:57
// Design Name: 
// Module Name: test_UART
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


module test_UART;

    // Inputs
    reg clk_main;
    reg reset;
    reg [7:0] data_in_ext;
    reg wr_en_ext;
    reg rd_en_ext;
    reg clk_ext;
    reg clk_ext_rd;
    reg winc_rxFIFO;
   // reg tx_fifo_rd_en;
    // Outputs
    wire [7:0] data_out_ext;
    wire tx_line;
    wire tx_done;
    wire rx_done;
    wire fifo_tx_full;
    wire fifo_rx_empty;
    wire [9:0]outputframe;
    
    wire [7:0]tx_data_fifo_out_mon;
    wire [1:0]txstate;
    wire tx_fifo_empty_mon;
    wire txclk_mon;
    wire [7:0]data_rx_uart_mon;
    wire rxclk_mon;

    // Instantiate the top module
    UART_topModule uut (
        .clk_main(clk_main),
        .reset(reset),
        .data_in_ext(data_in_ext),
        .wr_en_ext(wr_en_ext),
        .rd_en_ext(rd_en_ext),
        .clk_ext(clk_ext),
        
       .winc_rxFIFO(winc_rxFIFO),
       
       
       
        .data_out_ext(data_out_ext),
        .tx_line(tx_line),
        .tx_done(tx_done),
        .rx_done(rx_done),
        .fifo_tx_full(fifo_tx_full),
        .fifo_rx_empty(fifo_rx_empty),
        .outputframe(outputframe),
        
        .tx_data_fifo_out_mon(tx_data_fifo_out_mon),
        .txstate(txstate),
        .tx_fifo_empty_mon(tx_fifo_empty_mon),
        .txclk_mon(txclk_mon),
        .data_rx_uart_mon(data_rx_uart_mon),
        .wclk_mon(rxclk_mon),
        .clk_ext_rd(clk_ext_rd)
        //.tx_fifo_rd_en(tx_fifo_rd_en)
    );

    // Clock generation
    initial begin
        clk_main = 0;
        forever #10 clk_main = ~clk_main; // 50 MHz
    end
    initial begin
    clk_ext_rd=0;
    forever #900 clk_ext_rd=~clk_ext_rd;
    end
    initial begin
        clk_ext = 0;
        forever #25 clk_ext = ~clk_ext; // 20 MHz
    end

    // Initial setup
    initial begin
        reset = 1;
        data_in_ext = 8'b11010011;
        wr_en_ext = 0;//external write input to TX FIFO
        rd_en_ext = 0;
       winc_rxFIFO = 0;
       // tx_fifo_rd_en=0;
        #60;
        reset=0;
        
        wr_en_ext =1;
        #80;
        data_in_ext=8'b11110000;
        #120000;
        winc_rxFIFO=1;
        rd_en_ext=1;
        data_in_ext=8'b11110000;
        wr_en_ext=0;
        
        

        // No stimulus applied
        #500000 $finish;
    end

endmodule
