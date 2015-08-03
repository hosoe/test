module selector(sel,in0,in1,out);

	input sel;
	input [7:0]in0,in1;
	output [7:0]out;
	reg [7:0]out;

	always @(in0 or in1 or sel) begin
		if(sel) out=in1;
		else out=in0;
	end
endmodule
