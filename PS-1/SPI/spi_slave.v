`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 14:28:05
// Design Name: 
// Module Name: spi_slave
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


module spi_slave(
input clk,//slaves internal clock 
input sclk,//transmission or reception clock 
input ss,//when slave is selected it will start transmission or reception 
input write,//shorted to read signal of master
input read, //shorted to write signal of master 
input mosi,
input reset,
input cpol,
input cpha,
input [7:0]datain,



output reg miso,
output [1:0]statemon,
output [7:0]miso_data_mon,
output [7:0]mosi_data_mon

    );

wire wclk;//synchronizes write events
wire rclk;//synchronizes read events
reg transfer_done;    
reg [1:0]state;
reg [2:0]windex;
reg [2:0]rindex;
reg [7:0]miso_data;
reg [7:0]mosi_data;
    //states of receiver , idle (when ss is high ) , setup(when ss goes low for one clk signal), transfer, done
    localparam idle=0;
    localparam setup=1;
    localparam transfer=2;
    localparam done=3;
    
    assign wclk=(cpha^cpol)?sclk:~sclk;
    assign rclk=(cpha^cpol)?~sclk:sclk;
    
    
    assign mosi_data_mon=mosi_data;
    assign miso_data_mon=miso_data;
    assign statemon=state;
    
    
    
    //writes word to our internal shift register 
    always @(posedge clk)
    if(write && state==setup)begin
    miso_data<=datain;
    end
    
    //state machine logic 
    always @(posedge clk)
    begin
    if(reset)
    begin
    miso<=1'bz;
    state<=idle;
    windex<=0;
    rindex<=0;
    end
    else
    begin
    case (state)
    idle:begin
    if(~ss)
    begin
    state<=setup;
    end
    end 
    setup: begin
    windex<=0;
    rindex<=0;
    state<=transfer;
    end
    transfer: 
    if(transfer_done==1)
    state<=done;
    
    done:begin
    miso<=1'bz;
    state<=idle;
    transfer_done<=0;
    windex<=0;
    rindex<=0;
    end
    
    endcase
    end
   
    end
    //for writing
    always @(posedge wclk)
    begin
    if(~reset && write)
    begin
    if(windex<7)
    begin
    miso<=miso_data[7-windex];
    windex=windex+1;
    end
    else if(windex==7)
    begin
    miso<=miso_data[7-windex];
    //windex<=0;
    if(~(cpha^cpol) )
    transfer_done<=1;
    end
    end
    end
    
    //for reading
    always @(posedge rclk)
    begin
    if(~reset && read && (mosi==0 || mosi==1))
    begin
    if(rindex<7)
    begin
    mosi_data[7-rindex]<=mosi;
    rindex<=rindex+1;
    end
    else if(rindex==7)
    begin
    mosi_data[7-rindex]<=mosi;
    rindex<=0;
    if(cpha^cpol)
    transfer_done<=1;
    end
    end
    end
    
endmodule
