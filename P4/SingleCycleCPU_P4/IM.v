`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:40 11/17/2018 
// Design Name: 
// Module Name:    IM 
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
module IM(
	input [31:0] Addr,
	output [31:0] Instr
    );
	
	integer i;
	
	reg [31:0] ROM[1023:0];
	
	initial begin 
		for (i = 0; i < 1024; i = i + 1)
			ROM[i] = 0;
		$readmemh("code.txt", ROM);
	end
	
	assign Instr = ROM[Addr[11:2]];
	
endmodule
