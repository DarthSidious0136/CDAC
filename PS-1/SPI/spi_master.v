`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 11:25:23
// Design Name: 
// Module Name: spi_master
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


module spi_master(
input clk,
input cpol,
input cpha,
input miso,
input [7:0]datain,
input read,
input write,//used to write data to the register into the shift 
input reset,//active high ,will reset the clock counter

output reg sclk,
output reg mosi,
output reg ss,
output [2:0]stateout,
output [7:0]miso_dataout

    );

localparam idle=0;
localparam setup=1;
localparam transfer=2;
localparam done=3;

reg transfer_done;//tracks whether transfer is done or not
reg [2:0]rindex; 
reg [2:0]state;// IDLE, SETUP (SS goes low , read or write signal is asserted ),TRANSFER( shifts the data out ,or reads the data ),COMPLETE   
reg [2:0]windex;   //generates the index at which we have to write data
reg [7:0]mosi_data;
reg [3:0]counter ;  //counter for clock division
reg [7:0]miso_data; //register for storing incoming data
 wire clkread;
 wire clkwrite;
 //monitoring
 assign miso_dataout=miso_data;
 assign stateout=state;
 

 
 //generate clocks for read and write based on cpol and cpha
 assign clkwrite=(cpha^cpol)?sclk:~sclk;
 assign clkread=(cpha^cpol)?~sclk:sclk;
 //this always block generates the desired sclk
    always @(posedge clk or posedge reset)begin
    if(reset)begin   //if start is low clk won't pulse
    counter<=0;
    sclk<=0;
    end
    else if(state==transfer)
    begin
    if(counter==15)
    begin
    counter<=0;
    sclk<=~sclk;
    end
    else
    counter<=counter+1;
    end
    end
    //manages data loading when write signal goes high 
    always @(posedge reset or posedge clk)
    begin
    if(reset)
    mosi_data<=mosi_data;
    else if(write && (state==setup))// data should be written first before starting the SCLK or 
    begin
    mosi_data<=datain;
    end
    end
    
    
    //manages the states 
    always @(posedge clk or posedge reset)
    begin
    if(reset)
    begin
    mosi<=1'bz;
    state<=idle;
    windex<=0;
    rindex<=0;
    end
    else
    begin
    case(state)
        idle:begin
        ss<=1;//ss is active low
        mosi<=1'bz;
        if(write||read)
            state<=setup;
        end
        setup: begin//a single clock buffer which initializes all pointers and selects slave
        ss<=0;
        windex<=0;
        rindex<=0;
        state<=transfer;
        mosi<=1'bz;
        end
        
        transfer: begin
        if(transfer_done==1)
        state<=done;
        end
        
        done:begin
        mosi<=1'bz;
        ss<=0;
        windex<=0;
        rindex<=0;
        if(write && read)
        state<=setup;
        else
        state<=idle;
        end
     endcase   
    end
    end
    
    
    
    //SCLK will only toggle in the transfer state
//sclk starts only when we have to read or write data and when we are the transfer state
   always @(posedge clkwrite)
   begin 
   if(write )begin
   if(windex<7)
   begin
   mosi<=mosi_data[7-windex];
   windex<=windex+1;
   end
   else if(windex==7)begin
   mosi<=mosi_data[7-windex];
   //windex<=0;
   if((~(cpha^cpol)))
   begin
   state<=done;
  // transfer_done<=1;
   end
   end
   end
   end 
   
   always @(posedge clkread)
   begin
   if(read && (miso==0 || miso==1))
   begin
   if(rindex<7)begin
   miso_data[7-rindex]<=miso;
   rindex<=rindex+1;
   end
   else if(rindex==7)
   begin
   miso_data[7-rindex]<=miso;
   rindex<=0;
   if(cpha^cpol)
   state<=done;
   
   end
   end
   end
endmodule
