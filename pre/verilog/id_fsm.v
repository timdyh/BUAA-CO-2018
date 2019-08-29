`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:47 09/28/2018 
// Design Name: 
// Module Name:    id_fsm 
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
module id_fsm(
    input [7:0] char,
    input clk,
    output reg out
    );
	 
	integer state = 0;
	 
	always @(posedge clk) begin
		case (state)
			0: begin
				if ((char >= 8'h41 && char <= 8'h5a) || (char >= 8'h61 && char <= 8'h7a))
					state <= 1;
				else
					state <= 0;
				out <= 0;
			end
			1: begin
				if ((char >= 8'h41 && char <= 8'h5a) || (char >= 8'h61 && char <= 8'h7a))
					state <= 1;
				else if (char >= 8'h30 && char <= 8'h39)
					state <= 2;
				else
					state <= 0;
				out <= (char >= 8'h30 && char <= 8'h39) ? 1 : 0;
			end
			2: begin
				if ((char >= 8'h41 && char <= 8'h5a) || (char >= 8'h61 && char <= 8'h7a))
					state <= 1;
				else if (char >= 8'h30 && char <= 8'h39)
					state <= 2;
				else 
					state <= 0;
				out <= (char >= 8'h30 && char <= 8'h39) ? 1 : 0;
			end
		endcase
	end 

endmodule
