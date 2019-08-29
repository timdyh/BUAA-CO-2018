`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:20 11/17/2018 
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
module GRF(
	input clk,
	input reset,
	input WriteEn,
	input [4:0] Addr1,
	input [4:0] Addr2,
	input [4:0] Addr3,
	input [31:0] WriteData,
	input [31:0] PC,	//test
	output [31:0] ReadData1,
	output [31:0] ReadData2
    );
	
	integer i;
	
	reg [31:0] REG[31:0];
	
	assign ReadData1 = REG[Addr1];
	assign ReadData2 = REG[Addr2];
	
	initial begin
		for (i = 0; i < 32; i = i + 1)
			REG[i] = 0;
	end
	
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 32; i = i + 1)
				REG[i] = 0;
		else if (WriteEn && Addr3 != 0) begin
			REG[Addr3] = WriteData;
			$display("@%h: $%d <= %h", PC, Addr3, WriteData);
		end
	end
	
endmodule
