`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:04 11/24/2018 
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
module dm(
	input clk,
	input reset,
	input WE,
	input [31:0] A,
	input [31:0] WD,
	input [31:0] PC_M,
	output [31:0] RD
    );
	
	integer i;
	
	reg [31:0] RAM[1023:0];
	
	assign RD = RAM[A[11:2]];
	
	initial begin
		for (i = 0; i < 1024; i = i + 1)
			RAM[i] = 0;
	end
	
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 1024; i = i + 1)
				RAM[i] = 0;
		else if (WE) begin
			RAM[A[11:2]] = WD;
			$display("%d@%h: *%h <= %h", $time, PC_M, A, WD);
		end
	end
	
endmodule
