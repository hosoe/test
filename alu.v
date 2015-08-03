module alu(op,in0,in1,out,zf);
	`include "define.h"
	input [3:0]op;
	input [7:0]in0,in1;
	output zf;
	output [7:0]out;
	reg zf;
	reg [7:0]out;
	integer i;
	always @(*)begin
		case(op)
//synopsys full_case
//synopsys paralel_case
			ADD:out<=in0+in1;
			SUB:out<=in0-in1;
			SB2:out<=in0-in1+1;
			MUL:out<=in0*in1;
			INC:out<=in0+1;
			DEC:out<=in0-1;
			ZRO:out<=0;
			CHK:begin
				if(in0==in1)zf<=1;
				else zf<=0;
			end
			CP1:begin
				if(in0==in1-1)zf<=1;
				else zf<=0;
			end
//			JMP:
//			JNZ:
			LIN:out<=in0;
			STR:out<=in0;
			LOD:out<=in1;
			default out<=out;
//		default zf<=0;
			endcase
	end
endmodule
