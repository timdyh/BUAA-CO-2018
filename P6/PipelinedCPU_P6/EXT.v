`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:49 11/24/2018 
// Design Name: 
// Module Name:    EXT 
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
module ext(
	input [15:0] In,
	input [1:0] Op,
	output reg [31:0] Out
    );
	
	always @(*) begin
		case (Op)
			0: Out = $signed(In);
			1: Out = In;
			2: Out = {In, 16'h0000};
		endcase	
	end
	
endmodule