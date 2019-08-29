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
	output [31:0] BeqA,
	output [31:0] JumpA
    );
	
	assign BeqA = (Cmp1 == Cmp2) ? (Base + (ImmB << 2)) : (Base + 4);
	assign JumpA = {Base[31:28], ImmJ, 2'b00};
	
endmodule
