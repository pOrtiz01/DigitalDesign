module alu(
	input wire[31:0] A, B,
	input wire[3:0] opcode,
	output reg[63:0] ZData,
	input clear, clock
	//output reg[31:0] RZHi,RZLo
);

//wire [31:0] addResult;
//
//adder adder(A,B,addResult);

always@(*)
	begin
		case(opcode)
			//0:result=addResult;
			0 : 
				begin 
					ZData[31:0] <= A + B;
					ZData[63:32] <= 32'b0;
				end

			default : 
				begin
					ZData[31:0] <= A + B;
					ZData[63:32] <= 32'b0;
				end
		endcase
		
	end

endmodule
