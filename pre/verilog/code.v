`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:24 09/28/2018 
// Design Name: 
// Module Name:    code 
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
module code(
    input Clk,
    input Reset,
    input Slt,
    input En,
    output reg [63:0] Output0,
    output reg [63:0] Output1
	 //output reg  cnt
    );
	
	reg [2:0] cnt;
	
	initial begin
		Output0 = 0;
		Output1 = 0;
		cnt = 0;
	end
	
	always @(posedge Clk) begin
		if (Reset) begin
			Output0 = 0;
			Output1 = 0;
			cnt = 0;
		end
		else if (En) begin
			if (Slt)
				cnt = cnt + 1;
			else
				Output0 = Output0 + 1;
		end
		if (cnt == 4) begin
			Output1 = Output1 + 1;
			cnt = 0;
		end
	end

endmodule
