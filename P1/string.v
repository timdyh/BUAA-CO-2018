`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:49 10/25/2018 
// Design Name: 
// Module Name:    string 
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
module string(
    input clk,
    input clr,
    input [7:0] in,
    output reg out
    );
	integer state;
	
	initial begin
		state = 0;
		out = 0;
	end
	
	always @(posedge clk or posedge clr) begin
		if (clr) begin
			state = 0;
			out = 0;
		end
		else begin
			if (clr) begin
				state = 0;
				out = 0;
			end
			else begin
				case (state)
					0:  if (in == 42 || in == 43) begin
							state = 3;
							out = 0;
						end
						else begin
							state = 1;
							out = 1;
						end
					1:  if (in == 42 || in == 43) begin
							state = 2;
							out = 0;
						end
						else begin
							state = 3;
							out = 0;
						end
					2:  if (in == 42 || in == 43) begin
							state = 3;
							out = 0;
						end
						else begin
							state = 1;
							out = 1;
						end
					3:  begin 
							state = 3;
							out = 0;
						end
				endcase		
			end
		end
	end

endmodule
