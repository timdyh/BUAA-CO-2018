`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:00 11/24/2018 
// Design Name: 
// Module Name:    EM 
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
module em(
	input clk,
	input reset,
	input [31:0] nInstr_M,
	input [31:0] nRT_M,
	input [31:0] nALU_M,
	input [31:0] nEXT_M,
	input [31:0] nPC8_M,
	input [4:0] nWBA_M,
	output reg [31:0] Instr_M,
	output reg [31:0] RT_M,
	output reg [31:0] ALU_M,
	output reg [31:0] EXT_M,
	output reg [31:0] PC8_M,
	output reg [4:0] WBA_M
    );
	
	initial begin
		Instr_M = 0;
		RT_M = 0;
		ALU_M = 0;
		EXT_M = 0;
		PC8_M = 0;
		WBA_M = 0;
	end
	
	always @(posedge clk) begin
		if (reset) begin
			Instr_M = 0;
			RT_M = 0;
			ALU_M = 0;
			EXT_M = 0;
			PC8_M = 0;
			WBA_M = 0;
		end
		else begin
			Instr_M = nInstr_M;
			RT_M = nRT_M;
			ALU_M = nALU_M;
			EXT_M = nEXT_M;
			PC8_M = nPC8_M;
			WBA_M = nWBA_M;
		end
	end

endmodule
