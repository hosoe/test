module imem(pc,op);
	`include "define.h"
	input [5:0]pc;
	output [15:0]op;
	reg [15:0]op;
	always @(pc)begin
		case(pc)
//synopsys full_case
//synopsys paralel_case
			//init
			0:op<={LIN,8'd8,BRD};//5Queen
			1:op<={LIN,8'd0,SCT};//SuccessTimes
			2:op<={LIN,8'd0,CTR};//counter
			3:op<={LIN,8'd0,XPS};//Xpos
			4:op<={LIN,8'd0,YPS};//Ypos
			5:op<={LIN,8'd0,AL0};//always0
			//JudgeYQueen
			6:op<={CHK,YPS,AL0,DC4};//if YPos==0
			7:op<={JNZ,6'd24,DC6};//JNZ to PosStore
			8:op<={LOD,DC4,CTR,TP3};//Load Queen[CTR] to Temp3
			9:op<={CHK,TP3,XPS,DC4};//if Queen[CTR]==XPos
			10:op<={JNZ,6'd31,DC6};//JNZ to XPosadd
			//JudgeCrossQueen
			11:op<={LOD,DC4,CTR,TP4};//Load Queen[CTR] to Temp4
			12:op<={SUB,YPS,CTR,TP7};//YPos-Counter
			13:op<={ADD,TP3,TP7,TP3};//Right
			14:op<={SUB,TP4,TP7,TP4};//Left
			15:op<={CHK,TP3,XPS,DC4};//JudgyRQueen
			16:op<={JNZ,6'd31,DC6};//JNZ to XPosadd
			17:op<={CHK,TP4,XPS,DC4};//JudgyLQueen
			18:op<={JNZ,6'd31,DC6};//JNZ to XPosadd
			//Counter==Y-1
			20:op<={CP1,CTR,YPS,DC4};//Check Counter==YPos-1
			21:op<={JNZ,6'd24,DC6};//JNZ to PosStore
			///CountUP
			22:op<={INC,CTR,DC4,CTR};//Counter countUP
			23:op<={JMP,6'd8,DC6};//Jump to JudgeYQueen
			//PosStore
			24:op<={STR,XPS,YPS,DC4};//Store Xpos to seg[YPos]
			//JudgeYBoardEdge
			25:op<={CP1,YPS,BRD,DC4};//JudgeYBoardEdge
			26:op<={JNZ,6'd42,DC6};//JNZ to Success CountUP
			//YPosadd
			27:op<={INC,YPS,DC4,YPS};//Y+=1
			28:op<={ZRO,XPS,DC4,XPS};//X=0
			29:op<={ZRO,CTR,DC4,CTR};//Counter=0
			30:op<={JMP,6'd8,DC6};//Jump to JudgeYQueen
			//XPosadd
			31:op<={INC,XPS,DC4,XPS};//X++
			//JudgeXBoardEdge
			32:op<={CHK,BRD,XPS,DC4};//JudgeXBoardEdge
			33:op<={JNZ,6'd36,DC6};//JNZ to JudgeY0
			34:op<={ZRO,CTR,DC4,CTR};//Counter=0
			35:op<={JMP,6'd6,DC6};//Jump to JudgeYQueen
			//JudgeY0
			36:op<={CHK,YPS,AL0,DC4};//JudgeY0
			37:op<={JNZ,6'd46,DC6};//JNZ to End
			//Y--
			38:op<={DEC,YPS,DC4,YPS};//Y-=1
			39:op<={LOD,DC4,YPS,XPS};//Load seg[YPos] to XPos
			40:op<={ZRO,CTR,DC4,CTR};//Counter=0
			41:op<={JMP,6'd31,DC6};//Jump to XPosadd
			//Success CountUP
			42:op<={INC,SCT,DC4,SCT};//Success CountUP
			43:op<={ZRO,CTR,DC4,CTR};//Counter=0
			44:op<={STR,SCT,BRD,DC4};//Store SCT to seg[Board]
			45:op<={JMP,6'd31,DC6};//Jump to XPosadd
			//end
			46:op<={JMP,6'd46,DC6};//End
		endcase
	end
endmodule
