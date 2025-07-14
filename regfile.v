module regfile(clk,we3,ra1,ra2,ra3,wd3,R15,rd1,rd2);
  
  input clk,we3;
  input [3:0]ra1,ra2,ra3;
  input [31:0]wd3,R15;
  output [31:0]rd1,rd2;
  
  reg [31:0]rf[14:0];
  
  always@(posedge clk) begin
    if(we3)
      rf[ra3] <= wd3;
  end
  
  assign rd1 = (ra1 == 15) ? R15 : rf[ra1] ;
  assign rd2 = (ra2 == 15) ? R15 : rf[ra2] ;
  
endmodule
  
      
