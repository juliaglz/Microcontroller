
module mov ( clk, rst, donefetch, start, done, Regjout, Regiin, parameter1, 
        parameter2, r0in, r1in, r2in, r3in, P0in, R0OutEn, R1OutEn, R2OutEn, 
        R3OutEn, P0OutEn );
  input [5:0] parameter1;
  input [5:0] parameter2;
  input clk, rst, donefetch, start;
  output done, Regjout, Regiin, r0in, r1in, r2in, r3in, P0in, R0OutEn, R1OutEn,
         R2OutEn, R3OutEn, P0OutEn;
  wire   N51, N52, N53, N54, N56, N62, N85, N86, N87, N88, N90, N96, n17,
         Regjout, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57;
  wire   [2:0] state_reg;
  wire   [2:0] state_next;
  assign Regiin = Regjout;

  DFFARX1 \state_reg_reg[1]  ( .D(state_next[1]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[1]), .QN(n37) );
  DFFARX1 \state_reg_reg[0]  ( .D(state_next[0]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[0]), .QN(n38) );
  DFFARX1 \state_reg_reg[2]  ( .D(state_next[2]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[2]), .QN(n39) );
  LATCHX1 r3in_reg ( .CLK(N96), .D(N88), .Q(r3in) );
  LATCHX1 r2in_reg ( .CLK(N96), .D(N87), .Q(r2in) );
  LATCHX1 r1in_reg ( .CLK(N96), .D(N86), .Q(r1in) );
  LATCHX1 r0in_reg ( .CLK(N96), .D(N85), .Q(r0in) );
  LATCHX1 R3OutEn_reg ( .CLK(N62), .D(N54), .Q(R3OutEn) );
  LATCHX1 R2OutEn_reg ( .CLK(N62), .D(N53), .Q(R2OutEn) );
  LATCHX1 R1OutEn_reg ( .CLK(N62), .D(N52), .Q(R1OutEn) );
  LATCHX1 R0OutEn_reg ( .CLK(N62), .D(N51), .Q(R0OutEn) );
  LATCHX1 P0in_reg ( .CLK(N96), .D(N90), .Q(P0in) );
  LATCHX1 P0OutEn_reg ( .CLK(N62), .D(N56), .Q(P0OutEn) );
  NAND2X0 U41 ( .IN1(n39), .IN2(n40), .QN(state_next[2]) );
  NAND3X0 U42 ( .IN1(state_reg[0]), .IN2(start), .IN3(state_reg[1]), .QN(n40)
         );
  AO22X1 U43 ( .IN1(Regjout), .IN2(start), .IN3(state_reg[1]), .IN4(n41), .Q(
        state_next[1]) );
  NAND2X0 U44 ( .IN1(n42), .IN2(state_reg[0]), .QN(n41) );
  XNOR2X1 U45 ( .IN1(n38), .IN2(n42), .Q(state_next[0]) );
  ISOLANDX1 U46 ( .D(start), .ISO(state_reg[2]), .Q(n42) );
  NOR2X0 U47 ( .IN1(rst), .IN2(donefetch), .QN(n17) );
  NOR3X0 U48 ( .IN1(n37), .IN2(state_reg[2]), .IN3(n38), .QN(done) );
  NOR4X0 U49 ( .IN1(parameter1[5]), .IN2(parameter1[4]), .IN3(parameter1[3]), 
        .IN4(n43), .QN(N96) );
  ISOLANDX1 U50 ( .D(n44), .ISO(n45), .Q(n43) );
  NOR3X0 U51 ( .IN1(n44), .IN2(n46), .IN3(n45), .QN(N90) );
  NOR3X0 U52 ( .IN1(n47), .IN2(n48), .IN3(n49), .QN(N88) );
  AND3X1 U53 ( .IN1(n50), .IN2(n47), .IN3(parameter1[1]), .Q(N87) );
  AND3X1 U54 ( .IN1(n50), .IN2(n49), .IN3(parameter1[0]), .Q(N86) );
  INVX0 U55 ( .IN(n48), .QN(n50) );
  NOR2X0 U56 ( .IN1(n44), .IN2(n48), .QN(N85) );
  NAND2X0 U57 ( .IN1(Regjout), .IN2(n45), .QN(n48) );
  INVX0 U58 ( .IN(parameter1[2]), .QN(n45) );
  NAND2X0 U59 ( .IN1(n47), .IN2(n49), .QN(n44) );
  INVX0 U60 ( .IN(parameter1[1]), .QN(n49) );
  INVX0 U61 ( .IN(parameter1[0]), .QN(n47) );
  NOR4X0 U62 ( .IN1(parameter2[5]), .IN2(parameter2[4]), .IN3(parameter2[3]), 
        .IN4(n51), .QN(N62) );
  ISOLANDX1 U63 ( .D(n52), .ISO(n53), .Q(n51) );
  NOR3X0 U64 ( .IN1(n52), .IN2(n46), .IN3(n53), .QN(N56) );
  NOR3X0 U65 ( .IN1(n54), .IN2(n55), .IN3(n56), .QN(N54) );
  AND3X1 U66 ( .IN1(n57), .IN2(n54), .IN3(parameter2[1]), .Q(N53) );
  AND3X1 U67 ( .IN1(n57), .IN2(n56), .IN3(parameter2[0]), .Q(N52) );
  INVX0 U68 ( .IN(n55), .QN(n57) );
  NOR2X0 U69 ( .IN1(n52), .IN2(n55), .QN(N51) );
  NAND2X0 U70 ( .IN1(Regjout), .IN2(n53), .QN(n55) );
  INVX0 U71 ( .IN(parameter2[2]), .QN(n53) );
  INVX0 U72 ( .IN(n46), .QN(Regjout) );
  NAND3X0 U73 ( .IN1(n37), .IN2(n39), .IN3(state_reg[0]), .QN(n46) );
  NAND2X0 U74 ( .IN1(n54), .IN2(n56), .QN(n52) );
  INVX0 U75 ( .IN(parameter2[1]), .QN(n56) );
  INVX0 U76 ( .IN(parameter2[0]), .QN(n54) );
endmodule

