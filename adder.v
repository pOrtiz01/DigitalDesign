module adder (A,B,Result);

input [31:0] A, B;
output [31:0] Result;

reg [31:0] Sum;
reg [32:0] Carry;

integer i;

always@(A or B)
	begin
		for(i=0; i<32; i=i+1)
		begin
			Sum[i]=A[i]^B[i]^Carry[i];
			Carry[i+1] = (A[i]&B[i])|(Carry[i]&(A[i]|B[i]));
		end
end
endmodule
