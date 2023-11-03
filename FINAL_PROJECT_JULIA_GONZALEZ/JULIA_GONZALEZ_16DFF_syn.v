
module Register ( clk, d, ei, rst, q );
  input [15:0] d;
  output [15:0] q;
  input clk, ei, rst;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n20, n21;

  LATCHX1 \q_reg[15]  ( .CLK(N16), .D(N17), .Q(q[15]) );
  LATCHX1 \q_reg[14]  ( .CLK(N16), .D(N15), .Q(q[14]) );
  LATCHX1 \q_reg[13]  ( .CLK(N16), .D(N14), .Q(q[13]) );
  LATCHX1 \q_reg[12]  ( .CLK(N16), .D(N13), .Q(q[12]) );
  LATCHX1 \q_reg[11]  ( .CLK(N16), .D(N12), .Q(q[11]) );
  LATCHX1 \q_reg[10]  ( .CLK(N16), .D(N11), .Q(q[10]) );
  LATCHX1 \q_reg[9]  ( .CLK(N16), .D(N10), .Q(q[9]) );
  LATCHX1 \q_reg[8]  ( .CLK(N16), .D(N9), .Q(q[8]) );
  LATCHX1 \q_reg[7]  ( .CLK(N16), .D(N8), .Q(q[7]) );
  LATCHX1 \q_reg[6]  ( .CLK(N16), .D(N7), .Q(q[6]) );
  LATCHX1 \q_reg[5]  ( .CLK(N16), .D(N6), .Q(q[5]) );
  LATCHX1 \q_reg[4]  ( .CLK(N16), .D(N5), .Q(q[4]) );
  LATCHX1 \q_reg[3]  ( .CLK(N16), .D(N4), .Q(q[3]) );
  LATCHX1 \q_reg[2]  ( .CLK(N16), .D(N3), .Q(q[2]) );
  LATCHX1 \q_reg[1]  ( .CLK(N16), .D(N2), .Q(q[1]) );
  LATCHX1 \q_reg[0]  ( .CLK(N16), .D(N1), .Q(q[0]) );
  NAND2X2 U21 ( .IN1(n21), .IN2(n20), .QN(N16) );
  NAND2X2 U22 ( .IN1(ei), .IN2(n21), .QN(n20) );
  ISOLANDX1 U23 ( .D(d[8]), .ISO(n20), .Q(N9) );
  ISOLANDX1 U24 ( .D(d[7]), .ISO(n20), .Q(N8) );
  ISOLANDX1 U25 ( .D(d[6]), .ISO(n20), .Q(N7) );
  ISOLANDX1 U26 ( .D(d[5]), .ISO(n20), .Q(N6) );
  ISOLANDX1 U27 ( .D(d[4]), .ISO(n20), .Q(N5) );
  ISOLANDX1 U28 ( .D(d[3]), .ISO(n20), .Q(N4) );
  ISOLANDX1 U29 ( .D(d[2]), .ISO(n20), .Q(N3) );
  ISOLANDX1 U30 ( .D(d[1]), .ISO(n20), .Q(N2) );
  ISOLANDX1 U31 ( .D(d[15]), .ISO(n20), .Q(N17) );
  ISOLANDX1 U32 ( .D(d[14]), .ISO(n20), .Q(N15) );
  ISOLANDX1 U33 ( .D(d[13]), .ISO(n20), .Q(N14) );
  ISOLANDX1 U34 ( .D(d[12]), .ISO(n20), .Q(N13) );
  ISOLANDX1 U35 ( .D(d[11]), .ISO(n20), .Q(N12) );
  ISOLANDX1 U36 ( .D(d[10]), .ISO(n20), .Q(N11) );
  ISOLANDX1 U37 ( .D(d[9]), .ISO(n20), .Q(N10) );
  ISOLANDX1 U38 ( .D(d[0]), .ISO(n20), .Q(N1) );
  INVX0 U39 ( .IN(rst), .QN(n21) );
endmodule

