`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:21 11/24/2018 
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
module pc(
	input clk,
	input reset,
	input En,
	input [31:0] nPC,
	output reg [31:0] PC = 32'h00003000
    );
	
	always @(posedge clk) begin
		if (reset)
			PC = 32'h00003000;
		else if (En)
			PC = nPC;
	end
	
endmodule
