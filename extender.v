module extender(Instr,ImmSrc,ExtImm);
  input [23:0]Instr;
  input [1:0]ImmSrc;
  output reg [31:0]ExtImm;
  
  always@(*) begin
    
    case(ImmSrc) 
      
      2'b00 : ExtImm = {24'b0,Instr[7:0]};
      2'b01 : ExtImm = {20'b0,Instr[11:0]};
      2'b10 : ExtImm = {{6{Instr[23]}},Instr[23:0],2'b00};
      default : ExtImm = 32'bx;
      
    endcase
    
  end
  
endmodule
