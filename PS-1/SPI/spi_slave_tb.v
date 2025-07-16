`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 15:04:10
// Design Name: 
// Module Name: spi_slave_tb
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


module spi_slave_tb;
reg clk;
reg sclk;
reg read;
reg write;
reg mosi;
reg ss;
reg reset;
reg [7:0]datain;
reg cpha;
reg cpol;

//outputs
wire [7:0]mosi_data_mon;
wire [7:0]miso_data_mon;
wire miso;
wire [1:0]statemon;
spi_slave uut(.clk(clk),
.sclk(sclk),
.read(read),
.write(write),
.mosi(mosi),
.ss(ss),
.reset(reset),
.datain(datain),
.miso(miso),
.statemon(statemon),
.miso_data_mon(miso_data_mon),
.mosi_data_mon(mosi_data_mon),
.cpol(cpol),
.cpha(cpha)
);

initial begin
clk<=0;
forever #10 clk<=~clk;
end

initial begin
sclk<=0;
forever #40 sclk<=~sclk;
end

initial 
begin
cpha<=0;
cpol<=0;
reset<=1;
read<=0;
write <=0;
read <=1;
mosi<=1;
ss<=1;
#90;
reset<=0;
ss<=0;
write<=1;
datain<=8'b11010001;
mosi<=0;
#700;
datain<=8'b11000110;
mosi<=1;
#900;
$finish;

end



endmodule
