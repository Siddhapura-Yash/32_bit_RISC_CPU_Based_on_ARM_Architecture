module Decoder(input [1:0] Op,
	input  [5:0] Funct,
	input  [3:0] Rd,
	output reg [1:0] FlagW,
	output reg PCS, RegW, MemW,
	output reg MemtoReg, ALUSrc,
	output reg [1:0] ImmSrc, RegSrc, ALUControl);
  
  //internal wires
  reg Branch, ALUOp;
  reg [9:0] controls;
  
  //Decoder
  always@(*) begin
    casex(Op)
      
      //data-processing
      2'b00 : if(Funct[5]) controls = 10'b0011001x01; //immediate
      			else controls = 10'b0000xx1001;		  // register
      
      //Memory 
      2'b01 : if(Funct[0]) controls = 10'b0101011x00; //LDR
      		  else controls = 10'b0x11010100;		  //STR
      
      //Branch
      2'b10 : controls = 10'b1001100x10;
      
      default : controls = 10'bx;
    endcase
    
    {Branch,MemtoReg,MemW,ALUSrc,ImmSrc,RegW,RegSrc,ALUOp} = controls;
    
  end	//decoder end
  
  
  
  //ALU Decoder
  always@(*) begin
    if(ALUOp) begin 
      case(Funct[4:1])
        4'b0100 : ALUControl = 2'b00;	//ANDing
        4'b0010 : ALUControl = 2'b01;	//Oring
        4'b0000 : ALUControl = 2'b10;	//Addition
        4'b1100 : ALUControl = 2'b11;	//Subtraction
        default : ALUControl = 2'bx; 	//Unimplemented
      endcase
      //Update Flags if S bit is set (C & V only for arithmetic operation)
      FlagW[1] = Funct[0];
      FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
      end
    else begin
      ALUControl = 2'b00;	//addition for non-DP instructions
      FlagW = 2'b00;		//Don't update flags
    end
  end
  
  assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
  
endmodule
