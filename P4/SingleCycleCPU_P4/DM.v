`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:40 11/17/2018 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input clk,
	input reset,
	input WriteEn,
	input [31:0] Addr,
	input [31:0] WriteData,
	input [31:0] PC,	//test
	output [31:0] ReadData
    );
	
	integer i;
	
	reg [31:0] RAM[1023:0];
	
	assign ReadData = RAM[Addr[11:2]];
	
	initial begin
		for (i = 0; i < 1024; i = i + 1)
			RAM[i] = 0;
	end
	
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 1024; i = i + 1)
				RAM[i] = 0;
		else if (WriteEn) begin
			RAM[Addr[11:2]] = WriteData;
			$display("@%h: *%h <= %h", PC, Addr, WriteData);
		end
	end
	
endmodule
