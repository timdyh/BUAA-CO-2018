`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:56 11/17/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [31:0] A,
	input [31:0] B,
	input [2:0] ALUOp,
	output reg [31:0] ALUResult,
	output reg Zero
    );
	
	always @(*) begin
		case (ALUOp)
			0: ALUResult = A + B;
			1: ALUResult = A - B;
			2: ALUResult = A & B;
			3: ALUResult = A | B;
		endcase
		
		Zero = (ALUResult == 0) ? 1 : 0;
	end
	
endmodule
