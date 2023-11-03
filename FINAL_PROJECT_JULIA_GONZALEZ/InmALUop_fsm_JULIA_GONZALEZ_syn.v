
module ALUinmediate ( clk, rst, donefetch, start, parameter1, parameter2, r0in, 
        r1in, r2in, r3in, P0in, R0OutEn, R1OutEn, R2OutEn, R3OutEn, P0OutEn, 
        ALUinR1, ALUinR2, enregalu, ALUoutEn, Regiout, Regiin, done, inmtobuff, 
        inmtoalu );
  input [5:0] parameter1;
  input [5:0] parameter2;
  output [15:0] inmtoalu;
  input clk, rst, donefetch, start;
  output r0in, r1in, r2in, r3in, P0in, R0OutEn, R1OutEn, R2OutEn, R3OutEn,
         P0OutEn, ALUinR1, ALUinR2, enregalu, ALUoutEn, Regiout, Regiin, done,
         inmtobuff;
  wire   N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N82, n80, ALUinR1,
         ALUinR2, ALUoutEn, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111;
  wire   [3:0] state_reg;
  wire   [3:0] state_next;
  tri   [15:0] inmtoalu;
  assign Regiout = ALUinR1;
  assign inmtobuff = ALUinR2;
  assign Regiin = ALUoutEn;

  DFFARX1 \state_reg_reg[0]  ( .D(state_next[0]), .CLK(clk), .RSTB(n80), .Q(
        state_reg[0]), .QN(n90) );
  DFFARX1 \state_reg_reg[1]  ( .D(state_next[1]), .CLK(clk), .RSTB(n80), .Q(
        state_reg[1]), .QN(n88) );
  DFFARX1 \state_reg_reg[2]  ( .D(state_next[2]), .CLK(clk), .RSTB(n80), .Q(
        state_reg[2]), .QN(n87) );
  DFFARX1 \state_reg_reg[3]  ( .D(state_next[3]), .CLK(clk), .RSTB(n80), .Q(
        state_reg[3]), .QN(n89) );
  LATCHX1 r2in_reg ( .CLK(N82), .D(N63), .Q(r2in) );
  LATCHX1 r3in_reg ( .CLK(N82), .D(N64), .Q(r3in) );
  LATCHX1 R0OutEn_reg ( .CLK(N82), .D(N66), .Q(R0OutEn) );
  LATCHX1 P0in_reg ( .CLK(N82), .D(N65), .Q(P0in) );
  LATCHX1 R1OutEn_reg ( .CLK(N82), .D(N67), .Q(R1OutEn) );
  LATCHX1 R2OutEn_reg ( .CLK(N82), .D(N68), .Q(R2OutEn) );
  LATCHX1 R3OutEn_reg ( .CLK(N82), .D(N69), .Q(R3OutEn) );
  LATCHX1 P0OutEn_reg ( .CLK(N82), .D(N71), .Q(P0OutEn) );
  LATCHX1 r0in_reg ( .CLK(N82), .D(N61), .Q(r0in) );
  LATCHX1 r1in_reg ( .CLK(N82), .D(N62), .Q(r1in) );
  TNBUFFHX1 \inmtoalu_tri[0]  ( .IN(parameter2[0]), .ENB(ALUinR2), .Q(
        inmtoalu[0]) );
  TNBUFFHX1 \inmtoalu_tri[1]  ( .IN(parameter2[1]), .ENB(ALUinR2), .Q(
        inmtoalu[1]) );
  TNBUFFHX1 \inmtoalu_tri[2]  ( .IN(parameter2[2]), .ENB(ALUinR2), .Q(
        inmtoalu[2]) );
  TNBUFFHX1 \inmtoalu_tri[3]  ( .IN(parameter2[3]), .ENB(ALUinR2), .Q(
        inmtoalu[3]) );
  TNBUFFHX1 \inmtoalu_tri[4]  ( .IN(parameter2[4]), .ENB(ALUinR2), .Q(
        inmtoalu[4]) );
  TNBUFFHX1 \inmtoalu_tri[5]  ( .IN(parameter2[5]), .ENB(ALUinR2), .Q(
        inmtoalu[5]) );
  TNBUFFHX1 \inmtoalu_tri[6]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[6]) );
  TNBUFFHX1 \inmtoalu_tri[7]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[7]) );
  TNBUFFHX1 \inmtoalu_tri[8]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[8]) );
  TNBUFFHX1 \inmtoalu_tri[9]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[9]) );
  TNBUFFHX1 \inmtoalu_tri[10]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[10]) );
  TNBUFFHX1 \inmtoalu_tri[11]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[11]) );
  TNBUFFHX1 \inmtoalu_tri[12]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[12]) );
  TNBUFFHX1 \inmtoalu_tri[13]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[13]) );
  TNBUFFHX1 \inmtoalu_tri[14]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[14]) );
  TNBUFFHX1 \inmtoalu_tri[15]  ( .IN(1'b0), .ENB(ALUinR2), .Q(inmtoalu[15]) );
  NOR4X1 U57 ( .IN1(parameter1[5]), .IN2(parameter1[4]), .IN3(parameter1[3]), 
        .IN4(n104), .QN(N82) );
  INVX2 U58 ( .IN(n98), .QN(ALUinR2) );
  AO21X1 U59 ( .IN1(start), .IN2(done), .IN3(state_reg[3]), .Q(state_next[3])
         );
  AO21X1 U60 ( .IN1(state_reg[2]), .IN2(n91), .IN3(n92), .Q(state_next[2]) );
  MUX21X1 U61 ( .IN1(ALUinR1), .IN2(done), .S(n93), .Q(n92) );
  AO21X1 U62 ( .IN1(n94), .IN2(state_reg[1]), .IN3(n95), .Q(state_next[1]) );
  MUX21X1 U63 ( .IN1(n96), .IN2(n97), .S(start), .Q(n95) );
  NAND2X0 U64 ( .IN1(n98), .IN2(n99), .QN(n97) );
  INVX0 U65 ( .IN(n96), .QN(n94) );
  NAND2X0 U66 ( .IN1(n100), .IN2(n91), .QN(n96) );
  MUX21X1 U67 ( .IN1(state_reg[0]), .IN2(n101), .S(n102), .Q(state_next[0]) );
  NOR2X0 U68 ( .IN1(state_reg[3]), .IN2(n93), .QN(n102) );
  INVX0 U69 ( .IN(start), .QN(n93) );
  MUX21X1 U70 ( .IN1(n88), .IN2(n90), .S(n87), .Q(n101) );
  NOR2X0 U71 ( .IN1(rst), .IN2(donefetch), .QN(n80) );
  NOR4X0 U72 ( .IN1(state_reg[3]), .IN2(state_reg[1]), .IN3(state_reg[0]), 
        .IN4(n87), .QN(enregalu) );
  INVX0 U73 ( .IN(n91), .QN(done) );
  NAND2X0 U74 ( .IN1(state_reg[2]), .IN2(n103), .QN(n91) );
  NOR2X0 U75 ( .IN1(n105), .IN2(n106), .QN(n104) );
  AND3X1 U76 ( .IN1(parameter1[2]), .IN2(ALUinR1), .IN3(n105), .Q(N71) );
  NOR3X0 U77 ( .IN1(n107), .IN2(n100), .IN3(n108), .QN(N69) );
  NOR3X0 U78 ( .IN1(n100), .IN2(parameter1[0]), .IN3(n107), .QN(N68) );
  NOR2X0 U79 ( .IN1(n100), .IN2(n109), .QN(N67) );
  AND3X1 U80 ( .IN1(ALUinR1), .IN2(n106), .IN3(n105), .Q(N66) );
  AND3X1 U81 ( .IN1(ALUoutEn), .IN2(parameter1[2]), .IN3(n105), .Q(N65) );
  INVX0 U82 ( .IN(n110), .QN(n105) );
  NOR3X0 U83 ( .IN1(n99), .IN2(n107), .IN3(n108), .QN(N64) );
  NOR3X0 U84 ( .IN1(n99), .IN2(parameter1[0]), .IN3(n107), .QN(N63) );
  NAND2X0 U85 ( .IN1(parameter1[1]), .IN2(n106), .QN(n107) );
  NOR2X0 U86 ( .IN1(n109), .IN2(n99), .QN(N62) );
  NAND3X0 U87 ( .IN1(n111), .IN2(n106), .IN3(parameter1[0]), .QN(n109) );
  INVX0 U88 ( .IN(parameter1[2]), .QN(n106) );
  NOR3X0 U89 ( .IN1(n99), .IN2(parameter1[2]), .IN3(n110), .QN(N61) );
  NAND2X0 U90 ( .IN1(n111), .IN2(n108), .QN(n110) );
  INVX0 U91 ( .IN(parameter1[0]), .QN(n108) );
  INVX0 U92 ( .IN(parameter1[1]), .QN(n111) );
  INVX0 U93 ( .IN(n99), .QN(ALUoutEn) );
  NAND4X0 U94 ( .IN1(state_reg[2]), .IN2(state_reg[0]), .IN3(n88), .IN4(n89), 
        .QN(n99) );
  NAND4X0 U95 ( .IN1(state_reg[0]), .IN2(n88), .IN3(n87), .IN4(n89), .QN(n98)
         );
  INVX0 U96 ( .IN(n100), .QN(ALUinR1) );
  NAND2X0 U97 ( .IN1(n103), .IN2(n87), .QN(n100) );
  NOR3X0 U98 ( .IN1(n90), .IN2(state_reg[3]), .IN3(n88), .QN(n103) );
endmodule

