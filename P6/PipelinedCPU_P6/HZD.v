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
	input Start,
	input Busy,
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
	wire lui_D = (Op_D == 6'b001111);
	wire j_D = (Op_D == 6'b000010);
	wire jal_D = (Op_D == 6'b000011);
	wire jr_D = (Op_D == 6'b000000 & Funct_D == 6'b001000);
	wire jalr_D = (Op_D == 6'b000000 & Funct_D == 6'b001001);
	wire and_D = (Op_D == 6'b000000 & Funct_D == 6'b100100);
	wire or_D = (Op_D == 6'b000000 & Funct_D == 6'b100101);
	wire xor_D = (Op_D == 6'b000000 & Funct_D == 6'b100110);
	wire nor_D = (Op_D == 6'b000000 & Funct_D == 6'b100111);
	wire add_D = (Op_D == 6'b000000 & Funct_D == 6'b100000);
	wire sub_D = (Op_D == 6'b000000 & Funct_D == 6'b100010);
	wire addi_D = (Op_D == 6'b001000);
	wire addiu_D = (Op_D == 6'b001001);
	wire andi_D = (Op_D == 6'b001100);
	wire xori_D = (Op_D == 6'b001110);
	wire beq_D = (Op_D == 6'b000100);
	wire bne_D = (Op_D == 6'b000101);
	wire blez_D = (Op_D == 6'b000110);
	wire bgtz_D = (Op_D == 6'b000111);
	wire bltz_D = (Op_D == 6'b000001 & rt_D == 5'b00000);
	wire bgez_D = (Op_D == 6'b000001 & rt_D == 5'b00001);
	wire sllv_D = (Op_D == 6'b000000 & Funct_D == 6'b000100);
	wire srlv_D = (Op_D == 6'b000000 & Funct_D == 6'b000110);
	wire srav_D = (Op_D == 6'b000000 & Funct_D == 6'b000111);
	wire sll_D = (Op_D == 6'b000000 & Funct_D == 6'b000000);
	wire srl_D = (Op_D == 6'b000000 & Funct_D == 6'b000010);
	wire sra_D = (Op_D == 6'b000000 & Funct_D == 6'b000011);
	wire slt_D = (Op_D == 6'b000000 & Funct_D == 6'b101010);
	wire sltu_D = (Op_D == 6'b000000 & Funct_D == 6'b101011);
	wire slti_D = (Op_D == 6'b001010);
	wire sltiu_D = (Op_D == 6'b001011);
	wire sw_D = (Op_D == 6'b101011);
	wire sh_D = (Op_D == 6'b101001);
	wire sb_D = (Op_D == 6'b101000);
	wire lw_D = (Op_D == 6'b100011);
	wire lh_D = (Op_D == 6'b100001);
	wire lhu_D = (Op_D == 6'b100101);
	wire lb_D = (Op_D == 6'b100000);
	wire lbu_D = (Op_D == 6'b100100);
	wire mult_D = (Op_D == 6'b000000 & Funct_D == 6'b011000);
	wire multu_D = (Op_D == 6'b000000 & Funct_D == 6'b011001);
	wire div_D = (Op_D == 6'b000000 & Funct_D == 6'b011010);
	wire divu_D = (Op_D == 6'b000000 & Funct_D == 6'b011011);
	wire mtlo_D = (Op_D == 6'b000000 & Funct_D == 6'b010011);
	wire mthi_D = (Op_D == 6'b000000 & Funct_D == 6'b010001);
	wire mflo_D = (Op_D == 6'b000000 & Funct_D == 6'b010010);
	wire mfhi_D = (Op_D == 6'b000000 & Funct_D == 6'b010000);
	
	//E instructions
	wire addu_E = (Op_E == 6'b000000 & Funct_E == 6'b100001);
	wire subu_E = (Op_E == 6'b000000 & Funct_E == 6'b100011);
	wire ori_E = (Op_E == 6'b001101);
	wire lui_E = (Op_E == 6'b001111);
	wire j_E = (Op_E == 6'b000010);
	wire jal_E = (Op_E == 6'b000011);
	wire jr_E = (Op_E == 6'b000000 & Funct_E == 6'b001000);
	wire jalr_E = (Op_E == 6'b000000 & Funct_E == 6'b001001);
	wire and_E = (Op_E == 6'b000000 & Funct_E == 6'b100100);
	wire or_E = (Op_E == 6'b000000 & Funct_E == 6'b100101);
	wire xor_E = (Op_E == 6'b000000 & Funct_E == 6'b100110);
	wire nor_E = (Op_E == 6'b000000 & Funct_E == 6'b100111);
	wire add_E = (Op_E == 6'b000000 & Funct_E == 6'b100000);
	wire sub_E = (Op_E == 6'b000000 & Funct_E == 6'b100010);
	wire addi_E = (Op_E == 6'b001000);
	wire addiu_E = (Op_E == 6'b001001);
	wire andi_E = (Op_E == 6'b001100);
	wire xori_E = (Op_E == 6'b001110);
	wire beq_E = (Op_E == 6'b000100);
	wire bne_E = (Op_E == 6'b000101);
	wire blez_E = (Op_E == 6'b000110);
	wire bgtz_E = (Op_E == 6'b000111);
	wire bltz_E = (Op_E == 6'b000001 & rt_E == 5'b00000);
	wire bgez_E = (Op_E == 6'b000001 & rt_E == 5'b00001);
	wire sllv_E = (Op_E == 6'b000000 & Funct_E == 6'b000100);
	wire srlv_E = (Op_E == 6'b000000 & Funct_E == 6'b000110);
	wire srav_E = (Op_E == 6'b000000 & Funct_E == 6'b000111);
	wire sll_E = (Op_E == 6'b000000 & Funct_E == 6'b000000);
	wire srl_E = (Op_E == 6'b000000 & Funct_E == 6'b000010);
	wire sra_E = (Op_E == 6'b000000 & Funct_E == 6'b000011);
	wire slt_E = (Op_E == 6'b000000 & Funct_E == 6'b101010);
	wire sltu_E = (Op_E == 6'b000000 & Funct_E == 6'b101011);
	wire slti_E = (Op_E == 6'b001010);
	wire sltiu_E = (Op_E == 6'b001011);
	wire sw_E = (Op_E == 6'b101011);
	wire sh_E = (Op_E == 6'b101001);
	wire sb_E = (Op_E == 6'b101000);
	wire lw_E = (Op_E == 6'b100011);
	wire lh_E = (Op_E == 6'b100001);
	wire lhu_E = (Op_E == 6'b100101);
	wire lb_E = (Op_E == 6'b100000);
	wire lbu_E = (Op_E == 6'b100100);
	wire mult_E = (Op_E == 6'b000000 & Funct_E == 6'b011000);
	wire multu_E = (Op_E == 6'b000000 & Funct_E == 6'b011001);
	wire div_E = (Op_E == 6'b000000 & Funct_E == 6'b011010);
	wire divu_E = (Op_E == 6'b000000 & Funct_E == 6'b011011);
	wire mtlo_E = (Op_E == 6'b000000 & Funct_E == 6'b010011);
	wire mthi_E = (Op_E == 6'b000000 & Funct_E == 6'b010001);
	wire mflo_E = (Op_E == 6'b000000 & Funct_E == 6'b010010);
	wire mfhi_E = (Op_E == 6'b000000 & Funct_E == 6'b010000);
	
	//M instructions
	wire addu_M = (Op_M == 6'b000000 & Funct_M == 6'b100001);
	wire subu_M = (Op_M == 6'b000000 & Funct_M == 6'b100011);
	wire ori_M = (Op_M == 6'b001101);
	wire lui_M = (Op_M == 6'b001111);
	wire j_M = (Op_M == 6'b000010);
	wire jal_M = (Op_M == 6'b000011);
	wire jr_M = (Op_M == 6'b000000 & Funct_M == 6'b001000);
	wire jalr_M = (Op_M == 6'b000000 & Funct_M == 6'b001001);
	wire and_M = (Op_M == 6'b000000 & Funct_M == 6'b100100);
	wire or_M = (Op_M == 6'b000000 & Funct_M == 6'b100101);
	wire xor_M = (Op_M == 6'b000000 & Funct_M == 6'b100110);
	wire nor_M = (Op_M == 6'b000000 & Funct_M == 6'b100111);
	wire add_M = (Op_M == 6'b000000 & Funct_M == 6'b100000);
	wire sub_M = (Op_M == 6'b000000 & Funct_M == 6'b100010);
	wire addi_M = (Op_M == 6'b001000);
	wire addiu_M = (Op_M == 6'b001001);
	wire andi_M = (Op_M == 6'b001100);
	wire xori_M = (Op_M == 6'b001110);
	wire beq_M = (Op_M == 6'b000100);
	wire bne_M = (Op_M == 6'b000101);
	wire blez_M = (Op_M == 6'b000110);
	wire bgtz_M = (Op_M == 6'b000111);
	wire bltz_M = (Op_M == 6'b000001 & rt_M == 5'b00000);
	wire bgez_M = (Op_M == 6'b000001 & rt_M == 5'b00001);
	wire sllv_M = (Op_M == 6'b000000 & Funct_M == 6'b000100);
	wire srlv_M = (Op_M == 6'b000000 & Funct_M == 6'b000110);
	wire srav_M = (Op_M == 6'b000000 & Funct_M == 6'b000111);
	wire sll_M = (Op_M == 6'b000000 & Funct_M == 6'b000000);
	wire srl_M = (Op_M == 6'b000000 & Funct_M == 6'b000010);
	wire sra_M = (Op_M == 6'b000000 & Funct_M == 6'b000011);
	wire slt_M = (Op_M == 6'b000000 & Funct_M == 6'b101010);
	wire sltu_M = (Op_M == 6'b000000 & Funct_M == 6'b101011);
	wire slti_M = (Op_M == 6'b001010);
	wire sltiu_M = (Op_M == 6'b001011);
	wire sw_M = (Op_M == 6'b101011);
	wire sh_M = (Op_M == 6'b101001);
	wire sb_M = (Op_M == 6'b101000);
	wire lw_M = (Op_M == 6'b100011);
	wire lh_M = (Op_M == 6'b100001);
	wire lhu_M = (Op_M == 6'b100101);
	wire lb_M = (Op_M == 6'b100000);
	wire lbu_M = (Op_M == 6'b100100);
	wire mult_M = (Op_M == 6'b000000 & Funct_M == 6'b011000);
	wire multu_M = (Op_M == 6'b000000 & Funct_M == 6'b011001);
	wire div_M = (Op_M == 6'b000000 & Funct_M == 6'b011010);
	wire divu_M = (Op_M == 6'b000000 & Funct_M == 6'b011011);
	wire mtlo_M = (Op_M == 6'b000000 & Funct_M == 6'b010011);
	wire mthi_M = (Op_M == 6'b000000 & Funct_M == 6'b010001);
	wire mflo_M = (Op_M == 6'b000000 & Funct_M == 6'b010010);
	wire mfhi_M = (Op_M == 6'b000000 & Funct_M == 6'b010000);
	
	//W instructions
	wire addu_W = (Op_W == 6'b000000 & Funct_W == 6'b100001);
	wire subu_W = (Op_W == 6'b000000 & Funct_W == 6'b100011);
	wire ori_W = (Op_W == 6'b001101);
	wire lui_W = (Op_W == 6'b001111);
	wire j_W = (Op_W == 6'b000010);
	wire jal_W = (Op_W == 6'b000011);
	wire jr_W = (Op_W == 6'b000000 & Funct_W == 6'b001000);
	wire jalr_W = (Op_W == 6'b000000 & Funct_W == 6'b001001);
	wire and_W = (Op_W == 6'b000000 & Funct_W == 6'b100100);
	wire or_W = (Op_W == 6'b000000 & Funct_W == 6'b100101);
	wire xor_W = (Op_W == 6'b000000 & Funct_W == 6'b100110);
	wire nor_W = (Op_W == 6'b000000 & Funct_W == 6'b100111);
	wire add_W = (Op_W == 6'b000000 & Funct_W == 6'b100000);
	wire sub_W = (Op_W == 6'b000000 & Funct_W == 6'b100010);
	wire addi_W = (Op_W == 6'b001000);
	wire addiu_W = (Op_W == 6'b001001);
	wire andi_W = (Op_W == 6'b001100);
	wire xori_W = (Op_W == 6'b001110);
	wire beq_W = (Op_W == 6'b000100);
	wire bne_W = (Op_W == 6'b000101);
	wire blez_W = (Op_W == 6'b000110);
	wire bgtz_W = (Op_W == 6'b000111);
	wire bltz_W = (Op_W == 6'b000001 & rt_W == 5'b00000);
	wire bgez_W = (Op_W == 6'b000001 & rt_W == 5'b00001);
	wire sllv_W = (Op_W == 6'b000000 & Funct_W == 6'b000100);
	wire srlv_W = (Op_W == 6'b000000 & Funct_W == 6'b000110);
	wire srav_W = (Op_W == 6'b000000 & Funct_W == 6'b000111);
	wire sll_W = (Op_W == 6'b000000 & Funct_W == 6'b000000);
	wire srl_W = (Op_W == 6'b000000 & Funct_W == 6'b000010);
	wire sra_W = (Op_W == 6'b000000 & Funct_W == 6'b000011);
	wire slt_W = (Op_W == 6'b000000 & Funct_W == 6'b101010);
	wire sltu_W = (Op_W == 6'b000000 & Funct_W == 6'b101011);
	wire slti_W = (Op_W == 6'b001010);
	wire sltiu_W = (Op_W == 6'b001011);
	wire sw_W = (Op_W == 6'b101011);
	wire sh_W = (Op_W == 6'b101001);
	wire sb_W = (Op_W == 6'b101000);
	wire lw_W = (Op_W == 6'b100011);
	wire lh_W = (Op_W == 6'b100001);
	wire lhu_W = (Op_W == 6'b100101);
	wire lb_W = (Op_W == 6'b100000);
	wire lbu_W = (Op_W == 6'b100100);
	wire mult_W = (Op_W == 6'b000000 & Funct_W == 6'b011000);
	wire multu_W = (Op_W == 6'b000000 & Funct_W == 6'b011001);
	wire div_W = (Op_W == 6'b000000 & Funct_W == 6'b011010);
	wire divu_W = (Op_W == 6'b000000 & Funct_W == 6'b011011);
	wire mtlo_W = (Op_W == 6'b000000 & Funct_W == 6'b010011);
	wire mthi_W = (Op_W == 6'b000000 & Funct_W == 6'b010001);
	wire mflo_W = (Op_W == 6'b000000 & Funct_W == 6'b010010);
	wire mfhi_W = (Op_W == 6'b000000 & Funct_W == 6'b010000);
	
	//D classes
	wire Cal_r_D = addu_D | subu_D | and_D | or_D | xor_D | nor_D | add_D | sub_D | sllv_D | srlv_D | srav_D | slt_D | sltu_D | mult_D | multu_D | div_D | divu_D | mtlo_D | mthi_D | mflo_D | mfhi_D;
	wire Cal_i_D = ori_D | addi_D | addiu_D | andi_D | xori_D | slti_D | sltiu_D;
	wire Lui_D = lui_D;
	wire Load_D = lw_D | lh_D | lhu_D | lb_D | lbu_D;
	wire Store_D = sw_D | sh_D | sb_D;
	wire Branch_D = beq_D | bne_D | blez_D | bgtz_D | bltz_D | bgez_D;
	wire Jal_D = jal_D;
	wire Jr_D = jr_D;
	wire Jalr_D = jalr_D;
	wire Shift_D = sll_D | srl_D | sra_D;
	
	//E classes
	wire Cal_r_E = addu_E | subu_E | and_E | or_E | xor_E | nor_E | add_E | sub_E | sllv_E | srlv_E | srav_E | slt_E | sltu_E | mult_E | multu_E | div_E | divu_E | mtlo_E | mthi_E | mflo_E | mfhi_E;
	wire Cal_i_E = ori_E | addi_E | addiu_E | andi_E | xori_E | slti_E | sltiu_E;
	wire Lui_E = lui_E;
	wire Load_E = lw_E | lh_E | lhu_E | lb_E | lbu_E;
	wire Store_E = sw_E | sh_E | sb_E;
	wire Branch_E = beq_E | bne_E | blez_E | bgtz_E | bltz_E | bgez_E;
	wire Jal_E = jal_E;
	wire Jr_E = jr_E;
	wire Jalr_E = jalr_E;
	wire Shift_E = sll_E | srl_E | sra_E;
	
	//M classes
	wire Cal_r_M = addu_M | subu_M | and_M | or_M | xor_M | nor_M | add_M | sub_M | sllv_M | srlv_M | srav_M | slt_M | sltu_M | mult_M | multu_M | div_M | divu_M | mtlo_M | mthi_M | mflo_M | mfhi_M;
	wire Cal_i_M = ori_M | addi_M | addiu_M | andi_M | xori_M | slti_M | sltiu_M;
	wire Lui_M = lui_M;
	wire Load_M = lw_M | lh_M | lhu_M | lb_M | lbu_M;
	wire Store_M = sw_M | sh_M | sb_M;
	wire Branch_M = beq_M | bne_M | blez_M | bgtz_M | bltz_M | bgez_M;
	wire Jal_M = jal_M;
	wire Jr_M = jr_M;
	wire Jalr_M = jalr_M;
	wire Shift_M = sll_M | srl_M | sra_M;
	
	//W classes
	wire Cal_r_W = addu_W | subu_W | and_W | or_W | xor_W | nor_W | add_W | sub_W | sllv_W | srlv_W | srav_W | slt_W | sltu_W | mult_W | multu_W | div_W | divu_W | mtlo_W | mthi_W | mflo_W | mfhi_W;
	wire Cal_i_W = ori_W | addi_W | addiu_W | andi_W | xori_W | slti_W | sltiu_W;
	wire Lui_W = lui_W;
	wire Load_W = lw_W | lh_W | lhu_W | lb_W | lbu_W;
	wire Store_W = sw_W | sh_W | sb_W;
	wire Branch_W = beq_W | bne_W | blez_W | bgtz_W | bltz_W | bgez_W;
	wire Jal_W = jal_W;
	wire Jr_W = jr_W;
	wire Jalr_W = jalr_W;
	wire Shift_W = sll_W | srl_W | sra_W;
	
	
	////////////////////////////// stall ////////////////////////////////
	
	
	wire Stall_Branch = (
		(Branch_D & Cal_r_E & ((rs_D != 0 & rs_D == rd_E) | (rt_D != 0 & rt_D == rd_E))) |
		(Branch_D & Cal_i_E & ((rs_D != 0 & rs_D == rt_E) | (rt_D != 0 & rt_D == rt_E))) |
		(Branch_D & Shift_E & ((rs_D != 0 & rs_D == rd_E) | (rt_D != 0 & rt_D == rd_E))) |
		(Branch_D & Load_E & ((rs_D != 0 & rs_D == rt_E) | (rt_D != 0 & rt_D == rt_E))) |
		(Branch_D & Load_M & ((rs_D != 0 & rs_D == rt_M) | (rt_D != 0 & rt_D == rt_M)))
		);
		
	wire Stall_Jr = (
		(Jr_D & Cal_r_E & rs_D != 0 & rs_D == rd_E) |
		(Jr_D & Cal_i_E & rs_D != 0 & rs_D == rt_E) |
		(Jr_D & Shift_E & rs_D != 0 & rs_D == rd_E) |
		(Jr_D & Load_E & rs_D != 0 & rs_D == rt_E) |
		(Jr_D & Load_M & rs_D != 0 & rs_D == rt_M)
		);
		
	wire Stall_Jalr = (
		(Jalr_D & Cal_r_E & rs_D != 0 & rs_D == rd_E) |
		(Jalr_D & Cal_i_E & rs_D != 0 & rs_D == rt_E) |
		(Jalr_D & Shift_E & rs_D != 0 & rs_D == rd_E) |
		(Jalr_D & Load_E & rs_D != 0 & rs_D == rt_E) |
		(Jalr_D & Load_M & rs_D != 0 & rs_D == rt_M)
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
	
	wire Stall_Shift = (
		(Shift_D & Load_E & rt_D != 0 & rt_D == rt_E)
		);
	
	wire MultDiv_D = mult_D | multu_D | div_D | divu_D | mtlo_D | mthi_D | mflo_D | mfhi_D;
	wire Stall_MultDiv = MultDiv_D & (Start | Busy);
	
	assign Stall = Stall_Branch | Stall_Jr | Stall_Jalr | Stall_Cal_r | Stall_Cal_i | Stall_Load | Stall_Store | Stall_Shift | Stall_MultDiv;
	
	
	/////////////////////////// forward /////////////////////////////
	
	
	assign Demander_rs_D = Branch_D | Jr_D | Jalr_D | Cal_r_D | Cal_i_D | Load_D | Store_D;
	assign Demander_rt_D = Branch_D | Cal_r_D | Store_D | Shift_D;
	assign Demander_rs_E = Cal_r_E | Cal_i_E | Load_E | Store_E;
	assign Demander_rt_E = Cal_r_E | Store_E | Shift_E;
	assign Demander_rt_M = Store_M;
	
	assign RS_D_MUXsel =
		(Demander_rs_D & Lui_E & rs_D != 0 & rs_D == rt_E) ? 1 :
		(Demander_rs_D & Jal_E & rs_D != 0 & rs_D == 31) ? 2 :
		(Demander_rs_D & Jalr_E & rs_D != 0 & rs_D == rd_E) ? 2 :
		(Demander_rs_D & Cal_r_M & rs_D != 0 & rs_D == rd_M) ? 3 :
		(Demander_rs_D & Cal_i_M & rs_D != 0 & rs_D == rt_M) ? 3 :
		(Demander_rs_D & Shift_M & rs_D != 0 & rs_D == rd_M) ? 3 :
		(Demander_rs_D & Lui_M & rs_D != 0 & rs_D == rt_M) ? 4 :
		(Demander_rs_D & Jal_M & rs_D != 0 & rs_D == 31) ? 5 :
		(Demander_rs_D & Jalr_M & rs_D != 0 & rs_D == rd_M) ? 5 :
		(Demander_rs_D & Cal_r_W & rs_D != 0 & rs_D == rd_W) ? 6 :
		(Demander_rs_D & Cal_i_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Shift_W & rs_D != 0 & rs_D == rd_W) ? 6 :
		(Demander_rs_D & Load_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Lui_W & rs_D != 0 & rs_D == rt_W) ? 6 :
		(Demander_rs_D & Jal_W & rs_D != 0 & rs_D == 31) ? 6 :
		(Demander_rs_D & Jalr_W & rs_D != 0 & rs_D == rd_W) ? 6 :
		0;
	
	assign RT_D_MUXsel = 
		(Demander_rt_D & Lui_E & rt_D != 0 & rt_D == rt_E) ? 1 :
		(Demander_rt_D & Jal_E & rt_D != 0 & rt_D == 31) ? 2 :
		(Demander_rt_D & Jalr_E & rt_D != 0 & rt_D == rd_E) ? 2 :
		(Demander_rt_D & Cal_r_M & rt_D != 0 & rt_D == rd_M) ? 3 :
		(Demander_rt_D & Cal_i_M & rt_D != 0 & rt_D == rt_M) ? 3 :
		(Demander_rt_D & Shift_M & rt_D != 0 & rt_D == rd_M) ? 3 :
		(Demander_rt_D & Lui_M & rt_D != 0 & rt_D == rt_M) ? 4 :
		(Demander_rt_D & Jal_M & rt_D != 0 & rt_D == 31) ? 5 :
		(Demander_rt_D & Jalr_M & rt_D != 0 & rt_D == rd_M) ? 5 :
		(Demander_rt_D & Cal_r_W & rt_D != 0 & rt_D == rd_W) ? 6 :
		(Demander_rt_D & Cal_i_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Shift_W & rt_D != 0 & rt_D == rd_W) ? 6 :
		(Demander_rt_D & Load_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Lui_W & rt_D != 0 & rt_D == rt_W) ? 6 :
		(Demander_rt_D & Jal_W & rt_D != 0 & rt_D == 31) ? 6 :
		(Demander_rt_D & Jalr_W & rt_D != 0 & rt_D == rd_W) ? 6 :
		0;
	
	assign RS_E_MUXsel = 
		(Demander_rs_E & Cal_r_M & rs_E != 0 & rs_E == rd_M) ? 1 :
		(Demander_rs_E & Cal_i_M & rs_E != 0 & rs_E == rt_M) ? 1 :
		(Demander_rs_E & Shift_M & rs_E != 0 & rs_E == rd_M) ? 1 :
		(Demander_rs_E & Lui_M & rs_E != 0 & rs_E == rt_M) ? 2 :
		(Demander_rs_E & Jal_M & rs_E != 0 & rs_E == 31) ? 3 :
		(Demander_rs_E & Jalr_M & rs_E != 0 & rs_E == rd_M) ? 3 :
		(Demander_rs_E & Cal_r_W & rs_E != 0 & rs_E == rd_W) ? 4 :
		(Demander_rs_E & Cal_i_W & rs_E != 0 & rs_E == rt_W) ? 4 :
		(Demander_rs_E & Shift_W & rs_E != 0 & rs_E == rd_W) ? 4 :
		(Demander_rs_E & Load_W & rs_E != 0 & rs_E == rt_W) ? 4 :
		(Demander_rs_E & Lui_W & rs_E != 0 & rs_E == rt_W) ? 4: 
		(Demander_rs_E & Jal_W & rs_E != 0 & rs_E == 31) ? 4 :
		(Demander_rs_E & Jalr_W & rs_E != 0 & rs_E == rd_W) ? 4 :
		0;
		
	assign RT_E_MUXsel = 
		(Demander_rt_E & Cal_r_M & rt_E != 0 & rt_E == rd_M) ? 1 :
		(Demander_rt_E & Cal_i_M & rt_E != 0 & rt_E == rt_M) ? 1 :
		(Demander_rt_E & Shift_M & rt_E != 0 & rt_E == rd_M) ? 1 :
		(Demander_rt_E & Lui_M & rt_E != 0 & rt_E == rt_M) ? 2 :
		(Demander_rt_E & Jal_M & rt_E != 0 & rt_E == 31) ? 3 :
		(Demander_rt_E & Jalr_M & rt_E != 0 & rt_E == rd_M) ? 3 :
		(Demander_rt_E & Cal_r_W & rt_E != 0 & rt_E == rd_W) ? 4 :
		(Demander_rt_E & Cal_i_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Shift_W & rt_E != 0 & rt_E == rd_W) ? 4 :
		(Demander_rt_E & Load_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Lui_W & rt_E != 0 & rt_E == rt_W) ? 4 :
		(Demander_rt_E & Jal_W & rt_E != 0 & rt_E == 31) ? 4 :
		(Demander_rt_E & Jalr_W & rt_E != 0 & rt_E == rd_W) ? 4 :	
		0;
	
	assign RT_M_MUXsel = 
		(Demander_rt_M & Cal_r_W & rt_M != 0 & rt_M == rd_W) ? 1 :
		(Demander_rt_M & Cal_i_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Shift_W & rt_M != 0 & rt_M == rd_W) ? 1 :
		(Demander_rt_M & Load_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Lui_W & rt_M != 0 & rt_M == rt_W) ? 1 :
		(Demander_rt_M & Jal_W & rt_M != 0 & rt_M == 31) ? 1 :
		(Demander_rt_M & Jalr_W & rt_M != 0 & rt_M == rd_W) ? 1 :
		0;
		
endmodule
