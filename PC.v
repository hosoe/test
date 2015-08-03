module pc(pc_in,pc_out,rst,clk,we);
	input rst,clk,we;
	input [5:0]pc_in;
	output [5:0]pc_out;
	reg [5:0]pc_out;
	always @(posedge clk)begin
		if(rst==1'b1)begin
			pc_out<=0;
		end else begin
			if(we==1'b1) begin
				pc_out<=pc_in;
			end else begin
				pc_out<=pc_out+1;
			end
		end
	end
endmodule
