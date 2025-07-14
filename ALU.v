// module ALU(SrcA,SrcB,ALUControl,ALUResult,Zero,Negative,Overflow,Carry);

module ALU(SrcA,SrcB,ALUControl,ALUResult,ALUFlag);
    
  input [31:0]SrcA,SrcB;
  input [1:0]ALUControl;
  output reg [31:0]ALUResult;
 // output reg Zero,Negative,Overflow,Carry;
  output reg [3:0] ALUFlag;
  
  reg Zero,Negative,Overflow,Carry;
  
  always@(*) begin
    
    case(ALUControl)
      
      2'b10 :begin
        	ALUResult = SrcA & SrcB;
      		Carry = 1'b0;
      		Overflow = 1'b0;
      end
      
      2'b11 :begin
        	ALUResult = SrcA | SrcB;
      		Carry = 1'b0;
      		Overflow = 1'b0;
      end
      
      2'b00 :begin
        {Carry,ALUResult} = SrcA + SrcB;
        Overflow = ((SrcA[31] == SrcB[31]) && (ALUResult[31] != SrcA[31])); 
      end
      
      2'b01 :begin
        {Carry,ALUResult} = SrcA - SrcB;
        Overflow =((SrcA[31] != SrcB[31]) && (ALUResult[31] != SrcA[31]));
      end
      
      default : begin
        	ALUResult = 32'b0;
      		Carry = 1'b0;
      		Overflow = 1'b0;
        end
    endcase
  end
    
    assign Zero = (ALUResult == 0);
    assign Negative = (ALUResult[31] == 1'b1);
      assign ALUFlag={Negative,Zero,Carry,Overflow};
    
      endmodule
      
      
      
