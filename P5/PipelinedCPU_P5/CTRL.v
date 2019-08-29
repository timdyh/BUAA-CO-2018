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
	//E control
	output reg [2:0] ALUsel,
	output reg ALU_B_MUXsel,
	//M control
	output reg DM_WE,
	//W control
	output reg [1:0] GRF_WD_MUXsel,
	output reg GRF_WE
    );
	
	wire [5:0] Op = Instr[`op];
	wire [5:0] Funct = Instr[`funct];
	
	always @(*) begin
		if (Op == 6'b000000 && Funct == 6'b100001) begin	//addu
			PC_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 0;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b100011) begin	//subu
			PC_MUXsel = 0;
			GRF_WE = 1;
			GRF_A3_MUXsel = 0;
			ALUsel = 1;
			ALU_B_MUXsel = 0;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b001101) begin		//ori
			PC_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 1;
			GRF_A3_MUXsel = 1;
			ALUsel = 3;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 0;
		end
		else if (Op == 6'b100011) begin		//lw
			PC_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 0;
			GRF_A3_MUXsel = 1;
			ALUsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 1;
		end
		else if (Op == 6'b101011) begin		//sw
			PC_MUXsel = 0;
			GRF_WE = 0;
			EXTsel = 0;
			ALUsel = 0;
			ALU_B_MUXsel = 1;
			DM_WE = 1;
		end
		else if (Op == 6'b000100) begin		//beq
			PC_MUXsel = 1;
			GRF_WE = 0;
			EXTsel = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b001111) begin		//lui
			PC_MUXsel = 0;
			GRF_WE = 1;
			EXTsel = 2;
			GRF_A3_MUXsel = 1;
			DM_WE = 0;
			GRF_WD_MUXsel = 2;
		end
		else if (Op == 6'b000010) begin		//j
			PC_MUXsel = 2;
			GRF_WE = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b000011) begin		//jal
			PC_MUXsel = 2;
			GRF_WE = 1;
			GRF_A3_MUXsel = 2;
			DM_WE = 0;
			GRF_WD_MUXsel = 3;
		end
		else if (Op == 6'b000000 && Funct == 6'b001000) begin	//jr
			PC_MUXsel = 3;
			GRF_WE = 0;
			DM_WE = 0;
		end
		else if (Op == 6'b000000 && Funct == 6'b000000) begin	//nop
			PC_MUXsel = 0;
			GRF_WE = 0;
			DM_WE = 0;
		end
	end

endmodule
