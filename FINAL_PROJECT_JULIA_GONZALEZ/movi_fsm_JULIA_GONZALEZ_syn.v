
module movi ( clk, rst, donefetch, start, done, Regiin, parameter1, parameter2, 
        r0in, r1in, r2in, r3in, P0in, buffen, bufftobus );
  input [5:0] parameter1;
  input [5:0] parameter2;
  output [15:0] bufftobus;
  input clk, rst, donefetch, start;
  output done, Regiin, r0in, r1in, r2in, r3in, P0in, buffen;
  wire   N58, N59, N60, N61, N63, N69, n64, Regiin, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83;
  wire   [2:0] state_reg;
  wire   [2:0] state_next;
  tri   [15:0] bufftobus;
  assign buffen = Regiin;

  DFFARX1 \state_reg_reg[0]  ( .D(state_next[0]), .CLK(clk), .RSTB(n64), .Q(
        state_reg[0]), .QN(n71) );
  DFFARX1 \state_reg_reg[1]  ( .D(state_next[1]), .CLK(clk), .RSTB(n64), .Q(
        state_reg[1]), .QN(n70) );
  DFFARX1 \state_reg_reg[2]  ( .D(state_next[2]), .CLK(clk), .RSTB(n64), .Q(
        state_reg[2]), .QN(n69) );
  LATCHX1 r3in_reg ( .CLK(N69), .D(N61), .Q(r3in) );
  LATCHX1 r2in_reg ( .CLK(N69), .D(N60), .Q(r2in) );
  LATCHX1 r1in_reg ( .CLK(N69), .D(N59), .Q(r1in) );
  LATCHX1 r0in_reg ( .CLK(N69), .D(N58), .Q(r0in) );
  LATCHX1 P0in_reg ( .CLK(N69), .D(N63), .Q(P0in) );
  TNBUFFHX1 \bufftobus_tri[0]  ( .IN(parameter2[0]), .ENB(Regiin), .Q(
        bufftobus[0]) );
  TNBUFFHX1 \bufftobus_tri[1]  ( .IN(parameter2[1]), .ENB(Regiin), .Q(
        bufftobus[1]) );
  TNBUFFHX1 \bufftobus_tri[2]  ( .IN(parameter2[2]), .ENB(Regiin), .Q(
        bufftobus[2]) );
  TNBUFFHX1 \bufftobus_tri[3]  ( .IN(parameter2[3]), .ENB(Regiin), .Q(
        bufftobus[3]) );
  TNBUFFHX1 \bufftobus_tri[4]  ( .IN(parameter2[4]), .ENB(Regiin), .Q(
        bufftobus[4]) );
  TNBUFFHX1 \bufftobus_tri[5]  ( .IN(parameter2[5]), .ENB(Regiin), .Q(
        bufftobus[5]) );
  TNBUFFHX1 \bufftobus_tri[6]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[6]) );
  TNBUFFHX1 \bufftobus_tri[7]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[7]) );
  TNBUFFHX1 \bufftobus_tri[8]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[8]) );
  TNBUFFHX1 \bufftobus_tri[9]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[9]) );
  TNBUFFHX1 \bufftobus_tri[10]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[10])
         );
  TNBUFFHX1 \bufftobus_tri[11]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[11])
         );
  TNBUFFHX1 \bufftobus_tri[12]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[12])
         );
  TNBUFFHX1 \bufftobus_tri[13]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[13])
         );
  TNBUFFHX1 \bufftobus_tri[14]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[14])
         );
  TNBUFFHX1 \bufftobus_tri[15]  ( .IN(1'b0), .ENB(Regiin), .Q(bufftobus[15])
         );
  INVX2 U39 ( .IN(n79), .QN(Regiin) );
  NAND2X0 U40 ( .IN1(n69), .IN2(n72), .QN(state_next[2]) );
  NAND3X0 U41 ( .IN1(state_reg[0]), .IN2(start), .IN3(state_reg[1]), .QN(n72)
         );
  XOR2X1 U42 ( .IN1(n70), .IN2(n73), .Q(state_next[1]) );
  OR2X1 U43 ( .IN1(n74), .IN2(n71), .Q(n73) );
  MUX21X1 U44 ( .IN1(n75), .IN2(n74), .S(state_reg[0]), .Q(state_next[0]) );
  NAND2X0 U45 ( .IN1(start), .IN2(n69), .QN(n74) );
  OA21X1 U46 ( .IN1(n70), .IN2(n69), .IN3(start), .Q(n75) );
  NOR2X0 U47 ( .IN1(rst), .IN2(donefetch), .QN(n64) );
  AND3X1 U48 ( .IN1(state_reg[2]), .IN2(n70), .IN3(n71), .Q(done) );
  NOR4X0 U49 ( .IN1(parameter1[5]), .IN2(parameter1[4]), .IN3(parameter1[3]), 
        .IN4(n76), .QN(N69) );
  ISOLANDX1 U50 ( .D(n77), .ISO(n78), .Q(n76) );
  NOR3X0 U51 ( .IN1(n79), .IN2(n78), .IN3(n77), .QN(N63) );
  AND3X1 U52 ( .IN1(parameter1[0]), .IN2(n80), .IN3(parameter1[1]), .Q(N61) );
  AND3X1 U53 ( .IN1(n80), .IN2(n81), .IN3(parameter1[1]), .Q(N60) );
  AND3X1 U54 ( .IN1(n80), .IN2(n82), .IN3(parameter1[0]), .Q(N59) );
  INVX0 U55 ( .IN(n83), .QN(n80) );
  NOR2X0 U56 ( .IN1(n77), .IN2(n83), .QN(N58) );
  NAND2X0 U57 ( .IN1(Regiin), .IN2(n78), .QN(n83) );
  INVX0 U58 ( .IN(parameter1[2]), .QN(n78) );
  NAND3X0 U59 ( .IN1(n71), .IN2(n69), .IN3(state_reg[1]), .QN(n79) );
  NAND2X0 U60 ( .IN1(n81), .IN2(n82), .QN(n77) );
  INVX0 U61 ( .IN(parameter1[1]), .QN(n82) );
  INVX0 U62 ( .IN(parameter1[0]), .QN(n81) );
endmodule

