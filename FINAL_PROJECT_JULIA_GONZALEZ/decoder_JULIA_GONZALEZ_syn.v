
module decoder ( IRin, start1, start2, start3, start4, start5, start6, start7, 
        instruction, parameter1, parameter2, ALU_Sel );
  input [15:0] instruction;
  output [5:0] parameter1;
  output [5:0] parameter2;
  output [2:0] ALU_Sel;
  input IRin;
  output start1, start2, start3, start4, start5, start6, start7;
  wire   N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, n36, n39, n40, n41, n42, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85;
  assign start1 = 1'b0;

  DFFNX1 start5_reg ( .D(N87), .CLK(IRin), .Q(start5) );
  DFFNX1 start4_reg ( .D(N86), .CLK(IRin), .Q(start4) );
  DFFNX1 start6_reg ( .D(N88), .CLK(IRin), .Q(start6) );
  DFFNX1 \parameter1_reg[5]  ( .D(N77), .CLK(IRin), .Q(parameter1[5]) );
  DFFNX1 \parameter1_reg[4]  ( .D(N76), .CLK(IRin), .Q(parameter1[4]) );
  DFFNX1 \parameter1_reg[3]  ( .D(N75), .CLK(IRin), .Q(parameter1[3]) );
  DFFNX1 \parameter1_reg[2]  ( .D(N74), .CLK(IRin), .Q(parameter1[2]) );
  DFFNX1 \parameter1_reg[1]  ( .D(N73), .CLK(IRin), .Q(parameter1[1]) );
  DFFNX1 \parameter1_reg[0]  ( .D(N72), .CLK(IRin), .Q(parameter1[0]) );
  DFFNX1 \parameter2_reg[5]  ( .D(N83), .CLK(IRin), .Q(parameter2[5]) );
  DFFNX1 \parameter2_reg[4]  ( .D(N82), .CLK(IRin), .Q(parameter2[4]) );
  DFFNX1 \parameter2_reg[3]  ( .D(N81), .CLK(IRin), .Q(parameter2[3]) );
  DFFNX1 \parameter2_reg[2]  ( .D(N80), .CLK(IRin), .Q(parameter2[2]) );
  DFFNX1 \parameter2_reg[1]  ( .D(N79), .CLK(IRin), .Q(parameter2[1]) );
  DFFNX1 \parameter2_reg[0]  ( .D(N78), .CLK(IRin), .Q(parameter2[0]) );
  DFFNX1 start2_reg ( .D(N84), .CLK(IRin), .Q(start2) );
  DFFNX1 start3_reg ( .D(N85), .CLK(IRin), .Q(start3) );
  DFFNX1 start7_reg ( .D(n42), .CLK(IRin), .Q(start7) );
  DFFNX1 \ALU_Sel_reg[2]  ( .D(n41), .CLK(IRin), .Q(ALU_Sel[2]) );
  DFFNX1 \ALU_Sel_reg[1]  ( .D(n40), .CLK(IRin), .Q(ALU_Sel[1]), .QN(n36) );
  DFFNX1 \ALU_Sel_reg[0]  ( .D(n39), .CLK(IRin), .Q(ALU_Sel[0]) );
  AO21X1 U54 ( .IN1(n60), .IN2(n61), .IN3(n62), .Q(n42) );
  NOR4X0 U55 ( .IN1(n63), .IN2(n64), .IN3(instruction[14]), .IN4(N86), .QN(n62) );
  NAND3X0 U56 ( .IN1(instruction[13]), .IN2(n65), .IN3(start7), .QN(n63) );
  MUX21X1 U57 ( .IN1(ALU_Sel[2]), .IN2(n66), .S(n67), .Q(n41) );
  NAND3X0 U58 ( .IN1(n68), .IN2(n69), .IN3(n70), .QN(n40) );
  OA22X1 U59 ( .IN1(n36), .IN2(n67), .IN3(n71), .IN4(n72), .Q(n70) );
  INVX0 U60 ( .IN(n73), .QN(n67) );
  NAND3X0 U61 ( .IN1(instruction[13]), .IN2(n74), .IN3(n66), .QN(n68) );
  AO221X1 U62 ( .IN1(n75), .IN2(n76), .IN3(n73), .IN4(ALU_Sel[0]), .IN5(n64), 
        .Q(n39) );
  INVX0 U63 ( .IN(n72), .QN(n64) );
  NAND2X0 U64 ( .IN1(n61), .IN2(n77), .QN(n72) );
  INVX0 U65 ( .IN(n78), .QN(n61) );
  NOR2X0 U66 ( .IN1(N85), .IN2(N84), .QN(n73) );
  MUX21X1 U67 ( .IN1(n66), .IN2(n79), .S(n74), .Q(n75) );
  NOR2X0 U68 ( .IN1(instruction[15]), .IN2(n71), .QN(n79) );
  NOR3X0 U69 ( .IN1(n80), .IN2(instruction[13]), .IN3(n74), .QN(N88) );
  AND3X1 U70 ( .IN1(n60), .IN2(n76), .IN3(n74), .Q(N87) );
  INVX0 U71 ( .IN(n80), .QN(n60) );
  NAND2X0 U72 ( .IN1(instruction[14]), .IN2(instruction[15]), .QN(n80) );
  ISOLANDX1 U73 ( .D(n66), .ISO(n78), .Q(N86) );
  INVX0 U74 ( .IN(n65), .QN(N85) );
  AO22X1 U75 ( .IN1(instruction[12]), .IN2(n77), .IN3(n66), .IN4(n78), .Q(N84)
         );
  NOR2X0 U76 ( .IN1(n77), .IN2(instruction[14]), .QN(n66) );
  ISOLANDX1 U77 ( .D(instruction[5]), .ISO(n81), .Q(N83) );
  ISOLANDX1 U78 ( .D(instruction[4]), .ISO(n81), .Q(N82) );
  ISOLANDX1 U79 ( .D(instruction[3]), .ISO(n81), .Q(N81) );
  ISOLANDX1 U80 ( .D(instruction[2]), .ISO(n81), .Q(N80) );
  ISOLANDX1 U81 ( .D(instruction[1]), .ISO(n81), .Q(N79) );
  ISOLANDX1 U82 ( .D(instruction[0]), .ISO(n81), .Q(N78) );
  NOR2X0 U83 ( .IN1(n82), .IN2(n83), .QN(n81) );
  AO22X1 U84 ( .IN1(instruction[11]), .IN2(n82), .IN3(n83), .IN4(
        instruction[5]), .Q(N77) );
  AO22X1 U85 ( .IN1(instruction[10]), .IN2(n82), .IN3(n83), .IN4(
        instruction[4]), .Q(N76) );
  AO22X1 U86 ( .IN1(instruction[9]), .IN2(n82), .IN3(n83), .IN4(instruction[3]), .Q(N75) );
  AO22X1 U87 ( .IN1(instruction[8]), .IN2(n82), .IN3(n83), .IN4(instruction[2]), .Q(N74) );
  AO22X1 U88 ( .IN1(instruction[7]), .IN2(n82), .IN3(n83), .IN4(instruction[1]), .Q(N73) );
  AO22X1 U89 ( .IN1(instruction[6]), .IN2(n82), .IN3(n83), .IN4(instruction[0]), .Q(N72) );
  INVX0 U90 ( .IN(n69), .QN(n83) );
  NAND4X0 U91 ( .IN1(instruction[14]), .IN2(instruction[12]), .IN3(n76), .IN4(
        n77), .QN(n69) );
  NAND4X0 U92 ( .IN1(instruction[14]), .IN2(n84), .IN3(n65), .IN4(n78), .QN(
        n82) );
  NAND2X0 U93 ( .IN1(instruction[13]), .IN2(instruction[12]), .QN(n78) );
  NAND3X0 U94 ( .IN1(n74), .IN2(n77), .IN3(n85), .QN(n65) );
  XOR2X1 U95 ( .IN1(n71), .IN2(n76), .Q(n85) );
  INVX0 U96 ( .IN(instruction[14]), .QN(n71) );
  INVX0 U97 ( .IN(instruction[15]), .QN(n77) );
  INVX0 U98 ( .IN(instruction[12]), .QN(n74) );
  NAND2X0 U99 ( .IN1(instruction[15]), .IN2(n76), .QN(n84) );
  INVX0 U100 ( .IN(instruction[13]), .QN(n76) );
endmodule

