`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:26 11/24/2018 
// Design Name: 
// Module Name:    PCCAL 
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
module pccal(
	input [31:0] Base,
	input [31:0] ImmB,
	input [25:0] ImmJ,
	input [31:0] Cmp1,
	input [31:0] Cmp2,
	input [2:0] CmpOp,
	output [31:0] JumpA,
	output reg [31:0] BranchA
    );
	
	assign JumpA = {Base[31:28], ImmJ, 2'b00};
	
	always @(*) begin
		case (CmpOp)
			0: BranchA = ($signed(Cmp1) == $signed(Cmp2)) ? (Base + (ImmB << 2)) : (Base + 4);		//beq
			1: BranchA = ($signed(Cmp1) != $signed(Cmp2)) ? (Base + (ImmB << 2)) : (Base + 4);		//bne
			2: BranchA = ($signed(Cmp1) <= 0) ? (Base + (ImmB << 2)) : (Base + 4);					//blez
			3: BranchA = ($signed(Cmp1) > 0) ? (Base + (ImmB << 2)) : (Base + 4);					//bgtz
			4: BranchA = ($signed(Cmp1) < 0) ? (Base + (ImmB << 2)) : (Base + 4);					//bltz
			5: BranchA = ($signed(Cmp1) >= 0) ? (Base + (ImmB << 2)) : (Base + 4);					//bgez
		endcase
	end

endmodule
