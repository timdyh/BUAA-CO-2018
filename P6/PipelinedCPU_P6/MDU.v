`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:34 12/02/2018 
// Design Name: 
// Module Name:    MDU 
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
module mdu(	
	input clk,
	input reset,
	input Start,
	input RDsel,
	input [31:0] A,
	input [31:0] B,
	input [2:0] Op,
	output [31:0] Out,
	output reg Busy = 0
    );
	
	reg [31:0] LO = 0;
	reg [31:0] HI = 0;

	integer mult_cnt = 0;
	integer div_cnt = 0; 
	
	assign Out = (RDsel == 0) ? LO : HI;					//mflo, mfhi
	
	always @(posedge clk) begin
		if (reset) begin
			Busy = 0;
			HI = 0;
			LO = 0;
			mult_cnt = 0;
			div_cnt = 0;
		end
		else begin
			case (Op)
				0:	;										//do nothing
				1:	{HI, LO} = $signed(A) * $signed(B);		//mult
				2:	{HI, LO} = A * B;						//multu
				3:	if (B != 0) begin						//div
						LO = $signed(A) / $signed(B);
						HI = $signed(A) % $signed(B);
					end
				4:	if (B != 0) begin						//divu
						LO = A / B;
						HI = A % B;
					end
				5:	LO = A;									//mtlo
				6: 	HI = A;									//mthi
			endcase
				
			if (Start) begin
				if (Op == 1 || Op == 2) begin
					Busy = 1;
					mult_cnt = 1;
				end
				else if (Op == 3 || Op == 4) begin
					Busy = 1;
					div_cnt = 1;
				end
			end
			else begin
				if (mult_cnt == 5) begin
					Busy = 0;
					mult_cnt = 0;
				end
				else if (div_cnt == 10) begin
					Busy = 0;
					div_cnt = 0;
				end
				else if (mult_cnt != 0)
					mult_cnt = mult_cnt + 1;
				else if (div_cnt != 0)
					div_cnt = div_cnt + 1;
			end
		end
	end

endmodule
