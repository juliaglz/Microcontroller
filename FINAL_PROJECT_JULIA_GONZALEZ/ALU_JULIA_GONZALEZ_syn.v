
module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [16:0] carry;
  wire   [15:0] B_AS;
  assign carry[0] = ADD_SUB;

  XOR3X1 U1_15 ( .IN1(A[15]), .IN2(B_AS[15]), .IN3(carry[15]), .Q(SUM[15]) );
  FADDX1 U1_14 ( .A(A[14]), .B(B_AS[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B_AS[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B_AS[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B_AS[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B_AS[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B_AS[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  FADDX1 U1_8 ( .A(A[8]), .B(B_AS[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(B[9]), .IN2(carry[0]), .Q(B_AS[9]) );
  XOR2X1 U2 ( .IN1(B[8]), .IN2(carry[0]), .Q(B_AS[8]) );
  XOR2X1 U3 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U4 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U5 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U6 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U7 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U8 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U9 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U10 ( .IN1(B[15]), .IN2(carry[0]), .Q(B_AS[15]) );
  XOR2X1 U11 ( .IN1(B[14]), .IN2(carry[0]), .Q(B_AS[14]) );
  XOR2X1 U12 ( .IN1(B[13]), .IN2(carry[0]), .Q(B_AS[13]) );
  XOR2X1 U13 ( .IN1(B[12]), .IN2(carry[0]), .Q(B_AS[12]) );
  XOR2X1 U14 ( .IN1(B[11]), .IN2(carry[0]), .Q(B_AS[11]) );
  XOR2X1 U15 ( .IN1(B[10]), .IN2(carry[0]), .Q(B_AS[10]) );
  XOR2X1 U16 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( A, B, ALU_Sel, ALU_Result );
  input [15:0] A;
  input [15:0] B;
  input [2:0] ALU_Sel;
  output [15:0] ALU_Result;
  wire   N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, \U2/U1/Z_0 , n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207;

  alu_DW01_addsub_0 r56 ( .A(A), .B(B), .CI(1'b0), .ADD_SUB(\U2/U1/Z_0 ), 
        .SUM({N80, N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, 
        N67, N66, N65}) );
  MUX21X1 U112 ( .IN1(n113), .IN2(n114), .S(A[0]), .Q(n199) );
  MUX21X1 U113 ( .IN1(n113), .IN2(n114), .S(A[10]), .Q(n193) );
  MUX21X1 U114 ( .IN1(n113), .IN2(n114), .S(A[11]), .Q(n187) );
  MUX21X1 U115 ( .IN1(n113), .IN2(n114), .S(A[12]), .Q(n181) );
  MUX21X1 U116 ( .IN1(n113), .IN2(n114), .S(A[13]), .Q(n175) );
  MUX21X1 U117 ( .IN1(n113), .IN2(n114), .S(A[14]), .Q(n169) );
  INVX2 U118 ( .IN(n99), .QN(n112) );
  NAND3X1 U119 ( .IN1(n100), .IN2(n206), .IN3(ALU_Sel[1]), .QN(n113) );
  INVX2 U120 ( .IN(n114), .QN(n106) );
  INVX2 U121 ( .IN(n111), .QN(n108) );
  NAND3X1 U122 ( .IN1(n100), .IN2(n207), .IN3(ALU_Sel[2]), .QN(n114) );
  NAND3X1 U123 ( .IN1(ALU_Sel[0]), .IN2(n207), .IN3(ALU_Sel[2]), .QN(n111) );
  NAND2X2 U124 ( .IN1(n110), .IN2(n205), .QN(n109) );
  NAND3X1 U125 ( .IN1(ALU_Sel[2]), .IN2(n100), .IN3(ALU_Sel[1]), .QN(n110) );
  NOR2X2 U126 ( .IN1(n99), .IN2(n100), .QN(\U2/U1/Z_0 ) );
  NAND3X0 U127 ( .IN1(n101), .IN2(n102), .IN3(n103), .QN(ALU_Result[9]) );
  MUX21X1 U128 ( .IN1(n104), .IN2(n105), .S(B[9]), .Q(n103) );
  NOR2X0 U129 ( .IN1(n106), .IN2(n107), .QN(n105) );
  MUX21X1 U130 ( .IN1(n108), .IN2(n109), .S(A[9]), .Q(n107) );
  MUX21X1 U131 ( .IN1(n110), .IN2(n111), .S(A[9]), .Q(n104) );
  NAND2X0 U132 ( .IN1(N74), .IN2(n112), .QN(n102) );
  MUX21X1 U133 ( .IN1(n113), .IN2(n114), .S(A[9]), .Q(n101) );
  NAND3X0 U134 ( .IN1(n115), .IN2(n116), .IN3(n117), .QN(ALU_Result[8]) );
  MUX21X1 U135 ( .IN1(n118), .IN2(n119), .S(B[8]), .Q(n117) );
  NOR2X0 U136 ( .IN1(n106), .IN2(n120), .QN(n119) );
  MUX21X1 U137 ( .IN1(n108), .IN2(n109), .S(A[8]), .Q(n120) );
  MUX21X1 U138 ( .IN1(n110), .IN2(n111), .S(A[8]), .Q(n118) );
  NAND2X0 U139 ( .IN1(N73), .IN2(n112), .QN(n116) );
  MUX21X1 U140 ( .IN1(n113), .IN2(n114), .S(A[8]), .Q(n115) );
  NAND3X0 U141 ( .IN1(n121), .IN2(n122), .IN3(n123), .QN(ALU_Result[7]) );
  MUX21X1 U142 ( .IN1(n124), .IN2(n125), .S(B[7]), .Q(n123) );
  NOR2X0 U143 ( .IN1(n106), .IN2(n126), .QN(n125) );
  MUX21X1 U144 ( .IN1(n108), .IN2(n109), .S(A[7]), .Q(n126) );
  MUX21X1 U145 ( .IN1(n110), .IN2(n111), .S(A[7]), .Q(n124) );
  NAND2X0 U146 ( .IN1(N72), .IN2(n112), .QN(n122) );
  MUX21X1 U147 ( .IN1(n113), .IN2(n114), .S(A[7]), .Q(n121) );
  NAND3X0 U148 ( .IN1(n127), .IN2(n128), .IN3(n129), .QN(ALU_Result[6]) );
  MUX21X1 U149 ( .IN1(n130), .IN2(n131), .S(B[6]), .Q(n129) );
  NOR2X0 U150 ( .IN1(n106), .IN2(n132), .QN(n131) );
  MUX21X1 U151 ( .IN1(n108), .IN2(n109), .S(A[6]), .Q(n132) );
  MUX21X1 U152 ( .IN1(n110), .IN2(n111), .S(A[6]), .Q(n130) );
  NAND2X0 U153 ( .IN1(N71), .IN2(n112), .QN(n128) );
  MUX21X1 U154 ( .IN1(n113), .IN2(n114), .S(A[6]), .Q(n127) );
  NAND3X0 U155 ( .IN1(n133), .IN2(n134), .IN3(n135), .QN(ALU_Result[5]) );
  MUX21X1 U156 ( .IN1(n136), .IN2(n137), .S(B[5]), .Q(n135) );
  NOR2X0 U157 ( .IN1(n106), .IN2(n138), .QN(n137) );
  MUX21X1 U158 ( .IN1(n108), .IN2(n109), .S(A[5]), .Q(n138) );
  MUX21X1 U159 ( .IN1(n110), .IN2(n111), .S(A[5]), .Q(n136) );
  NAND2X0 U160 ( .IN1(N70), .IN2(n112), .QN(n134) );
  MUX21X1 U161 ( .IN1(n113), .IN2(n114), .S(A[5]), .Q(n133) );
  NAND3X0 U162 ( .IN1(n139), .IN2(n140), .IN3(n141), .QN(ALU_Result[4]) );
  MUX21X1 U163 ( .IN1(n142), .IN2(n143), .S(B[4]), .Q(n141) );
  NOR2X0 U164 ( .IN1(n106), .IN2(n144), .QN(n143) );
  MUX21X1 U165 ( .IN1(n108), .IN2(n109), .S(A[4]), .Q(n144) );
  MUX21X1 U166 ( .IN1(n110), .IN2(n111), .S(A[4]), .Q(n142) );
  NAND2X0 U167 ( .IN1(N69), .IN2(n112), .QN(n140) );
  MUX21X1 U168 ( .IN1(n113), .IN2(n114), .S(A[4]), .Q(n139) );
  NAND3X0 U169 ( .IN1(n145), .IN2(n146), .IN3(n147), .QN(ALU_Result[3]) );
  MUX21X1 U170 ( .IN1(n148), .IN2(n149), .S(B[3]), .Q(n147) );
  NOR2X0 U171 ( .IN1(n106), .IN2(n150), .QN(n149) );
  MUX21X1 U172 ( .IN1(n108), .IN2(n109), .S(A[3]), .Q(n150) );
  MUX21X1 U173 ( .IN1(n110), .IN2(n111), .S(A[3]), .Q(n148) );
  NAND2X0 U174 ( .IN1(N68), .IN2(n112), .QN(n146) );
  MUX21X1 U175 ( .IN1(n113), .IN2(n114), .S(A[3]), .Q(n145) );
  NAND3X0 U176 ( .IN1(n151), .IN2(n152), .IN3(n153), .QN(ALU_Result[2]) );
  MUX21X1 U177 ( .IN1(n154), .IN2(n155), .S(B[2]), .Q(n153) );
  NOR2X0 U178 ( .IN1(n106), .IN2(n156), .QN(n155) );
  MUX21X1 U179 ( .IN1(n108), .IN2(n109), .S(A[2]), .Q(n156) );
  MUX21X1 U180 ( .IN1(n110), .IN2(n111), .S(A[2]), .Q(n154) );
  NAND2X0 U181 ( .IN1(N67), .IN2(n112), .QN(n152) );
  MUX21X1 U182 ( .IN1(n113), .IN2(n114), .S(A[2]), .Q(n151) );
  NAND3X0 U183 ( .IN1(n157), .IN2(n158), .IN3(n159), .QN(ALU_Result[1]) );
  MUX21X1 U184 ( .IN1(n160), .IN2(n161), .S(B[1]), .Q(n159) );
  NOR2X0 U185 ( .IN1(n106), .IN2(n162), .QN(n161) );
  MUX21X1 U186 ( .IN1(n108), .IN2(n109), .S(A[1]), .Q(n162) );
  MUX21X1 U187 ( .IN1(n110), .IN2(n111), .S(A[1]), .Q(n160) );
  NAND2X0 U188 ( .IN1(N66), .IN2(n112), .QN(n158) );
  MUX21X1 U189 ( .IN1(n113), .IN2(n114), .S(A[1]), .Q(n157) );
  NAND3X0 U190 ( .IN1(n163), .IN2(n164), .IN3(n165), .QN(ALU_Result[15]) );
  MUX21X1 U191 ( .IN1(n166), .IN2(n167), .S(B[15]), .Q(n165) );
  NOR2X0 U192 ( .IN1(n106), .IN2(n168), .QN(n167) );
  MUX21X1 U193 ( .IN1(n108), .IN2(n109), .S(A[15]), .Q(n168) );
  MUX21X1 U194 ( .IN1(n110), .IN2(n111), .S(A[15]), .Q(n166) );
  NAND2X0 U195 ( .IN1(N80), .IN2(n112), .QN(n164) );
  MUX21X1 U196 ( .IN1(n113), .IN2(n114), .S(A[15]), .Q(n163) );
  NAND3X0 U197 ( .IN1(n169), .IN2(n170), .IN3(n171), .QN(ALU_Result[14]) );
  MUX21X1 U198 ( .IN1(n172), .IN2(n173), .S(B[14]), .Q(n171) );
  NOR2X0 U199 ( .IN1(n106), .IN2(n174), .QN(n173) );
  MUX21X1 U200 ( .IN1(n108), .IN2(n109), .S(A[14]), .Q(n174) );
  MUX21X1 U201 ( .IN1(n110), .IN2(n111), .S(A[14]), .Q(n172) );
  NAND2X0 U202 ( .IN1(N79), .IN2(n112), .QN(n170) );
  NAND3X0 U203 ( .IN1(n175), .IN2(n176), .IN3(n177), .QN(ALU_Result[13]) );
  MUX21X1 U204 ( .IN1(n178), .IN2(n179), .S(B[13]), .Q(n177) );
  NOR2X0 U205 ( .IN1(n106), .IN2(n180), .QN(n179) );
  MUX21X1 U206 ( .IN1(n108), .IN2(n109), .S(A[13]), .Q(n180) );
  MUX21X1 U207 ( .IN1(n110), .IN2(n111), .S(A[13]), .Q(n178) );
  NAND2X0 U208 ( .IN1(N78), .IN2(n112), .QN(n176) );
  NAND3X0 U209 ( .IN1(n181), .IN2(n182), .IN3(n183), .QN(ALU_Result[12]) );
  MUX21X1 U210 ( .IN1(n184), .IN2(n185), .S(B[12]), .Q(n183) );
  NOR2X0 U211 ( .IN1(n106), .IN2(n186), .QN(n185) );
  MUX21X1 U212 ( .IN1(n108), .IN2(n109), .S(A[12]), .Q(n186) );
  MUX21X1 U213 ( .IN1(n110), .IN2(n111), .S(A[12]), .Q(n184) );
  NAND2X0 U214 ( .IN1(N77), .IN2(n112), .QN(n182) );
  NAND3X0 U215 ( .IN1(n187), .IN2(n188), .IN3(n189), .QN(ALU_Result[11]) );
  MUX21X1 U216 ( .IN1(n190), .IN2(n191), .S(B[11]), .Q(n189) );
  NOR2X0 U217 ( .IN1(n106), .IN2(n192), .QN(n191) );
  MUX21X1 U218 ( .IN1(n108), .IN2(n109), .S(A[11]), .Q(n192) );
  MUX21X1 U219 ( .IN1(n110), .IN2(n111), .S(A[11]), .Q(n190) );
  NAND2X0 U220 ( .IN1(N76), .IN2(n112), .QN(n188) );
  NAND3X0 U221 ( .IN1(n193), .IN2(n194), .IN3(n195), .QN(ALU_Result[10]) );
  MUX21X1 U222 ( .IN1(n196), .IN2(n197), .S(B[10]), .Q(n195) );
  NOR2X0 U223 ( .IN1(n106), .IN2(n198), .QN(n197) );
  MUX21X1 U224 ( .IN1(n108), .IN2(n109), .S(A[10]), .Q(n198) );
  MUX21X1 U225 ( .IN1(n110), .IN2(n111), .S(A[10]), .Q(n196) );
  NAND2X0 U226 ( .IN1(N75), .IN2(n112), .QN(n194) );
  NAND3X0 U227 ( .IN1(n199), .IN2(n200), .IN3(n201), .QN(ALU_Result[0]) );
  MUX21X1 U228 ( .IN1(n202), .IN2(n203), .S(B[0]), .Q(n201) );
  NOR2X0 U229 ( .IN1(n106), .IN2(n204), .QN(n203) );
  MUX21X1 U230 ( .IN1(n108), .IN2(n109), .S(A[0]), .Q(n204) );
  NAND3X0 U231 ( .IN1(ALU_Sel[0]), .IN2(n206), .IN3(ALU_Sel[1]), .QN(n205) );
  MUX21X1 U232 ( .IN1(n110), .IN2(n111), .S(A[0]), .Q(n202) );
  NAND2X0 U233 ( .IN1(N65), .IN2(n112), .QN(n200) );
  NAND2X0 U234 ( .IN1(n207), .IN2(n206), .QN(n99) );
  INVX0 U235 ( .IN(ALU_Sel[1]), .QN(n207) );
  INVX0 U236 ( .IN(ALU_Sel[2]), .QN(n206) );
  INVX0 U237 ( .IN(ALU_Sel[0]), .QN(n100) );
endmodule

