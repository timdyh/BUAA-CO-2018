`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:27 11/17/2018 
// Design Name: 
// Module Name:    Ext 
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
module Ext(
	input [15:0] Src,
	input [1:0] ExtOp,
	output reg [31:0] Dst
    );
	
	always @(*) begin
		case (ExtOp)
			0: Dst = $signed(Src);
			1: Dst = Src;
			2: Dst = {Src, 16'h0000};
		endcase	
	end
	
endmodule
