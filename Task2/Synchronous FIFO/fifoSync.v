`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:07 06/21/2025 
// Design Name: 
// Module Name:    fifoSync 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fifoSync#(parameter B=8,W=4)(input reset,input clk, input rd, input wr, //clock, reset , read and write enable signals 
	input [B-1:0] w_data,output empty ,output full, output [B-1:0]r_data
    );
//declaring array 

reg [B-1:0] array_reg [2**W-1:0];
reg [W-1:0]w_ptr_reg, w_ptr_next,w_ptr_succ;//points to memory where data is will be was written in current cycle , reg where data where next data should be written ( based on write control signal ) , the next memory 
reg [W-1:0] r_ptr_reg , r_ptr_next, r_ptr_succ;
reg full_reg , empty_reg ,full_next ,empty_next;


wire wr_en ;


always @(posedge clk)
if(wr_en)
array_reg [w_ptr_reg]<=w_data;

assign r_data=array_reg[r_ptr_reg];

assign wr_en= wr&~full_reg;

always @(posedge clk or posedge reset)
if(reset)
begin
w_ptr_reg<=0;
r_ptr_reg <=0;
full_reg<=1'b0;
empty_reg<=1'b1;
end

else
begin
w_ptr_reg<=w_ptr_next;
r_ptr_reg<=r_ptr_next;
full_reg<=full_next;
empty_reg<=empty_next;

end


always @*
begin
w_ptr_succ=w_ptr_reg+1;

r_ptr_succ=r_ptr_reg+1;
w_ptr_next=w_ptr_reg;
r_ptr_next=r_ptr_reg;


full_next=full_reg;
empty_next=empty_reg;


case(	{wr,rd})
2'b00:
begin
r_ptr_next=r_ptr_reg;
w_ptr_next=w_ptr_reg;
end
2'b01:if(~empty_reg)
begin
r_ptr_next=r_ptr_succ;
full_next=1'b0;
if(r_ptr_succ==w_ptr_reg)
empty_next=1'b1;
end
2'b10://write
if(~full_reg)
begin
w_ptr_next=w_ptr_succ;
empty_next=0;
r_ptr_next=r_ptr_reg;
if(w_ptr_next==r_ptr_reg)
full_next=1;
end
2'b11:
begin
w_ptr_next=w_ptr_succ;
r_ptr_next=r_ptr_succ;
end
endcase
end

assign full=full_reg;
assign empty=empty_reg;




//declaring signals


endmodule
