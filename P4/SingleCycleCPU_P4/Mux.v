`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:51 11/17/2018 
// Design Name: 
// Module Name:    Mux 
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
module Mux2(
	input [width-1:0] in0,
	input [width-1:0] in1,
	input op,
	output reg [width-1:0] out
    );
	
	parameter width = 32;

	always @(*) begin
		case (op)
			0: out = in0;
			1: out = in1;
		endcase
	end

endmodule


module Mux4(
	input [width-1:0] in0,
	input [width-1:0] in1,
	input [width-1:0] in2,
	input [width-1:0] in3,
	input [1:0] op,
	output reg [width-1:0] out
    );
	
	parameter width = 32;

	always @(*) begin
		case (op)
			0: out = in0;
			1: out = in1;
			2: out = in2;
			3: out = in3;
		endcase
	end

endmodule


module Mux8(
	input [width-1:0] in0,
	input [width-1:0] in1,
	input [width-1:0] in2,
	input [width-1:0] in3,
	input [width-1:0] in4,
	input [width-1:0] in5,
	input [width-1:0] in6,
	input [width-1:0] in7,
	input [2:0] op,
	output reg [width-1:0] out
    );
	
	parameter width = 32;

	always @(*) begin
		case (op)
			0: out = in0;
			1: out = in1;
			2: out = in2;
			3: out = in3;
			4: out = in4;
			5: out = in5;
			6: out = in6;
			7: out = in7;
		endcase
	end

endmodule
