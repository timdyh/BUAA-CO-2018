`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:09 11/24/2018 
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
module im(
	input [31:0] A,
	output [31:0] Instr
    );
	
	integer i;
	
	reg [31:0] ROM[1023:0];
	
	initial begin 
		for (i = 0; i < 1024; i = i + 1)
			ROM[i] = 0;
		$readmemh("code.txt", ROM);
	end
	
	assign Instr = ROM[A[11:2]];
	
endmodule
