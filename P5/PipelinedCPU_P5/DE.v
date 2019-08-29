`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:28 11/24/2018 
// Design Name: 
// Module Name:    DE 
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
module de(
	input clk,
	input reset,
	input clr,
	input [31:0] nInstr_E,
	input [31:0] nRS_E,
	input [31:0] nRT_E,
	input [31:0] nEXT_E,
	input [31:0] nPC8_E,
	input [4:0] nWBA_E,
	output reg [31:0] Instr_E,
	output reg [31:0] RS_E,
	output reg [31:0] RT_E,
	output reg [31:0] EXT_E,
	output reg [31:0] PC8_E,
	output reg [4:0] WBA_E
    );
	
	initial begin
		Instr_E = 0;
		RS_E = 0;
		RT_E = 0;
		EXT_E = 0;
		PC8_E = 0;
		WBA_E = 0;
	end
	
	always @(posedge clk) begin
		if (reset || clr) begin
			Instr_E = 0;
			RS_E = 0;
			RT_E = 0;
			EXT_E = 0;
			PC8_E = 0;
			WBA_E = 0;
		end
		else begin
			Instr_E = nInstr_E;
			RS_E = nRS_E;
			RT_E = nRT_E;
			EXT_E = nEXT_E;
			PC8_E = nPC8_E;
			WBA_E = nWBA_E;
		end
	end

endmodule
