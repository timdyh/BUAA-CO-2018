`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:48 11/17/2018 
// Design Name: 
// Module Name:    Ctrl 
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
module Ctrl(
	input [5:0] Op,
	input [5:0] Funct,
	output reg [1:0] nPCSrc,
	output reg [1:0] RegSrc,
	output reg MemWrite,
	output reg [2:0] ALUOp,
	output reg ALUSrc,
	output reg [1:0] ExtOp,
	output reg [1:0] RegDst,
	output reg RegWrite
    );
	
	always @(*) begin
		if (Op == 6'b000000 && Funct == 6'b100001) begin	//addu
			nPCSrc = 0;
			RegSrc = 0;
			MemWrite = 0;
			ALUOp = 0;
			ALUSrc = 0;
			RegDst = 1;
			RegWrite = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b100011) begin	//subu
			nPCSrc = 0;
			RegSrc = 0;
			MemWrite = 0;
			ALUOp = 1;
			ALUSrc = 0;
			RegDst = 1;
			RegWrite = 1;
		end
		else if (Op == 6'b001101) begin		//ori
			nPCSrc = 0;
			RegSrc = 0;
			MemWrite = 0;
			ALUOp = 3;
			ALUSrc = 1;
			ExtOp = 1;
			RegDst = 0;
			RegWrite = 1;
		end
		else if (Op == 6'b100011) begin		//lw
			nPCSrc = 0;
			RegSrc = 1;
			MemWrite = 0;
			ALUOp = 0;
			ALUSrc = 1;
			ExtOp = 0;
			RegDst = 0;
			RegWrite = 1;
		end
		else if (Op == 6'b101011) begin		//sw
			nPCSrc = 0;
			MemWrite = 1;
			ALUOp = 0;
			ALUSrc = 1;
			ExtOp = 0;
			RegWrite = 0;
		end
		else if (Op == 6'b000100) begin		//beq
			nPCSrc = 1;
			MemWrite = 0;
			ALUOp = 1;
			ALUSrc = 0;
			ExtOp = 0;
			RegWrite = 0;
		end
		else if (Op == 6'b001111) begin		//lui
			nPCSrc = 0;
			RegSrc = 2;
			MemWrite = 0;
			RegDst = 0;
			ExtOp = 2;
			RegWrite = 1;
		end
		else if (Op == 6'b000011) begin		//jal
			nPCSrc = 2;
			RegSrc = 3;
			MemWrite = 0;
			RegDst = 2;
			RegWrite = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b001000) begin	//jr
			nPCSrc = 3;
			MemWrite = 0;
			RegWrite = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b000000) begin	//nop
			nPCSrc = 0;
			MemWrite = 0;
			RegWrite = 0;
		end
	end

endmodule
