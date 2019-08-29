`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:56 10/25/2018 
// Design Name: 
// Module Name:    ext 
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
    input [15:0] imm,
    input [1:0] EOp,
    output reg [31:0] ext
    );
	
	always @(*) begin
		case (EOp)
			2'b00: ext = $signed(imm);
			2'b01: ext = imm;
			2'b10: ext = {imm, 16'h0};
			2'b11: ext = $signed(imm) << 2;
		endcase
	end

endmodule
