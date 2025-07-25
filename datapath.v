`include "MUX.v"
`include "flop.v"
`include "adder.v"
`include "regfile.v"
`include "extender.v"
`include "ALU.v"

module datapath(input  clk, reset,
	input  [1:0] RegSrc,
	input  RegWrite,
	input  [1:0] ImmSrc,
	input  ALUSrc,
	input  [1:0] ALUControl,
	input  MemtoReg,
	input  PCSrc,
	output reg [3:0] ALUFlags,
	output reg [31:0] PC,
	input  [31:0] Instr,
	output reg [31:0] ALUResult, WriteData,
	input  [31:0] ReadData);
  
  wire [31:0] PCNext, PCPlus4, PCPlus8;
  wire [31:0] ExtImm, SrcA, SrcB, Result;
  wire [3:0] RA1,RA2;
  
  //PC logic
  mux #(32) pcmux(.y(PCNext),.d0(PCPlus4),.d1(Result),.sel(PCSrc)); 
  flop pcreg (clk,reset,PCNext,PC);
  adder pcadd1 (PC, 32'b100, PCPlus4);
  adder pcadd2 (PCPlus4, 32'b100, PCPlus8);
  
  
  //register file logic
  mux #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
  mux #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
  regfile rf (.clk(clk),.we3(RegWrite),.ra1(RA1),.ra2(RA2),.ra3(Instr[15:12]),.wd3(Result),.R15(PCPlus8),.rd1(SrcA),.rd2(WriteData));
  mux #(32) resmux (ALUResult,ReadData,MemtoReg,Result);
  extender ext (Instr[23:0],ImmSrc,ExtImm);
  
  
  //ALU logic
  mux #(32) srcbmux(WriteData,ExtImm,ALUSrc,SrcB);
  ALU alu(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUControl),.ALUResult(ALUResult),.ALUFlag(ALUFlags));
  
endmodule
