`timescale 1ns/10ps
module ALU_tb();

reg clk,clr,RYin,RZLoIn;
//reg[31:0] input_a, input_b;
reg[3:0] opc;
reg[3:0] present_state;
reg[31:0] BusMuxOut;


wire[31:0] RZLoout;
wire[31:0] RYout;

datapath DP(
	.clear(clr), .clock(clk), .opcode(opc), .BusMuxOut(BusMuxOut),
	.RZLoIn(RZLoIn), .RYIn(RYIn), .RZLoOut(RZLoOut)
);

parameter init = 4'd1, T0 = 4'd2, T1 = 4'd3, T2 = 4'd4, T3=4'd5;

initial begin clk =0; present_state=4'd0; end
always #10 clk =~clk;
always @(negedge clk) present_state=present_state+1;

always @(present_state) begin
	case(present_state)
		init: begin
			clr<=1;
		end
		T0: begin
		
				BusMuxOut <= 8'b011; 
				RYin<=1;
				#15
				BusMuxOut<=0;
				RYin<=0;
		end
		T1: begin
				BusMuxOut<=8'b100; 
				#15;
		end
		T2: begin
				opc<=0;
				#15;
		end
		T3: begin
				RZLoIn<=1;
				#15 
				RZLoIn<=0;
				
		end
		
	endcase

end
	
endmodule
