`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:33 06/11/2025 
// Design Name: 
// Module Name:    ques2 
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

////// 2:1 MUX
 module mux(input i0,input i1,input s,output y);
 begin
	assign y=(i0&~s)|(i1&s);
	end
	endmodule




///////4:1 mux

module ques2(input i0,input i1,input i2,input i3,input [1:0]select,output y
    );
	 begin
	 wire w1,w2;
		mux mux0(i0,i1,select[0],w1);
		mux mux1(i2,i3,select[0],w2);
		mux mux2(w1,w2,select[1],y);
	 end


endmodule

module seventoone(input i1,input i2,input i3,input i4,input i5,input i6,input i7, input [2:0]select,output y );
begin
	wire w1,w2,w3,w4,w5,w6;
	mux mux0(i0,i1,1'b1,w1);
	mux mux1(i2,i3,select[0],w2);
	mux mux2(i4,i5,select[0],w3);
	mux mux3(i6,i7,select[0],w4);
	mux mux4(w1,w2,select[1],w5);
	mux mux5(w3,w4,select[1],w6);
	mux mux6(w5,w6,select[2],y);
end
endmodule
 
 
module thirtoone(input i1,input i2,input i3,input i4,input i5, input i6 ,input i7, input i8 ,input i9 ,input i10 ,
input i11 ,input i12 ,input i13,input [3:0]select,output y);
begin

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14;
mux mux0(1'bx,i1,select[0],w1);
mux mux1(i2,i3,select[0],w2);
mux mux2(i4,i5,select[0],w3);
mux mux3(i6,i7,select[0],w4);
mux mux4(i8,i9,select[0],w5);
mux mux5(i10,i11,select[0],w6);
mux mux6(i12,i13,select[0],w7);
mux mux7(1'bx,1'bx,select[0],w8);
mux mux8(w1,w2,select[1],w9);
mux mux9(w3,w4,select[1],w10);
mux mux10(w5,w6,select[1],w11);
mux mux11(w7,w8,select[1],w12);
mux mux12(w9,w10,select[2],w13);
mux mux13(w11,w12,select[2],w14);
mux mux14(w13,w14,select[3],y);



end
endmodule


	