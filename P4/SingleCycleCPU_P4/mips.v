`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:48 11/17/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
	input clk,
	input reset
    );
	
	//PC
	wire [31:0] nPC;
	wire [31:0] PC;
	
	PC pc(
		.clk(clk),
		.reset(reset),
		.nPC(nPC),
		.PC(PC)
		);
	
	//IM
	wire [31:0] IM_Addr = PC;
	wire [31:0] Instr;
	
	IM im(
		.Addr(IM_Addr),
		.Instr(Instr)
		);
	
	//Splitter
	wire [31:26] Op = Instr[31:26];
	wire [5:0] Funct = Instr[5:0];
	wire [25:0] imm26  = Instr[25:0];
	wire [15:0] imm16 = Instr[15:0];
	wire [25:21] rs = Instr[25:21];
	wire [20:16] rt = Instr[20:16];
	wire [15:11] rd = Instr[15:11];
	
	//Ctrl
	wire [1:0] nPCSrc;
	wire [1:0] RegSrc;
	wire MemWrite;
	wire [2:0] ALUOp;
	wire ALUSrc;
	wire [1:0] ExtOp;
	wire [1:0] RegDst;
	wire RegWrite;
	
	Ctrl ctrl(
		.Op(Op),
		.Funct(Funct),
		.nPCSrc(nPCSrc),
		.RegSrc(RegSrc),
		.MemWrite(MemWrite),
		.ALUOp(ALUOp),
		.ALUSrc(ALUSrc),
		.ExtOp(ExtOp),
		.RegDst(RegDst),
		.RegWrite(RegWrite)
		);
		
	//grf_addr3_mux
	wire [4:0] grf_addr3_mux_out;
	
	Mux4 #(5) grf_addr3_mux(
		.in0(rt),
		.in1(rd),
		.in2(5'd31),
		.op(RegDst),
		.out(grf_addr3_mux_out)
		);
		
	//GRF
	wire GRF_WriteEn = RegWrite;
	wire [4:0] GRF_Addr1 = rs;
	wire [4:0] GRF_Addr2 = rt;
	wire [4:0] GRF_Addr3 = grf_addr3_mux_out;
	wire [31:0] GRF_WriteData;
	wire [31:0] GRF_ReadData1;
	wire [31:0] GRF_ReadData2;
	
	GRF grf(
		.clk(clk),
		.reset(reset),
		.WriteEn(GRF_WriteEn),
		.Addr1(GRF_Addr1),
		.Addr2(GRF_Addr2),
		.Addr3(GRF_Addr3),
		.WriteData(GRF_WriteData),
		.ReadData1(GRF_ReadData1),
		.ReadData2(GRF_ReadData2),
		.PC(PC)		//test
		);
	
	//Ext
	wire [15:0] Ext_Src = imm16;
	wire [31:0] Ext_Dst;
	
	Ext ext(
		.Src(Ext_Src),
		.ExtOp(ExtOp),
		.Dst(Ext_Dst)
		);
	
	//alu_mux
	wire [31:0] alu_mux_out;
	
	Mux2 #(32) alu_mux(
		.in0(GRF_ReadData2),
		.in1(Ext_Dst),
		.op(ALUSrc),
		.out(alu_mux_out)
		);
	
	//ALU
	wire [31:0] A = GRF_ReadData1;
	wire [31:0] B = alu_mux_out;
	wire [31:0] ALUResult;
	wire Zero;
	
	ALU alu(
		.A(A),
		.B(B),
		.ALUOp(ALUOp),
		.ALUResult(ALUResult),
		.Zero(Zero)
		);
		
	//DM
	wire DM_WriteEn = MemWrite;
	wire [31:0] DM_Addr = ALUResult;
	wire [31:0] DM_WriteData = GRF_ReadData2;
	wire [31:0] DM_ReadData;
	
	DM dm(
		.clk(clk),
		.reset(reset),
		.WriteEn(DM_WriteEn),
		.Addr(DM_Addr),
		.WriteData(DM_WriteData),
		.ReadData(DM_ReadData),
		.PC(PC)		//test
		);
	
	//grf_writedata_mux
	wire [31:0] PC_plus_4 = PC + 4;
	wire [31:0] grf_writedata_mux_out;
	
	Mux4 #(32) grf_writedata_mux(
		.in0(ALUResult),
		.in1(DM_ReadData),
		.in2(Ext_Dst),	
		.in3(PC_plus_4),
		.op(RegSrc),
		.out(grf_writedata_mux_out)
		);
		
	assign GRF_WriteData = grf_writedata_mux_out;	//write back
	
	//pc_mux
	wire [31:0] branch_addr = Zero ? (PC_plus_4 + (Ext_Dst << 2)) : PC_plus_4;
	wire [31:0] jump_addr = {PC_plus_4[31:28], imm26, 2'b00};
	wire [31:0] pc_mux_out;
	
	Mux4 #(32) pc_mux(
		.in0(PC_plus_4),
		.in1(branch_addr),
		.in2(jump_addr),
		.in3(GRF_ReadData1),
		.op(nPCSrc),
		.out(pc_mux_out)
		);
	
	assign nPC = pc_mux_out;	//back to the very beginning

endmodule
