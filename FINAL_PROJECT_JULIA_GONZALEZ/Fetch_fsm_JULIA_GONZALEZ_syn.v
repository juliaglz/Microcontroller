
module fetch ( clk, rst, done, MFC, PCOutEn, PCsignal, MARin, EN, RW, 
        MDR_tobusin, MDR_frombusin, MDROutEn, IRin, done_fetch );
  input clk, rst, done, MFC;
  output PCOutEn, PCsignal, MARin, EN, RW, MDR_tobusin, MDR_frombusin,
         MDROutEn, IRin, done_fetch;
  wire   EN, n15, PCOutEn, IRin, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;
  wire   [3:0] state_reg;
  wire   [3:0] state_next;
  assign MDR_frombusin = 1'b0;
  assign RW = EN;
  assign MARin = PCOutEn;
  assign MDR_tobusin = IRin;
  assign MDROutEn = IRin;

  DFFARX1 \state_reg_reg[0]  ( .D(state_next[0]), .CLK(clk), .RSTB(n15), .Q(
        state_reg[0]), .QN(n41) );
  DFFARX1 \state_reg_reg[1]  ( .D(state_next[1]), .CLK(clk), .RSTB(n15), .Q(
        state_reg[1]), .QN(n39) );
  DFFARX1 \state_reg_reg[3]  ( .D(state_next[3]), .CLK(clk), .RSTB(n15), .Q(
        state_reg[3]), .QN(n40) );
  DFFARX1 \state_reg_reg[2]  ( .D(state_next[2]), .CLK(clk), .RSTB(n15), .Q(
        state_reg[2]), .QN(n38) );
  NAND2X0 U41 ( .IN1(n40), .IN2(n42), .QN(state_next[3]) );
  NAND4X0 U42 ( .IN1(state_reg[2]), .IN2(state_reg[1]), .IN3(state_reg[0]), 
        .IN4(n43), .QN(n42) );
  OAI22X1 U43 ( .IN1(n44), .IN2(n43), .IN3(done_fetch), .IN4(n38), .QN(
        state_next[2]) );
  AOI21X1 U44 ( .IN1(state_reg[0]), .IN2(EN), .IN3(done_fetch), .QN(n44) );
  AO21X1 U45 ( .IN1(n45), .IN2(n43), .IN3(n46), .Q(state_next[1]) );
  MUX21X1 U46 ( .IN1(MFC), .IN2(n47), .S(n48), .Q(n46) );
  NOR2X0 U47 ( .IN1(n39), .IN2(n45), .QN(n47) );
  AO21X1 U48 ( .IN1(n49), .IN2(state_reg[0]), .IN3(PCsignal), .Q(n45) );
  MUX21X1 U49 ( .IN1(n50), .IN2(n51), .S(n41), .Q(state_next[0]) );
  AND3X1 U50 ( .IN1(n52), .IN2(n40), .IN3(n53), .Q(n51) );
  XOR2X1 U51 ( .IN1(MFC), .IN2(n39), .Q(n53) );
  NAND2X0 U52 ( .IN1(state_reg[2]), .IN2(MFC), .QN(n52) );
  NAND3X0 U53 ( .IN1(n54), .IN2(n40), .IN3(n55), .QN(n50) );
  XOR2X1 U54 ( .IN1(n56), .IN2(state_reg[2]), .Q(n55) );
  NAND2X0 U55 ( .IN1(state_reg[1]), .IN2(n43), .QN(n56) );
  INVX0 U56 ( .IN(MFC), .QN(n43) );
  NAND2X0 U57 ( .IN1(MFC), .IN2(n39), .QN(n54) );
  NOR2X0 U58 ( .IN1(rst), .IN2(done), .QN(n15) );
  INVX0 U59 ( .IN(n48), .QN(done_fetch) );
  NAND2X0 U60 ( .IN1(n57), .IN2(state_reg[1]), .QN(n48) );
  ISOLANDX1 U61 ( .D(n57), .ISO(state_reg[1]), .Q(PCsignal) );
  NOR3X0 U62 ( .IN1(n41), .IN2(state_reg[3]), .IN3(n38), .QN(n57) );
  AND3X1 U63 ( .IN1(n49), .IN2(n39), .IN3(state_reg[0]), .Q(PCOutEn) );
  INVX0 U64 ( .IN(n58), .QN(n49) );
  NOR4X0 U65 ( .IN1(state_reg[3]), .IN2(state_reg[1]), .IN3(state_reg[0]), 
        .IN4(n38), .QN(IRin) );
  NOR2X0 U66 ( .IN1(n58), .IN2(n39), .QN(EN) );
  NAND2X0 U67 ( .IN1(n38), .IN2(n40), .QN(n58) );
endmodule

