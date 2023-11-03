
module pc_counter_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HADDX1 U1_1_14 ( .A0(A[14]), .B0(carry[14]), .C1(carry[15]), .SO(SUM[14]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1 U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX1 U1_1_11 ( .A0(A[11]), .B0(carry[11]), .C1(carry[12]), .SO(SUM[11]) );
  HADDX1 U1_1_12 ( .A0(A[12]), .B0(carry[12]), .C1(carry[13]), .SO(SUM[12]) );
  HADDX1 U1_1_13 ( .A0(A[13]), .B0(carry[13]), .C1(carry[14]), .SO(SUM[13]) );
  INVX0 U1 ( .IN(A[0]), .QN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[15]), .IN2(A[15]), .Q(SUM[15]) );
endmodule


module pc_counter ( rst, pc, pcsignal );
  output [15:0] pc;
  input rst, pcsignal;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         n34;

  pc_counter_DW01_inc_0 add_11 ( .A(pc), .SUM({N16, N15, N14, N13, N12, N11, 
        N10, N9, N8, N7, N6, N5, N4, N3, N2, N1}) );
  DFFARX1 \pc_reg[6]  ( .D(N7), .CLK(pcsignal), .RSTB(n34), .Q(pc[6]) );
  DFFARX1 \pc_reg[5]  ( .D(N6), .CLK(pcsignal), .RSTB(n34), .Q(pc[5]) );
  DFFARX1 \pc_reg[4]  ( .D(N5), .CLK(pcsignal), .RSTB(n34), .Q(pc[4]) );
  DFFARX1 \pc_reg[3]  ( .D(N4), .CLK(pcsignal), .RSTB(n34), .Q(pc[3]) );
  DFFARX1 \pc_reg[2]  ( .D(N3), .CLK(pcsignal), .RSTB(n34), .Q(pc[2]) );
  DFFARX1 \pc_reg[1]  ( .D(N2), .CLK(pcsignal), .RSTB(n34), .Q(pc[1]) );
  DFFARX1 \pc_reg[0]  ( .D(N1), .CLK(pcsignal), .RSTB(n34), .Q(pc[0]) );
  DFFARX1 \pc_reg[7]  ( .D(N8), .CLK(pcsignal), .RSTB(n34), .Q(pc[7]) );
  DFFARX1 \pc_reg[8]  ( .D(N9), .CLK(pcsignal), .RSTB(n34), .Q(pc[8]) );
  DFFARX1 \pc_reg[9]  ( .D(N10), .CLK(pcsignal), .RSTB(n34), .Q(pc[9]) );
  DFFARX1 \pc_reg[10]  ( .D(N11), .CLK(pcsignal), .RSTB(n34), .Q(pc[10]) );
  DFFARX1 \pc_reg[11]  ( .D(N12), .CLK(pcsignal), .RSTB(n34), .Q(pc[11]) );
  DFFARX1 \pc_reg[12]  ( .D(N13), .CLK(pcsignal), .RSTB(n34), .Q(pc[12]) );
  DFFARX1 \pc_reg[13]  ( .D(N14), .CLK(pcsignal), .RSTB(n34), .Q(pc[13]) );
  DFFARX1 \pc_reg[14]  ( .D(N15), .CLK(pcsignal), .RSTB(n34), .Q(pc[14]) );
  DFFARX1 \pc_reg[15]  ( .D(N16), .CLK(pcsignal), .RSTB(n34), .Q(pc[15]) );
  INVX2 U4 ( .IN(rst), .QN(n34) );
endmodule

