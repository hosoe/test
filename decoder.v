module decoder(op,,zf,pc_we,pc_in,dst,reg_we,src0,src1,data,sel1,sel2,alu_op,mem_we);
	`include "define.h"
	input zf;
	input [15:0]op;
	output reg sel1,sel2,reg_we,pc_we,mem_we;
	output reg [3:0]alu_op,src0,src1,dst;
	output reg [5:0]pc_in;
	output reg [7:0]data;
	always @(*)begin
		case(op[15:12])
//synopsys full_case
//synopsys paralel_case
			ADD,SUB,SB2,MUL:begin
				alu_op<=op[15:12];
				src0<=op[11:8];
				src1<=op[7:4];
				dst<=op[3:0];
				sel1<=1;
				sel2<=0;
				reg_we<=1;
				pc_we<=0;
				mem_we<=0;
			end
			INC,DEC,ZRO:begin
				alu_op<=op[15:12];
				src0<=op[11:8];
				dst<=op[3:0];
				sel1<=1;
				sel2<=0;
				reg_we<=1;
				pc_we<=0;
				mem_we<=0;
			end
			CHK,CP1:begin
				alu_op<=op[15:12];
				src0<=op[11:8];
				src1<=op[7:4];
				sel1<=1;
				sel2<=0;
				reg_we<=0;
				pc_we<=0;
				mem_we<=0;
			end
			JMP:begin
				alu_op<=op[15:12];
				pc_in<=op[11:6];
				sel1<=0;
				sel2<=0;
				reg_we<=0;
				pc_we<=1;
				mem_we<=0;
			end
			JNZ:begin
				alu_op<=op[15:12];
				if(zf==1)pc_in<=op[11:6];
				sel1<=0;
				sel2<=0;
				reg_we<=0;
				pc_we<=zf;
				mem_we<=0;
			end
			LIN:begin
				alu_op<=op[15:12];
				data=op[11:4];
				dst<=op[3:0];
				sel1<=0;
				sel2<=0;
				reg_we<=1;
				pc_we<=0;
				mem_we<=0;
			end
			STR:begin
				alu_op<=op[15:12];
				src0<=op[11:8];
				src1<=op[7:4];
				sel1<=1;
				sel2<=0;
				reg_we<=0;
				pc_we<=0;
				mem_we<=1;
			end
			LOD:begin
//				alu_op<=op[15:12];
				src1<=op[7:4];
				dst<=op[3:0];
				sel1<=0;
				sel2<=1;
				reg_we<=1;
				pc_we<=0;
				mem_we<=0;
			end
//			default out<=out;
//			default zf<=0;
			endcase
		end
endmodule

