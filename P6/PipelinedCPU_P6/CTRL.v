`timescale 1ns / 1ps
`define op 31:26
`define funct 5:0
`define imm26 25:0
`define imm16 15:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define s 10:6
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:30 11/24/2018 
// Design Name: 
// Module Name:    CTRL 
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
module ctrl(
	input [31:0] Instr,
	//D control
	output reg [2:0] PC_MUXsel,
	output reg [1:0] EXTsel,
	output reg [1:0] GRF_A3_MUXsel,
	output reg [2:0] PCCALsel,
	//E control
	output reg [3:0] ALUsel,
	output reg ALU_A_MUXsel,
	output reg ALU_B_MUXsel,
	output reg [2:0] MDUsel,
	output reg Start,
	output reg MDU_RDsel,
	output reg ALU_MDU_MUXsel,
	//M control
	output reg DM_WE,
	output reg [1:0] StoreType,
	output reg [2:0] LoadType,
	//W control
	output reg [1:0] GRF_WD_MUXsel,
	output reg GRF_WE
    );
	
	wire [5:0] Op = Instr[`op];
	wire [5:0] Funct = Instr[`funct];
	wire [4:0] rt = Instr[`rt];
	
	always @(*) begin
		if (Op == 6'b000000 && Funct == 6'b100000) begin	//add
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b100001) begin	//addu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b100010) begin	//sub
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 1;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b100011) begin	//subu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 1;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b100100)	begin	//and
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 2;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b100101)	begin	//or
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 3;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b100110)	begin	//xor
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 4;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b100111)	begin	//nor
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 5;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b000100) begin	//sllv
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 6;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;	
		end
		else if (Op == 6'b000000 && Funct == 6'b000110) begin	//srlv
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 7;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;	
		end
		else if (Op == 6'b000000 && Funct == 6'b000111) begin	//srav
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 8;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;	
		end
		else if (Op == 6'b000000 && Funct == 6'b000000) begin	//sll
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 6;
			ALU_A_MUXsel = 1;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b000010) begin	//srl
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 7;
			ALU_A_MUXsel = 1;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b000011) begin	//sra
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 8;
			ALU_A_MUXsel = 1;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001000) begin		//addi
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001001) begin		//addiu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001100) begin		//andi
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 1;
			GRF_A3_MUXsel = 1;
			ALUsel = 2;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001101) begin		//ori
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 1;
			GRF_A3_MUXsel = 1;
			ALUsel = 3;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001110) begin		//xori
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 1;
			GRF_A3_MUXsel = 1;
			ALUsel = 4;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001111) begin		//lui
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 1;
			EXTsel = 2;
			GRF_A3_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 2;
		end
		else if (Op == 6'b000010) begin		//j
			PC_MUXsel = 2;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b000011) begin		//jal
			PC_MUXsel = 2;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 2;
			DM_WE = 0;
			GRF_WD_MUXsel = 3;
		end
		else if (Op == 6'b000000 && Funct == 6'b001000) begin	//jr
			PC_MUXsel = 3;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b001001) begin	//jalr
			PC_MUXsel = 3;
			MDUsel = 0;
			Start = 0;
			GRF_A3_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 3;
			GRF_WE = 1;
		end
		else if (Op == 6'b000100) begin		//beq
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b000101) begin		//bne
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 1;
			DM_WE = 0;
		end
		else if (Op == 6'b000110) begin		//blez
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 2;
			DM_WE = 0;
		end
		else if (Op == 6'b000111) begin		//bgtz
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 3;
			DM_WE = 0;
		end
		else if (Op == 6'b000001 && rt == 5'b00000) begin	//bltz
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 4;
			DM_WE = 0;
		end
		else if (Op == 6'b000001 && rt == 5'b00001) begin	//bgez
			PC_MUXsel = 1;
			MDUsel = 0;
			Start = 0;
			GRF_WE = 0;
			EXTsel = 0;
			PCCALsel = 5;
			DM_WE = 0;	
		end
		else if (Op == 6'b000000 && Funct == 6'b101010) begin	//slt
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 9;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b101011) begin	//sltu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			ALUsel = 10;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001010) begin		//slti
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 9;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b001011) begin		//sltiu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 10;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b101011) begin		//sw
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 0;
			EXTsel = 0;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 1;
			StoreType = 0;
		end
		else if (Op == 6'b101001) begin		//sh
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 0;
			EXTsel = 0;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 1;
			StoreType = 1;
		end
		else if (Op == 6'b101000) begin		//sb
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 0;
			EXTsel = 0;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 1;
			StoreType = 2;
		end
		else if (Op == 6'b100011) begin		//lw
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			LoadType = 0;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b100001) begin		//lh
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			LoadType = 1;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b100101) begin		//lhu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			LoadType = 2;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b100000) begin		//lb
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			LoadType = 3;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b100100) begin		//lbu
			PC_MUXsel = 0;
			MDUsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_A_MUXsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			LoadType = 4;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b011000)	begin	//mult
			PC_MUXsel = 0;
			MDUsel = 1;
			Start = 1;
			DM_WE = 0;
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b011001)	begin	//multu
			PC_MUXsel = 0;
			MDUsel = 2;
			Start = 1;
			DM_WE = 0;
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b011010)	begin	//div
			PC_MUXsel = 0;
			MDUsel = 3;
			Start = 1;
			DM_WE = 0;
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b011011)	begin	//divu
			PC_MUXsel = 0;
			MDUsel = 4;
			Start = 1;
			DM_WE = 0;
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b010011)	begin	//mtlo
			PC_MUXsel = 0;  
			MDUsel = 5;
			Start = 0;
			DM_WE = 0;  
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b010001)	begin	//mthi
			PC_MUXsel = 0;  
			MDUsel = 6;
			Start = 0;
			DM_WE = 0;  
			GRF_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b010010) begin	//mflo
			PC_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			MDUsel = 0;
			MDU_RDsel = 0;
			Start = 0;
			ALU_MDU_MUXsel = 1;
			DM_WE = 0; 
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
		else if (Op == 6'b000000 && Funct == 6'b010000) begin	//mfhi
			PC_MUXsel = 0;
			GRF_A3_MUXsel = 0;
			MDUsel = 0;
			MDU_RDsel = 1;
			Start = 0;
			ALU_MDU_MUXsel = 1;
			DM_WE = 0; 
			GRF_WD_MUXsel = 0;
			GRF_WE = 1;
		end
	end
endmodule

/*
PC_MUXsel = 
EXTsel = 
GRF_A3_MUXsel = 
PCCALsel = 
ALUsel = 
ALU_A_MUXsel = 
ALU_B_MUXsel = 
MDUsel = 
Start = 
MDU_RDsel = 
ALU_MDU_MUXsel = 
DM_WE = 
StoreType = 
LoadType = 
GRF_WD_MUXsel = 
GRF_WE = 
*/
