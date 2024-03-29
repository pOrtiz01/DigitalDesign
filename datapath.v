module datapath (
    input wire clock, clear,
	 input [3:0] opcode,
	 output [31:0] BusMuxOut,
	 input R0in,R1in,R2in,R3in,R4in,R5in,R6in,R7in,R8in,R9in,R10in,R11in,R12in,R13in,R14in,R15in,
	 input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	 input RPCIn, RIRIn, RZHiIn, RZLoIn, RHiIn, RLoIn, RMDRIn, RMARIn, RYIn,	 
	 input RPCOut, RIROut, RZHiOut, RZLoOut, RHiOut, RLoOut, RMDROut
    
);

wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHi, BusMuxInLo, BusMuxInRZHi, BusMuxInRZLo, BusMuxInRPC, BusMuxInRMDR, BusMuxIn;
wire [31:0] RYData;
wire [63:0] ZData;
wire RIR;
wire RMARout;


//input wire R0in,R1in,R2in,R3in,R4in,R5in,R6in,R7in,R8in,R9in,R10in,R11in,R12in,R13in,R14in,R15in,RHIin,RLOin,RPCin,RIRin,RYin,RZHiIn,RZLoIn,RMARin
//wire [31:0] BusMuxOut;

register R0 (clear,clock, R0in, BusMuxOut, BusMuxInR0);
register R1 (clear,clock, R1in, BusMuxOut, BusMuxInR1);
register R2 (clear,clock, R2in, BusMuxOut, BusMuxInR2);
register R3 (clear,clock, R3in, BusMuxOut, BusMuxInR3);
register R4 (clear,clock, R4in, BusMuxOut, BusMuxInR4);
register R5 (clear,clock, R5in, BusMuxOut, BusMuxInR5);
register R6 (clear,clock, R6in, BusMuxOut, BusMuxInR6);
register R7 (clear,clock, R7in, BusMuxOut, BusMuxInR7);
register R8 (clear,clock, R8in, BusMuxOut, BusMuxInR8);
register R9 (clear,clock, R9in, BusMuxOut, BusMuxInR9);
register R10 (clear,clock, R10in, BusMuxOut, BusMuxInR10);
register R11 (clear,clock, R11in, BusMuxOut, BusMuxInR11);
register R12 (clear,clock, R12in, BusMuxOut, BusMuxInR12);
register R13 (clear,clock, R13in, BusMuxOut, BusMuxInR13);
register R14 (clear,clock, R14in, BusMuxOut, BusMuxInR14);
register R15 (clear,clock, R15in, BusMuxOut, BusMuxInR15);

register RHI (clear,clock, RHiIn, BusMuxOut, BusMuxInRHi);
register RLO (clear,clock, RLoIn, BusMuxOut, BusMuxInRLo);

//register RPC (clear,clock, RPCIn, BusMuxOut, BusMuxInRPC)
//register RIR (clear,clock, RIRIn, BusMuxOut, BusMuxInRIR)
register RY (clear,clock, RYin, BusMuxOut, RYData);

register RZHI (clear,clock, RZHiIn, RZHiData, ZData[63:32]);
register RZLO (clear,clock, RZLoIn, RZLoData, ZData[31:0]);

register RMAR (clear,clock, RMARIn, BusMuxOut, BusMuxInRMAR);
//register RMDR (clear,clock, RMDRIn, BusMuxOut, BusMuxInRMDR)

bus bus(BusMuxInR0,BusMuxInR1,BusMuxInR2,BusMuxInR3,BusMuxInR4,BusMuxInR5,BusMuxInR6,BusMuxInR7,BusMuxInR8,BusMuxInR9,BusMuxInR10,BusMuxInR11,BusMuxInR12,BusMuxInR13,BusMuxInR14,BusMuxInR15,BusMuxInRHI,BusMuxInRLO,BusMuxInRPC,BusMuxInRIR,BusMuxInRY,BusMuxInRZHi, BusMuxInRZLo, R0out,R1out,R2out,R3out,R4out,R5out,R6out,R7out,R8out,R9out,R10out,R11out,R12out,R13out,R14out,R15out,RHIout,RLOout,RPCout,RIRout,RYout,RZHiout, RZLoout,RMARout,RMDRout, BusMuxOut);

alu ALU_instance(RYData, BusMuxOut, opcode, ZData, clear, clock);

endmodule
