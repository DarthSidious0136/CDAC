`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 18:01:47
// Design Name: 
// Module Name: tb_spi_top
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


module tb_spi_top;
    reg [7:0] slave_datain;
    reg clk = 0;
    reg reset;
    reg cpol;
    reg cpha;
    reg [7:0] master_data;
    reg write_en;
    reg read_en;

    wire [7:0] master_miso_data;
    wire [7:0] slave_mosi_data;
    wire [7:0] slave_miso_data;
    wire [2:0] master_state;
    wire [1:0] slave_state;
    wire sclkm;
    spi_top DUT (
        .clk(clk),
        .reset(reset),
        .cpol(cpol),
        .cpha(cpha),
        .master_datain(master_data),
        .write_en(write_en),
        .read_en(read_en),
        .master_miso_data(master_miso_data),
        .slave_mosi_data(slave_mosi_data),
        .slave_miso_data(slave_miso_data),
        .master_state(master_state),
        .slave_state(slave_state),
        .sclkm(sclkm),
        .slave_datain(slave_datain)
    );

    // 50 MHz clock
    always #10 clk = ~clk;

    initial begin
        $dumpfile("spi.vcd");
        $dumpvars(0, tb_spi_top);

        // Initial setup
        reset = 1;
        cpol = 1;
        cpha = 0;
        master_data = 8'h3C;
        slave_datain=8'b11010101;
        write_en = 0;
        read_en = 0;

        #50 reset = 0;

        // Write from master -> slave
        #50 write_en = 1;
        read_en = 1;

       // #800 write_en = 0;
       // read_en = 0;

        #200;

        // Write new data from master
       // master_data = 8'hF0;
       // #40 write_en = 1;
       // read_en = 1;

        //#800// write_en = 0;
        //read_en = 0;

        #5500;
        master_data=8'b11011011;
        slave_datain=8'b00100100;
        #10000;
         $finish;
    end


endmodule
