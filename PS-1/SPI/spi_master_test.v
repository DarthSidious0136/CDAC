`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 11:34:03
// Design Name: 
// Module Name: spi_master_test
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


module spi_master_test;
//inputs
reg clk;
reg start;
reg miso;
reg reset;
reg read;
reg write;
reg [7:0]datain;
reg cpha;
reg cpol;
//outputs
wire sclk;
wire mosi;
wire ss;
wire [2:0]stateout;
wire [7:0]miso_dataout;
spi_master uut(.clk(clk),
//.start(start),
.miso(miso),
.reset(reset),
.sclk(sclk),
.mosi(mosi),
.ss(ss),
.datain(datain),
.read(read),
.write(write),
.stateout(stateout),
.miso_dataout(miso_dataout),
.cpha(cpha),
.cpol(cpol)

);

initial begin
clk<=0;
forever #10 clk<=~clk;
end

initial begin
reset<=1;
cpol<=0;
cpha<=1;
read<=0;
write<=0;
//start<=0;
datain<=8'b11100101;
#30;
read<=1;
write<=1;
start<=1;
reset<=0;
miso<=1;
#200;
miso<=0;
#500 miso<=1;
#300 miso<=0;
#4200;
$finish;



end
endmodule
