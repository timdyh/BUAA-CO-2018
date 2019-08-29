`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:18 11/24/2018 
// Design Name: 
// Module Name:    MW 
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
module mw(
	input clk,
	input reset,
	input [31:0] nInstr_W,
	input [31:0] nALU_W,
	input [31:0] nDM_W,
	input [31:0] nEXT_W,
	input [31:0] nPC8_W,
	input [4:0] nWBA_W,
	output reg [31:0] Instr_W,
	output reg [31:0] ALU_W,
	output reg [31:0] DM_W,
	output reg [31:0] EXT_W,
	output reg [31:0] PC8_W,
	output reg [4:0] WBA_W
    );
	
	initial begin
		Instr_W = 0;
		ALU_W = 0;
		DM_W = 0;
		EXT_W = 0;
		PC8_W = 0;
		WBA_W = 0;
	end
	
	always @(posedge clk) begin
		if (reset) begin
			Instr_W = 0;
			ALU_W = 0;
			DM_W = 0;
			EXT_W = 0;
			PC8_W = 0;
			WBA_W = 0;
		end
		else begin
			Instr_W = nInstr_W;
			ALU_W = nALU_W;
			DM_W = nDM_W;
			EXT_W = nEXT_W;
			PC8_W = nPC8_W;
			WBA_W = nWBA_W;
		end
	end

endmodule