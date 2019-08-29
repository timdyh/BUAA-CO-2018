`timescale 1ns / 1ps
`define op 31:26
`define funct 5:0
`define imm26 25:0
`define imm16 15:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:35:56 11/25/2018 
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
	
	
	//////////////////////////// F //////////////////////////////
	
	
	//PC
	wire [31:0] PC;
	wire [31:0] nPC;
	wire PC_En;
	
	pc Pc(
		.clk(clk),
		.reset(reset),
		.En(PC_En),
		.PC(PC),
		.nPC(nPC)
		);
	
	//IM
	wire [31:0] IM_A = PC;
	wire [31:0] Instr;
	
	im IM(
		.A(IM_A),
		.Instr(Instr)
		);
	
	//ADD4, ADD8
	wire [31:0] PC4 = PC + 4;
	wire [31:0] PC8 = PC + 8;
	
	
	////////////////////////// D /////////////////////////////
	
	
	//FD
	wire [31:0] nInstr_D = Instr;
	wire [31:0] nPC4_D = PC4;
	wire [31:0] nPC8_D = PC8;
	wire [31:0] Instr_D;
	wire [31:0] PC4_D;
	wire [31:0] PC8_D;
	wire FD_En;
	
	fd FD(
		.clk(clk),
		.reset(reset),
		.En(FD_En),
		.nInstr_D(nInstr_D),
		.nPC4_D(nPC4_D),
		.nPC8_D(nPC8_D),
		.Instr_D(Instr_D),
		.PC4_D(PC4_D),
		.PC8_D(PC8_D)
		);
	
	//CTRL_D
	wire [2:0] PC_MUXsel;
	wire [1:0] EXTsel;
	wire [1:0] GRF_A3_MUXsel;
	
	ctrl CTRL_D(
		.Instr(Instr_D),
		.PC_MUXsel(PC_MUXsel),
		.EXTsel(EXTsel),
		.GRF_A3_MUXsel(GRF_A3_MUXsel)
		);
	
	//GRF
	wire [4:0] GRF_A1 = Instr_D[`rs];
	wire [4:0] GRF_A2 = Instr_D[`rt];
	wire [4:0] GRF_A3;
	wire [31:0] GRF_WD;
	wire [31:0] GRF_RD1;
	wire [31:0] GRF_RD2;
	wire GRF_WE;
	wire [31:0] PC_W;
	
	grf GRF(
		.clk(clk),
		.reset(reset),
		.WE(GRF_WE),
		.A1(GRF_A1),
		.A2(GRF_A2),
		.A3(GRF_A3),
		.WD(GRF_WD),
		.PC_D(PC8_D - 8),
		.PC_W(PC_W),
		.RD1(GRF_RD1),
		.RD2(GRF_RD2)
		);
	
	//RS_D_MUX
	wire [31:0] RS_D_MUX_In0 = GRF_RD1;
	wire [31:0] RS_D_MUX_In1;
	wire [31:0] RS_D_MUX_In2;
	wire [31:0] RS_D_MUX_In3;
	wire [31:0] RS_D_MUX_In4;
	wire [31:0] RS_D_MUX_In5;
	wire [31:0] RS_D_MUX_In6;
	wire [2:0] RS_D_MUX_Op;
	wire [31:0] RS_D_MUX_Out;
	
	mux8 #(32) RS_D_MUX(
		.In0(RS_D_MUX_In0),
		.In1(RS_D_MUX_In1),
		.In2(RS_D_MUX_In2),
		.In3(RS_D_MUX_In3),
		.In4(RS_D_MUX_In4),
		.In5(RS_D_MUX_In5),
		.In6(RS_D_MUX_In6),
		.Op(RS_D_MUX_Op),
		.Out(RS_D_MUX_Out)
		);
	
	//RT_D_MUX
	wire [31:0] RT_D_MUX_In0 = GRF_RD2;
	wire [31:0] RT_D_MUX_In1;
	wire [31:0] RT_D_MUX_In2;
	wire [31:0] RT_D_MUX_In3;
	wire [31:0] RT_D_MUX_In4;
	wire [31:0] RT_D_MUX_In5;
	wire [31:0] RT_D_MUX_In6;
	wire [2:0] RT_D_MUX_Op;
	wire [31:0] RT_D_MUX_Out;
	
	mux8 #(32) RT_D_MUX(
		.In0(RT_D_MUX_In0),
		.In1(RT_D_MUX_In1),
		.In2(RT_D_MUX_In2),
		.In3(RT_D_MUX_In3),
		.In4(RT_D_MUX_In4),
		.In5(RT_D_MUX_In5),
		.In6(RT_D_MUX_In6),
		.Op(RT_D_MUX_Op),
		.Out(RT_D_MUX_Out)
		);
	
	//EXT
	wire [15:0] EXT_In = Instr_D[`imm16];
	wire [1:0] EXT_Op = EXTsel;
	wire [31:0] EXT_Out;

	ext EXT(
		.In(EXT_In),
		.Op(EXT_Op),
		.Out(EXT_Out)
		);
	
	//PCCAL
	wire [31:0] Base = PC4_D;
	wire [31:0] ImmB = EXT_Out;
	wire [25:0] ImmJ = Instr_D[`imm26];
	wire [31:0] Cmp1 = RS_D_MUX_Out;
	wire [31:0] Cmp2 = RT_D_MUX_Out;
	wire [31:0] BeqA;
	wire [31:0] JumpA;
	
	pccal PCCAL(
		.Base(Base),
		.ImmB(ImmB),
		.ImmJ(ImmJ),
		.Cmp1(Cmp1),
		.Cmp2(Cmp2),
		.BeqA(BeqA),
		.JumpA(JumpA)
		);
	
	//GRF_A3_MUX
	wire [4:0] GRF_A3_MUX_In0 = Instr_D[`rd];
	wire [4:0] GRF_A3_MUX_In1 = Instr_D[`rt];
	wire [4:0] GRF_A3_MUX_In2 = 31;
	wire [1:0] GRF_A3_MUX_Op = GRF_A3_MUXsel;
	wire [4:0] GRF_A3_MUX_Out;
	
	mux4 #(5) GRF_A3_MUX(
		.In0(GRF_A3_MUX_In0),
		.In1(GRF_A3_MUX_In1),
		.In2(GRF_A3_MUX_In2),
		.Op(GRF_A3_MUX_Op),
		.Out(GRF_A3_MUX_Out)
		);
	
	//PC_MUX
	wire [31:0] PC_MUX_In0 = PC4;
	wire [31:0] PC_MUX_In1 = BeqA;
	wire [31:0] PC_MUX_In2 = JumpA;
	wire [31:0] PC_MUX_In3 = RS_D_MUX_Out;
	wire [2:0] PC_MUX_Op = PC_MUXsel;
	wire [31:0] PC_MUX_Out;
	
	mux8 #(32) PC_MUX(
		.In0(PC_MUX_In0),
		.In1(PC_MUX_In1),
		.In2(PC_MUX_In2),
		.In3(PC_MUX_In3),
		.Op(PC_MUX_Op),
		.Out(PC_MUX_Out)
		);
	
	assign nPC = PC_MUX_Out;
	
	
	//////////////////////////// E ///////////////////////////////
	
	
	//DE
	wire DE_clr;
	wire [31:0] nInstr_E = Instr_D;
	wire [31:0] nRS_E = RS_D_MUX_Out;
	wire [31:0] nRT_E = RT_D_MUX_Out;
	wire [31:0] nEXT_E = EXT_Out;
	wire [31:0] nPC8_E = PC8_D;
	wire [4:0] nWBA_E = GRF_A3_MUX_Out;
	wire [31:0] Instr_E;
	wire [31:0] RS_E;
	wire [31:0] RT_E;
	wire [31:0] EXT_E;
	wire [31:0] PC8_E;
	wire [4:0] WBA_E;
	
	de DE(
		.clk(clk),
		.reset(reset),
		.clr(DE_clr),
		.nInstr_E(nInstr_E),
		.nRS_E(nRS_E),
		.nRT_E(nRT_E),
		.nEXT_E(nEXT_E),
		.nPC8_E(nPC8_E),
		.nWBA_E(nWBA_E),
		.Instr_E(Instr_E),
		.RS_E(RS_E),
		.RT_E(RT_E),
		.EXT_E(EXT_E),
		.PC8_E(PC8_E),
		.WBA_E(WBA_E)
		);
	
	//CTRL_E
	wire [2:0] ALUsel;
	wire ALU_B_MUXsel;
	
	ctrl CTRL_E(
		.Instr(Instr_E),
		.ALUsel(ALUsel),
		.ALU_B_MUXsel(ALU_B_MUXsel)
		);
		
	//RS_E_MUX
	wire [31:0] RS_E_MUX_In0 = RS_E;
	wire [31:0] RS_E_MUX_In1;
	wire [31:0] RS_E_MUX_In2;
	wire [31:0] RS_E_MUX_In3;
	wire [31:0] RS_E_MUX_In4;
	wire [2:0] RS_E_MUX_Op;
	wire [31:0] RS_E_MUX_Out;
	
	mux8 #(32) RS_E_MUX(
		.In0(RS_E_MUX_In0),
		.In1(RS_E_MUX_In1),
		.In2(RS_E_MUX_In2),
		.In3(RS_E_MUX_In3),
		.In4(RS_E_MUX_In4),
		.Op(RS_E_MUX_Op),
		.Out(RS_E_MUX_Out)
		);
	
	//RT_E_MUX
	wire [31:0] RT_E_MUX_In0 = RT_E;
	wire [31:0] RT_E_MUX_In1;
	wire [31:0] RT_E_MUX_In2;
	wire [31:0] RT_E_MUX_In3;
	wire [31:0] RT_E_MUX_In4;
	wire [2:0] RT_E_MUX_Op;
	wire [31:0] RT_E_MUX_Out;
	
	mux8 #(32) RT_E_MUX(
		.In0(RT_E_MUX_In0),
		.In1(RT_E_MUX_In1),
		.In2(RT_E_MUX_In2),
		.In3(RT_E_MUX_In3),
		.In4(RT_E_MUX_In4),
		.Op(RT_E_MUX_Op),
		.Out(RT_E_MUX_Out)
		);
	
	//ALU_B_MUX
	wire [31:0] ALU_B_MUX_In0 = RT_E_MUX_Out;
	wire [31:0] ALU_B_MUX_In1 = EXT_E;
	wire ALU_B_MUX_Op = ALU_B_MUXsel;
	wire [31:0] ALU_B_MUX_Out;
	
	mux2 #(32) ALU_B_MUX(
		.In0(ALU_B_MUX_In0),
		.In1(ALU_B_MUX_In1),
		.Op(ALU_B_MUX_Op),
		.Out(ALU_B_MUX_Out)
		);
	
	//ALU
	wire [31:0] A = RS_E_MUX_Out;
	wire [31:0] B = ALU_B_MUX_Out;
	wire [2:0] ALU_Op = ALUsel;
	wire [31:0] ALU_Out;
	
	alu ALU(
		.A(A),
		.B(B),
		.Op(ALU_Op),
		.Out(ALU_Out)
		);
	
	
	//////////////////////////// M ///////////////////////////////
	
	
	//EM
	wire [31:0] nInstr_M = Instr_E;
	wire [31:0] nRT_M = RT_E_MUX_Out;
	wire [31:0] nALU_M = ALU_Out;
	wire [31:0] nEXT_M = EXT_E;
	wire [31:0] nPC8_M = PC8_E;
	wire [4:0] nWBA_M = WBA_E;
	wire [31:0] Instr_M;
	wire [31:0] RT_M;
	wire [31:0] ALU_M;
	wire [31:0] EXT_M;
	wire [31:0] PC8_M;
	wire [4:0] WBA_M;
	
	em EM(
		.clk(clk),
		.reset(reset),
		.nInstr_M(nInstr_M),
		.nRT_M(nRT_M),
		.nALU_M(nALU_M),
		.nEXT_M(nEXT_M),
		.nPC8_M(nPC8_M),
		.nWBA_M(nWBA_M),
		.Instr_M(Instr_M),
		.RT_M(RT_M),
		.ALU_M(ALU_M),
		.EXT_M(EXT_M),
		.PC8_M(PC8_M),
		.WBA_M(WBA_M)
		);
	
	//CTRL_M
	wire DM_WE;
	
	ctrl CTRL_M(
		.Instr(Instr_M),
		.DM_WE(DM_WE)
		);
	
	//RT_M_MUX
	wire [31:0] RT_M_MUX_In0 = RT_M;
	wire [31:0] RT_M_MUX_In1;
	wire RT_M_MUX_Op;
	wire [31:0] RT_M_MUX_Out;
	
	mux2 #(32) RT_M_MUX(
		.In0(RT_M_MUX_In0),
		.In1(RT_M_MUX_In1),
		.Op(RT_M_MUX_Op),
		.Out(RT_M_MUX_Out)
		);
	
	//DM
	wire [31:0] DM_A = ALU_M;
	wire [31:0] DM_WD = RT_M_MUX_Out;
	wire [31:0] DM_RD;
	
	dm DM(
		.clk(clk),
		.reset(reset),
		.WE(DM_WE),
		.A(DM_A),
		.WD(DM_WD),
		.PC_M(PC8_M - 8),
		.RD(DM_RD)
		);
	
	
	///////////////////////////// W ///////////////////////////////
	
	
	//MW
	wire [31:0] nInstr_W = Instr_M;
	wire [31:0] nALU_W = ALU_M;
	wire [31:0] nDM_W = DM_RD;
	wire [31:0] nEXT_W = EXT_M;
	wire [31:0] nPC8_W = PC8_M;
	wire [4:0] nWBA_W = WBA_M;
	wire [31:0] Instr_W;
	wire [31:0] ALU_W;
	wire [31:0] DM_W;
	wire [31:0] EXT_W;
	wire [31:0] PC8_W;
	wire [4:0] WBA_W;
	
	mw MW(
		.clk(clk),
		.reset(reset),
		.nInstr_W(nInstr_W),
		.nALU_W(nALU_W),
		.nDM_W(nDM_W),
		.nEXT_W(nEXT_W),
		.nPC8_W(nPC8_W),
		.nWBA_W(nWBA_W),
		.Instr_W(Instr_W),
		.ALU_W(ALU_W),
		.DM_W(DM_W),
		.EXT_W(EXT_W),
		.PC8_W(PC8_W),
		.WBA_W(WBA_W)
		);
	
	assign PC_W = PC8_W - 8;
	
	//CTRL_W
	wire [1:0] GRF_WD_MUXsel;
	
	ctrl CTRL_W(
		.Instr(Instr_W),
		.GRF_WD_MUXsel(GRF_WD_MUXsel),
		.GRF_WE(GRF_WE)
		);
	
	//GRF_WD_MUX
	wire [31:0] GRF_WD_MUX_In0 = ALU_W;
	wire [31:0] GRF_WD_MUX_In1 = DM_W;
	wire [31:0] GRF_WD_MUX_In2 = EXT_W;
	wire [31:0] GRF_WD_MUX_In3 = PC8_W;
	wire [1:0] GRF_WD_MUX_Op = GRF_WD_MUXsel;
	wire [31:0] GRF_WD_MUX_Out;
	
	mux4 #(32) GRF_WD_MUX(
		.In0(GRF_WD_MUX_In0),
		.In1(GRF_WD_MUX_In1),
		.In2(GRF_WD_MUX_In2),
		.In3(GRF_WD_MUX_In3),
		.Op(GRF_WD_MUX_Op),
		.Out(GRF_WD_MUX_Out)
		);
		
	assign GRF_A3 = WBA_W;
	assign GRF_WD = GRF_WD_MUX_Out;
	
	
	//////////////////////////// hazard /////////////////////////////////
	
	
	wire [2:0] RS_D_MUXsel;
	wire [2:0] RT_D_MUXsel;
	wire [2:0] RS_E_MUXsel;
	wire [2:0] RT_E_MUXsel;
	wire RT_M_MUXsel;
	wire Stall;
	
	hzd HZD(
		.Instr_D(Instr_D),
		.Instr_E(Instr_E),
		.Instr_M(Instr_M),
		.Instr_W(Instr_W),
		.RS_D_MUXsel(RS_D_MUXsel),
		.RT_D_MUXsel(RT_D_MUXsel),
		.RS_E_MUXsel(RS_E_MUXsel),
		.RT_E_MUXsel(RT_E_MUXsel),
		.RT_M_MUXsel(RT_M_MUXsel),
		.Stall(Stall)
		);
	
	//RS_D_MUX forward
	assign RS_D_MUX_In1 = EXT_E;
	assign RS_D_MUX_In2 = PC8_E;
	assign RS_D_MUX_In3 = ALU_M;
	assign RS_D_MUX_In4 = EXT_M;
	assign RS_D_MUX_In5 = PC8_M;
	assign RS_D_MUX_In6 = GRF_WD_MUX_Out;
	assign RS_D_MUX_Op = RS_D_MUXsel;
	
	//RT_D_MUX forward
	assign RT_D_MUX_In1 = EXT_E;
	assign RT_D_MUX_In2 = PC8_E;
	assign RT_D_MUX_In3 = ALU_M;
	assign RT_D_MUX_In4 = EXT_M;
	assign RT_D_MUX_In5 = PC8_M;
	assign RT_D_MUX_In6 = GRF_WD_MUX_Out;
	assign RT_D_MUX_Op = RT_D_MUXsel;
	
	//RS_E_MUX forward
	assign RS_E_MUX_In1 = ALU_M;
	assign RS_E_MUX_In2 = EXT_M;
	assign RS_E_MUX_In3 = PC8_M;
	assign RS_E_MUX_In4 = GRF_WD_MUX_Out;
	assign RS_E_MUX_Op = RS_E_MUXsel;
	
	//RT_E_MUX forward
	assign RT_E_MUX_In1 = ALU_M;
	assign RT_E_MUX_In2 = EXT_M;
	assign RT_E_MUX_In3 = PC8_M;
	assign RT_E_MUX_In4 = GRF_WD_MUX_Out;
	assign RT_E_MUX_Op = RT_E_MUXsel;
	
	//RT_M_MUX forward
	assign RT_M_MUX_In1 = GRF_WD_MUX_Out;
	assign RT_M_MUX_Op = RT_M_MUXsel;
	
	//stall
	assign PC_En = !Stall;
	assign FD_En = !Stall;
	assign DE_clr = Stall;
	
endmodule
