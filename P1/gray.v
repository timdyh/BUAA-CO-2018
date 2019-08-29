`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:05 10/25/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output reg [2:0] Output,
    output reg Overflow
    );
	reg [2:0] gray[7:0];
	integer i;
	
	initial begin
		i = 0;
		gray[0] = 3'b000;
		gray[1] = 3'b001;
		gray[2] = 3'b011;
		gray[3] = 3'b010;
		gray[4] = 3'b110;
		gray[5] = 3'b111;
		gray[6] = 3'b101;
		gray[7] = 3'b100;
		Output = gray[0];
		Overflow = 0;
	end
	
	always @(posedge Clk) begin
		if (Reset) begin
			Output = gray[0];
			Overflow = 0;
			i = 0;
		end
		else begin
			if (En) begin
				i = i + 1;
				if (i == 8) begin
					i = 0;
					Overflow = 1;
				end
				Output = gray[i];
			end
		end
	end		

endmodule
