
module load ( clk, rst, donefetch, start, parameter1, parameter2, r0in, r1in, 
        r2in, r3in, P0in, R0OutEn, R1OutEn, R2OutEn, R3OutEn, P0OutEn, Regiout, 
        Regjin, MARin, MDR_tobusin, MDROutEn, EN, RW, done );
  input [5:0] parameter1;
  input [5:0] parameter2;
  input clk, rst, donefetch, start;
  output r0in, r1in, r2in, r3in, P0in, R0OutEn, R1OutEn, R2OutEn, R3OutEn,
         P0OutEn, Regiout, Regjin, MARin, MDR_tobusin, MDROutEn, EN, RW, done;
  wire   N230, N231, N232, N233, N235, N237, N239, N241, N243, N245, N253,
         N256, n17, EN, Regjin, Regiout, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85;
  wire   [2:0] state_reg;
  wire   [2:0] state_next;
  assign RW = EN;
  assign MDROutEn = Regjin;
  assign MARin = Regiout;

  DFFARX1 \state_reg_reg[0]  ( .D(state_next[0]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[0]), .QN(n59) );
  DFFARX1 \state_reg_reg[1]  ( .D(state_next[1]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[1]), .QN(n58) );
  DFFARX1 \state_reg_reg[2]  ( .D(state_next[2]), .CLK(clk), .RSTB(n17), .Q(
        state_reg[2]), .QN(n57) );
  LATCHX1 r0in_reg ( .CLK(N256), .D(N245), .Q(r0in) );
  LATCHX1 r3in_reg ( .CLK(N256), .D(N241), .Q(r3in) );
  LATCHX1 r2in_reg ( .CLK(N256), .D(N239), .Q(r2in) );
  LATCHX1 r1in_reg ( .CLK(N256), .D(N237), .Q(r1in) );
  LATCHX1 P0in_reg ( .CLK(N256), .D(N243), .Q(P0in) );
  LATCHX1 P0OutEn_reg ( .CLK(N253), .D(N235), .Q(P0OutEn) );
  LATCHX1 R3OutEn_reg ( .CLK(N253), .D(N233), .Q(R3OutEn) );
  LATCHX1 R2OutEn_reg ( .CLK(N253), .D(N232), .Q(R2OutEn) );
  LATCHX1 R1OutEn_reg ( .CLK(N253), .D(N231), .Q(R1OutEn) );
  LATCHX1 R0OutEn_reg ( .CLK(N253), .D(N230), .Q(R0OutEn) );
  NAND4X0 U61 ( .IN1(n60), .IN2(n61), .IN3(n62), .IN4(n63), .QN(state_next[2])
         );
  NAND2X0 U62 ( .IN1(start), .IN2(MDR_tobusin), .QN(n60) );
  NAND3X0 U63 ( .IN1(n61), .IN2(n64), .IN3(n65), .QN(state_next[1]) );
  MUX21X1 U64 ( .IN1(n66), .IN2(n67), .S(start), .Q(n65) );
  NOR2X0 U65 ( .IN1(done), .IN2(Regiout), .QN(n67) );
  NAND3X0 U66 ( .IN1(n62), .IN2(n63), .IN3(state_reg[2]), .QN(n61) );
  MUX21X1 U67 ( .IN1(n68), .IN2(n69), .S(n59), .Q(state_next[0]) );
  OA21X1 U68 ( .IN1(n57), .IN2(n58), .IN3(start), .Q(n69) );
  NAND2X0 U69 ( .IN1(start), .IN2(n57), .QN(n68) );
  NOR2X0 U70 ( .IN1(rst), .IN2(donefetch), .QN(n17) );
  INVX0 U71 ( .IN(n62), .QN(done) );
  NAND3X0 U72 ( .IN1(state_reg[2]), .IN2(n58), .IN3(state_reg[0]), .QN(n62) );
  NOR4X0 U73 ( .IN1(n70), .IN2(parameter2[3]), .IN3(parameter2[5]), .IN4(
        parameter2[4]), .QN(N256) );
  AO21X1 U74 ( .IN1(parameter2[2]), .IN2(n71), .IN3(n72), .Q(n70) );
  INVX0 U75 ( .IN(N253), .QN(n72) );
  NOR4X0 U76 ( .IN1(parameter1[3]), .IN2(n73), .IN3(parameter1[5]), .IN4(
        parameter1[4]), .QN(N253) );
  NOR2X0 U77 ( .IN1(n74), .IN2(n71), .QN(N245) );
  NOR4X0 U78 ( .IN1(n73), .IN2(n75), .IN3(n63), .IN4(n71), .QN(N243) );
  NAND2X0 U79 ( .IN1(n76), .IN2(n77), .QN(n71) );
  INVX0 U80 ( .IN(n78), .QN(n73) );
  AND3X1 U81 ( .IN1(parameter2[1]), .IN2(n79), .IN3(parameter2[0]), .Q(N241)
         );
  AND3X1 U82 ( .IN1(n79), .IN2(n76), .IN3(parameter2[1]), .Q(N239) );
  INVX0 U83 ( .IN(parameter2[0]), .QN(n76) );
  AND3X1 U84 ( .IN1(n79), .IN2(n77), .IN3(parameter2[0]), .Q(N237) );
  INVX0 U85 ( .IN(parameter2[1]), .QN(n77) );
  INVX0 U86 ( .IN(n74), .QN(n79) );
  NAND3X0 U87 ( .IN1(n78), .IN2(n75), .IN3(Regjin), .QN(n74) );
  INVX0 U88 ( .IN(n63), .QN(Regjin) );
  NAND3X0 U89 ( .IN1(n59), .IN2(n58), .IN3(state_reg[2]), .QN(n63) );
  INVX0 U90 ( .IN(parameter2[2]), .QN(n75) );
  NAND2X0 U91 ( .IN1(parameter1[2]), .IN2(n80), .QN(n78) );
  NOR3X0 U92 ( .IN1(n80), .IN2(n81), .IN3(n82), .QN(N235) );
  NOR3X0 U93 ( .IN1(n83), .IN2(n84), .IN3(n85), .QN(N233) );
  NOR3X0 U94 ( .IN1(n83), .IN2(parameter1[0]), .IN3(n84), .QN(N232) );
  NOR3X0 U95 ( .IN1(n85), .IN2(parameter1[1]), .IN3(n84), .QN(N231) );
  NOR2X0 U96 ( .IN1(n80), .IN2(n84), .QN(N230) );
  NAND2X0 U97 ( .IN1(Regiout), .IN2(n81), .QN(n84) );
  INVX0 U98 ( .IN(parameter1[2]), .QN(n81) );
  INVX0 U99 ( .IN(n82), .QN(Regiout) );
  NAND3X0 U100 ( .IN1(n58), .IN2(n57), .IN3(state_reg[0]), .QN(n82) );
  NAND2X0 U101 ( .IN1(n85), .IN2(n83), .QN(n80) );
  INVX0 U102 ( .IN(parameter1[1]), .QN(n83) );
  INVX0 U103 ( .IN(parameter1[0]), .QN(n85) );
  INVX0 U104 ( .IN(n66), .QN(MDR_tobusin) );
  NAND3X0 U105 ( .IN1(state_reg[0]), .IN2(n57), .IN3(state_reg[1]), .QN(n66)
         );
  INVX0 U106 ( .IN(n64), .QN(EN) );
  NAND3X0 U107 ( .IN1(n59), .IN2(n57), .IN3(state_reg[1]), .QN(n64) );
endmodule

