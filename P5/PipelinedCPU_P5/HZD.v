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
// Create Date:    20:09:42 11/24/2018 
// Design Name: 
// Module Name:    HZD 
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
module hzd(
	input [31:0] Instr_D,
	input [31:0] Instr_E,
	input [31:0] Instr_M,
	input [31:0] Instr_W,
	output [2:0] RS_D_MUXsel,
	output [2:0] RT_D_MUXsel,
	output [2:0] RS_E_MUXsel,
	output [2:0] RT_E_MUXsel,
	output RT_M_MUXsel,
	output Stall
    );
	
	wire [5:0] Op_D = Instr_D[`op];
	wire [5:0] Funct_D = Instr_D[`funct];
	wire [4:0] rs_D = Instr_D[`rs];
	wire [4:0] rt_D = Instr_D[`rt];

	wire [5:0] Op_E = Instr_E[`op];
	wire [5:0] Funct_E = Instr_E[`funct];
	wire [4:0] rs_E = Instr_E[`rs];
	wire [4:0] rt_E = Instr_E[`rt];
	wire [4:0] rd_E = Instr_E[`rd];

	wire [5:0] Op_M = Instr_M[`op];
	wire [5:0] Funct_M = Instr_M[`funct];
	wire [4:0] rt_M = Instr_M[`rt];
	wire [4:0] rd_M = Instr_M[`rd];

	wire [5:0] Op_W = Instr_W[`op];
	wire [5:0] Funct_W = Instr_W[`funct];
	wire [4:0] rt_W = Instr_W[`rt];
	wire [4:0] rd_W = Instr_W[`rd];
	
	//D instructions
	wire addu_D = (Op_D == 6'b000000 & Funct_D == 6'b100001);
	wire subu_D = (Op_D == 6'b000000 & Funct_D == 6'b100011);
	wire ori_D = (Op_D == 6'b001101);
	wire lw_D = (Op_D == 6'b100011);
	wire sw_D = (Op_D == 6'b101011);
	wire beq_D = (Op_D == 6'b000100);
	wire lui_D = (Op_D == 6'b001111);
	wire j_D = (Op_D == 6'b000010);
	wire jal_D = (Op_D == 6'b000011);
	wire jr_D = (Op_D == 6'b000000 & Funct_D == 6'b001000);
	wire nop_D = (Op_D == 6'b000000 & Funct_D == 6'b000000);
	
	//E instructions
	wire addu_E = (Op_E == 6'b000000 & Funct_E == 6'b100001);
	wire subu_E = (Op_E == 6'b000000 & Funct_E == 6'b100011);
	wire ori_E = (Op_E == 6'b001101);
	wire lw_E = (Op_E == 6'b100011);
	wire sw_E = (Op_E == 6'b101011);
	wire beq_E = (Op_E == 6'b000100);
	wire lui_E = (Op_E == 6'b001111);
	wire j_E = (Op_E == 6'b000010);
	wire jal_E = (Op_E == 6'b000011);
	wire jr_E = (Op_E == 6'b000000 & Funct_E == 6'b001000);
	wire nop_E = (Op_E == 6'b000000 & Funct_E == 6'b000000);
	
	//M instructions
	wire addu_M = (Op_M == 6'b000000 & Funct_M == 6'b100001);
	wire subu_M = (Op_M == 6'b000000 & Funct_M == 6'b100011);
	wire ori_M = (Op_M == 6'b001101);
	wire lw_M = (Op_M == 6'b100011);
	wire sw_M = (Op_M == 6'b101011);
	wire beq_M = (Op_M == 6'b000100);
	wire lui_M = (Op_M == 6'b001111);
	wire j_M = (Op_M == 6'b000010);
	wire jal_M = (Op_M == 6'b000011);
	wire jr_M = (Op_M == 6'b000000 & Funct_M == 6'b001000);
	wire nop_M = (Op_M == 6'b000000 & Funct_M == 6'b000000);
	
	//W instructions
	wire addu_W = (Op_W == 6'b000000 & Funct_W == 6'b100001);
	wire subu_W = (Op_W == 6'b000000 & Funct_W == 6'b100011);
	wire ori_W = (Op_W == 6'b001101);
	wire lw_W = (Op_W == 6'b100011);
	wire sw_W = (Op_W == 6'b101011);
	wire beq_W = (Op_W == 6'b000100);
	wire lui_W = (Op_W == 6'b001111);
	wire j_W = (Op_W == 6'b000010);
	wire jal_W = (Op_W == 6'b000011);
	wire jr_W = (Op_W == 6'b000000 & Funct_W == 6'b001000);
	wire nop_W = (Op_W == 6'b000000 & Funct_W == 6'b000000);
	
	//D classes
	wire Cal_r_D = addu_D | subu_D;
	wire Cal_i_D = ori_D;
	wire Lui_D = lui_D;
	wire Load_D = lw_D;
	wire Store_D = sw_D;
	wire Branch_D = beq_D;
	wire Jal_D = jal_D;
	wire Jr_D = jr_D;
	
	//E classes
	wire Cal_r_E = addu_E | subu_E;
	wire Cal_i_E = ori_E;
	wire Lui_E = lui_E;
	wire Load_E = lw_E;
	wire Store_E = sw_E;
	wire Branch_E = beq_E;
	wire Jal_E = jal_E;
	wire Jr_E = jr_E;
	
	//M classes
	wire Cal_r_M = addu_M | subu_M;
	wire Cal_i_M = ori_M;
	wire Lui_M = lui_M;
	wire Load_M = lw_M;
	wire Store_M = sw_M;
	wire Branch_M = beq_M;
	wire Jal_M = jal_M;
	wire Jr_M = jr_M;
	
	//W classes
	wire Cal_r_W = addu_W | subu_W;
	wire Cal_i_W = ori_W;
	wire Lui_W = lui_W;
	wire Load_W = lw_W;
	wire Store_W = sw_W;
	wire Branch_W = beq_W;
	wire Jal_W = jal_W;
	wire Jr_W = jr_W;
	
	
	////////////////////////////// stall ////////////////////////////////
	
	
	wire Stall_Branch = (
		(Branch_D & Cal_r_E & ((rs_D != 0 & rs_D == rd_E) | (rt_D != 0 & rt_D == rd_E))) |
		(Branch_D & Cal_i_E & ((rs_D != 0 & rs_D == rt_E) | (rt_D != 0 & rt_D == rt_E))) |
		(Branch_D & Load_E & ((rs_D != 0 & rs_D == rt_E) | (rt_D != 0 & rt_D == rt_E))) |
		(Branch_D & Load_M & ((rs_D != 0 & rs_D == rt_M) | (rt_D != 0 & rt_D == rt_M)))
		);
		
	wire Stall_Jr = (
		(Jr_D & Cal_r_E & rs_D != 0 & rs_D == rd_E) |
		(Jr_D & Cal_i_E & rs_D != 0 & rs_D == rt_E) |
		(Jr_D & Load_E & rs_D != 0 & rs_D == rt_E) |
		(Jr_D & Load_M & rs_D != 0 & rs_D == rt_M)
		);
		
	wire Stall_Cal_r = (
		(Cal_r_D & Load_E & ((rs_D != 0 & rs_D == rt_E) | (rt_D != 0 & rt_D == rt_E)))
		);
	
	wire Stall_Cal_i = (
		(Cal_i_D & Load_E & rs_D != 0 & rs_D == rt_E)
		);
		
	wire Stall_Load = (
		(Load_D & Load_E & rs_D != 0 & rs_D == rt_E)
		);
	
	wire Stall_Store = (
		(Store_D & Load_E & rs_D != 0 & rs_D == rt_E)
		);
	
	assign Stall = Stall_Branch | Stall_Jr | Stall_Cal_r | Stall_Cal_i | Stall_Load | Stall_Store;
	
	
	/////////////////////////// forward /////////////////////////////
	
	
	assign Demander_rs_D = Branch_D | Jr_D | Cal_r_D | Cal_i_D | Load_D | Store_D;
	assign Demander_rt_D = Branch_D | Cal_r_D | Store_D;
	assign Demander_rs_E = Cal_r_E | Cal_i_E | Load_E | Store_E;
	assign Demander_rt_E = Cal_r_E | Store_E;
	assign Demander_rt_M = Store_M;
	
	assign RS_D_MUXsel =
		(Demander_rs_D & Lui_E & rs_D != 0 & rs_D == rt_E) ? 1 :
		(Demander_rs_D & Jal_E & rs_D != 0 & rs_D == 31) ? 2 :
		(Demander_rs_D & Cal_r_M & rs_D != 0 & rs_D == rd_M) ? 3 :
		(Demander_rs_D & Cal_i_M & rs_D != 0 & rs_D == rt_M) ? 3 :
		(Demander_rs_D & Lui_M & rs_D != 0 & rs_D == rt_M) ? 4 :
		(Demander_rs_D & Jal_M & rs_D != 0 & rs_D == 31) ? 5 :
		(Demander_rs_D & Cal_r_W & rs_D != 0 & rs_D == rd_W) ? 6 :
		(Demander_rs_D & Cal_i_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Load_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Lui_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Jal_W & rs_D != 0 & rs_D == 31) ? 6 :
		0;
	
	assign RT_D_MUXsel = 
		(Demander_rt_D & Lui_E & rt_D != 0 & rt_D == rt_E) ? 1 :
		(Demander_rt_D & Jal_E & rt_D != 0 & rt_D == 31) ? 2 :
		(Demander_rt_D & Cal_r_M & rt_D != 0 & rt_D == rd_M) ? 3 :
		(Demander_rt_D & Cal_i_M & rt_D != 0 & rt_D == rt_M) ? 3 :
		(Demander_rt_D & Lui_M & rt_D != 0 & rt_D == rt_M) ? 4 :
		(Demander_rt_D & Jal_M & rt_D != 0 & rt_D == 31) ? 5 :
		(Demander_rt_D & Cal_r_W & rt_D != 0 & rt_D == rd_W) ? 6 :
		(Demander_rt_D & Cal_i_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Load_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Lui_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Jal_W & rt_D != 0 & rt_D == 31) ? 6 :
		0;
	
	assign RS_E_MUXsel = 
		(Demander_rs_E & Cal_r_M & rs_E != 0 & rs_E == rd_M) ? 1 :
		(Demander_rs_E & Cal_i_M & rs_E != 0 & rs_E == rt_M) ? 1 :
		(Demander_rs_E & Lui_M & rs_E != 0 & rs_E == rt_M) ? 2 :
		(Demander_rs_E & Jal_M & rs_E != 0 & rs_E == 31) ? 3 :
		(Demander_rs_E & Cal_r_W & rs_E != 0 & rs_E == rd_W) ? 4 :
		(Demander_rs_E & Cal_i_W & rs_E != 0 & rs_E == rt_W) ? 4 :
		(Demander_rs_E & Load_W & rs_E != 0 & rs_E == rt_W) ? 4 :
		(Demander_rs_E & Lui_W & rs_E != 0 & rs_E == rt_W) ? 4: 
		(Demander_rs_E & Jal_W & rs_E != 0 & rs_E == 31) ? 4 :
		0;
		
	assign RT_E_MUXsel = 
		(Demander_rt_E & Cal_r_M & rt_E != 0 & rt_E == rd_M) ? 1 :
		(Demander_rt_E & Cal_i_M & rt_E != 0 & rt_E == rt_M) ? 1 :
		(Demander_rt_E & Lui_M & rt_E != 0 & rt_E == rt_M) ? 2 :
		(Demander_rt_E & Jal_M & rt_E != 0 & rt_E == 31) ? 3 :
		(Demander_rt_E & Cal_r_W & rt_E != 0 & rt_E == rd_W) ? 4 :
		(Demander_rt_E & Cal_i_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Load_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Lui_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Jal_W & rt_E != 0 & rt_E == 31) ? 4 :
		0;
	
	assign RT_M_MUXsel = 
		(Demander_rt_M & Cal_r_W & rt_M != 0 & rt_M == rd_W) ? 1 :
		(Demander_rt_M & Cal_i_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Load_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Lui_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Jal_W & rt_M != 0 & rt_M == 31) ? 1 :
		0;
		
endmodule
