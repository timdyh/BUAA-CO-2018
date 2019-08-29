`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:29 11/24/2018 
// Design Name: 
// Module Name:    GRF 
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
module grf(
	input clk,
	input reset,
	input WE,
	input [4:0] A1,
	input [4:0] A2,
	input [4:0] A3,
	input [31:0] WD,
	input [31:0] PC_D,
	input [31:0] PC_W,
	output [31:0] RD1,
	output [31:0] RD2
    );
	
	integer i;
	
	reg [31:0] REG[31:0];
	
	assign RD1 = REG[A1];
	assign RD2 = REG[A2];
	
	initial begin
		for (i = 0; i < 32; i = i + 1)
			REG[i] = 0;
	end
	
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 32; i = i + 1)
				REG[i] = 0;
		else if (WE && A3 != 0) begin
			REG[A3] = WD;
			$display("%d@%h: $%d <= %h", $time, PC_W, A3, WD);
		end
	end
	
endmodule
