`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 18:00:27
// Design Name: 
// Module Name: spi_top
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


module spi_top(
    input clk,
    input reset,
    input cpol,
    input cpha,
    input [7:0] slave_datain,
    input [7:0] master_datain,
    input write_en,
    input read_en,
    output [7:0] master_miso_data,
    output [7:0] slave_mosi_data,
    output [7:0] slave_miso_data,
    output [2:0] master_state,
    output [1:0] slave_state,
    
    output sclkm
);
   
    wire sclk;
    wire mosi;
    wire miso;
    wire ss;
assign sclkm=sclk;
    spi_master master_inst (
        .clk(clk),
        .cpol(cpol),
        .cpha(cpha),
        .miso(miso),
        .datain(master_datain),
        .read(read_en),
        .write(write_en),
        .reset(reset),
        .sclk(sclk),
        .mosi(mosi),
        .ss(ss),
        .stateout(master_state),
        .miso_dataout(master_miso_data)
        
    );

    spi_slave slave_inst (
        .clk(clk),
        .sclk(sclk),
        .ss(ss),
        .write(read_en),  // master's read = slave's write
        .read(write_en),  // master's write = slave's read
        .mosi(mosi),
        .reset(reset),
        .cpol(cpol),
        .cpha(cpha),
        .datain(slave_datain), // Slave's own data to send
        .miso(miso),
        .statemon(slave_state),
        .miso_data_mon(slave_miso_data),
        .mosi_data_mon(slave_mosi_data)
       
    );



endmodule
