`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:24 09/28/2018 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline(
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] B1,
    input [31:0] B2,
    input clk,
    output reg [31:0] C = 0
    );
	 
	 reg [31:0] C1 = 0, C2 = 0;
	 
	 always @(posedge clk) begin
		C1 <= A1 * B1;
		C2 <= A2 * B2;
		
		C <= C1 + C2;
	end
	
endmodule
