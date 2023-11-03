module toplevel_ALU(clk,rst,r0en,r1en,r0toalu,r1toalu,ALU_Sel,resulttoreg,r2en,r2tobuff_alu,bus,aluOutEn);
  input clk, rst;
  input [2:0] ALU_Sel;
  input r0en, r1en, r2en, aluOutEn;
  inout [15:0] bus, r0toalu, r1toalu,resulttoreg,r2tobuff_alu;
  

  Register R0(.clk(clk), .d(bus), .ei(r0en), .rst(rst), .q(r0toalu));
  Register R1(.clk(clk), .d(bus), .ei(r1en), .rst(rst), .q(r1toalu)); 
  alu ALU(.A(r0toalu), .B(r1toalu), .ALU_Sel(ALU_Sel), .ALU_Result(resulttoreg));
  Register R2(.clk(clk), .d(resulttoreg), .ei(r2en), .rst(rst), .q(r2tobuff_alu));  
  tristate_buffer trALU(.T(aluOutEn), .I(r2tobuff_alu), .O(bus));
endmodule

