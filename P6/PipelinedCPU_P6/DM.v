`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:04 11/24/2018 
// Design Name: 
// Module Name:    DM 
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
module dm(
	input clk,
	input reset,
	input WE,
	input [1:0] StoreType,
	input [2:0] LoadType,
	input [31:0] A,
	input [31:0] WD,
	input [31:0] PC_M,
	output reg [31:0] RD
    );
	
	integer i;
	
	reg [31:0] RAM[4095:0];
	
	initial begin
		for (i = 0; i < 4096; i = i + 1)
			RAM[i] = 0;
	end
	
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 4096; i = i + 1)
				RAM[i] = 0;
		else if (WE) begin
			case (StoreType)
				0:	RAM[A[13:2]] = WD;							//sw
				1:	case (A[1])									//sh
						1'b0: RAM[A[13:2]][15:0] = WD[15:0];
						1'b1: RAM[A[13:2]][31:16] = WD[15:0];
					endcase
				2:	case (A[1:0])								//sb
						2'b00: RAM[A[13:2]][7:0] = WD[7:0];
						2'b01: RAM[A[13:2]][15:8] = WD[7:0];
						2'b10: RAM[A[13:2]][23:16] = WD[7:0];
						2'b11: RAM[A[13:2]][31:24] = WD[7:0];
					endcase		
			endcase
			$display("%d@%h: *%h <= %h", $time, PC_M, {A[31:2], 2'b00}, RAM[A[13:2]]);
		end
	end
	
	always @(*) begin
		case (LoadType)
			0:	RD = RAM[A[13:2]];							//lw
			1:	case (A[1])									//lh
					1'b0: RD = $signed(RAM[A[13:2]][15:0]);
					1'b1: RD = $signed(RAM[A[13:2]][31:16]);
				endcase
			2: 	case (A[1])									//lhu
					1'b0: RD = RAM[A[13:2]][15:0];
					1'b1: RD = RAM[A[13:2]][31:16];
				endcase
			3:	case (A[1:0])								//lb
					2'b00: RD = $signed(RAM[A[13:2]][7:0]);
					2'b01: RD = $signed(RAM[A[13:2]][15:8]);
					2'b10: RD = $signed(RAM[A[13:2]][23:16]);
					2'b11: RD = $signed(RAM[A[13:2]][31:24]);
				endcase
			4:	case (A[1:0])								//lbu						
					2'b00: RD = RAM[A[13:2]][7:0];
					2'b01: RD = RAM[A[13:2]][15:8];
					2'b10: RD = RAM[A[13:2]][23:16];
					2'b11: RD = RAM[A[13:2]][31:24];
				endcase
		endcase
	end
	
endmodule
