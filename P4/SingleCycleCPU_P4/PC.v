`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:54 11/17/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input clk,
	input reset,
	input [31:0] nPC,
	output reg [31:0] PC
    );
	
	initial PC = 32'h00003000;
	
	always @(posedge clk) begin
		if (reset)
			PC = 32'h00003000;
		else
			PC = nPC;
	end
	
endmodule
