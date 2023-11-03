module toplevel_finalproject(clk,rst,datatb,P1in,P1OutEn,p0tobuff);
  input clk, rst;
  input [15:0] datatb;
  input P1in,P1OutEn;
  wire MFC;
  wire IRin,r0in, r1in, r2in, r3in, R0OutEn, R1OutEn, R2OutEn, R3OutEn,PCOutEn,start1,start2,start3,start4,start5,start6,start7,done,Regiout,Regjout,Regiin;
  wire PCsignal,enout_movi,enout_opi,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,MDROutEn2,done_fetch;
  wire [15:0] bus,IRtodecoder,PCtobuff,MARtomem,MDRtobuff,MDRtomem,r0tobuff,r1tobuff,r2tobuff,r3tobuff,p1tobuff,r0toalu,r1toalu,resulttoreg,r2tobuff_alu,Dataout,datamovi,dataopi;
  wire [5:0] parameter1, parameter2;
  wire [2:0] ALU_Sel;
  inout [15:0] p0tobuff;

  Register R0(.clk(clk), .d(bus), .ei(r0in), .rst(rst), .q(r0tobuff));
  Register R1(.clk(clk), .d(bus), .ei(r1in), .rst(rst), .q(r1tobuff));
  Register R2(.clk(clk), .d(bus), .ei(r2in), .rst(rst), .q(r2tobuff));
  Register R3(.clk(clk), .d(bus), .ei(r3in), .rst(rst), .q(r3tobuff)); 
  tristate_buffer tst_R0(.T(R0OutEn), .I(r0tobuff), .O(bus));
  tristate_buffer tst_R1(.T(R1OutEn), .I(r1tobuff), .O(bus));
  tristate_buffer tst_R2(.T(R2OutEn), .I(r2tobuff), .O(bus));
  tristate_buffer tst_R3(.T(R3OutEn), .I(r3tobuff), .O(bus));
  
  toplevel_ALU alu_blocktoplevel_ALU (.clk(clk),.rst(rst),.r0en(r0in_alu),.r1en(r1in_alu),.r0toalu(r0toalu),.r1toalu(r1toalu),.ALU_Sel(ALU_Sel),.resulttoreg(resulttoreg),.r2en(r2in_alu),.r2tobuff_alu(r2tobuff_alu),.bus(bus),.aluOutEn(aluOutEn));
  
  Register P0(.clk(clk), .d(bus), .ei(P0in), .rst(rst), .q(p0tobuff));
  tristate_buffer tst_P2(.T(P0OutEn), .I(p0tobuff), .O(bus));
  
   Register P1(.clk(clk), .d(datatb), .ei(P1in), .rst(rst), .q(p1tobuff));
  tristate_buffer tst_P1(.T(P1OutEn), .I(p1tobuff), .O(bus));
  
  Register MAR(.clk(clk), .d(bus), .ei(MARin), .rst(rst), .q(MARtomem));
  
  
  Register MBR_tobus(.clk(clk), .d(Dataout), .ei(MDR_tobusin), .rst(rst), .q(MDRtobuff));
  tristate_buffer tst_MBR(.T(MDROutEn), .I(MDRtobuff), .O(bus));
  
  
  Register MBR_frombus(.clk(clk), .d(bus), .ei(MDR_frombusin), .rst(rst), .q(MDRtomem));
  tristate_buffer tst_MBR2(.T(MDROutEn2), .I(MDRtomem), .O(bus));
  
  mainmemory memory(.Dataout(Dataout), .MFC(MFC), .EN(EN), .addr(MARtomem), .datain(MDRtomem), .RW(RW));
   
  Register IR(.clk(clk), .d(bus), .ei(IRin), .rst(rst), .q(IRtodecoder));
  decoder IRdecoder(.IRin(done_fetch),.start1(start1),.start2(start2),.start3(start3),.start4(start4),.start5(start5),.start6(start6),.start7(start7),.instruction(IRtodecoder),.parameter1(parameter1),.parameter2(parameter2),.ALU_Sel(ALU_Sel));
  pc_counter PC (.rst(rst),.pc(PCtobuff),.pcsignal(PCsignal));
  tristate_buffer tst_PC(.T(PCOutEn), .I(PCtobuff), .O(bus));
  //FSMs
  mov operation_mov(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start7),.done(done_mov),.Regjout(Regjout_mov),.Regiin(Regiin_mov),.parameter1(parameter1),.parameter2(parameter2),.r0in(r0in_mov),.r1in(r1in_mov),.r2in(r2in_mov),.r3in(r3in_mov),.P0in(P0in_mov),.R0OutEn(R0OutEn_mov),.R1OutEn(R1OutEn_mov),.R2OutEn(R2OutEn_mov),.R3OutEn(R3OutEn_mov),.P0OutEn(P0OutEn_mov));
  movi operation_movi(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start4),.done(done_movi),.Regiin(Regiin_movi),.parameter1(parameter1),.parameter2(parameter2),.r0in(r0in_movi),.r1in(r1in_movi),.r2in(r2in_movi),.r3in(r3in_movi),.P0in(P0in_movi),.buffen(enout_movi),.bufftobus(datamovi));
  tristate_buffer tst_movi(.T(enout_movi), .I(datamovi), .O(bus));
  store operation_store(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start6),.parameter1(parameter1),.parameter2(parameter2),.R0OutEn(R0OutEn_store),.R1OutEn(R1OutEn_store),.R2OutEn(R2OutEn_store),.R3OutEn(R3OutEn_store),.P0OutEn(P0OutEn_store),.Regiout(Regiout_store),.Regjout(Regjout_store),.MARin(MARin_store),.MDR_frombusin(MDR_frombusin_store),.EN(EN_store),.RW(RW_store),.done(done_store));

  load oeration_load(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start5),.parameter1(parameter1),.parameter2(parameter2),.r0in(r0in_load),.r1in(r1in_load),.r2in(r2in_load),.r3in(r3in_load),.P0in(P0in_load),.R0OutEn(R0OutEn_load),.R1OutEn(R1OutEn_load),.R2OutEn(R2OutEn_load),.R3OutEn(R3OutEn_load),.P0OutEn(P0OutEn_load),.Regiout(Regiout_load),.Regjin(Regjin_load),.MARin(MARin_load),.MDR_tobusin(MDR_tobusin_load),.MDROutEn(MDROutEn_load),.EN(EN_load),.RW(RW_load),.done(done_load));

  ALUoperations operation_2regs(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start2),.parameter1(parameter1),.parameter2(parameter2),.r0in(r0in_opreg),.r1in(r1in_opreg),.r2in(r2in_opreg),.r3in(r3in_opreg),.P0in(P0in_opreg),.R0OutEn(R0OutEn_opreg),.R1OutEn(R1OutEn_opreg),.R2OutEn(R2OutEn_opreg),.R3OutEn(R3OutEn_opreg),.P0OutEn(P0OutEn_opreg),.ALUinR1(ALUinR1_opreg),.ALUinR2(ALUinR2_opreg),.enregalu(enregalu_opreg),.ALUoutEn(ALUoutEn_opreg),.Regiout(Regiout_opreg),.Regjout(Regjout_opreg),.Regiin(Regiin_opreg),.done(done_opreg));
  
  ALUinmediate operation_inm(.clk(clk),.rst(rst),.donefetch(done_fetch),.start(start3),.parameter1(parameter1),.parameter2(parameter2),.r0in(r0in_opi),.r1in(r1in_opi),.r2in(r2in_opi),.r3in(r3in_opi),.P0in(P0in_opi),.R0OutEn(R0OutEn_opi),.R1OutEn(R1OutEn_opi),.R2OutEn(R2OutEn_opi),.R3OutEn(R3OutEn_opi),.P0OutEn(P0OutEn_opi),.ALUinR1(ALUinR1_opi),.ALUinR2(ALUinR2_opi),.enregalu(enregalu_opi),.ALUoutEn(ALUoutEn_opi),.Regiout(Regiout_opi),.Regiin(Regiin_opi),.done(done_opi),.inmtobuff(enout_opi),.inmtoalu(dataopi));
  tristate_buffer tst_opi(.T(enout_opi), .I(dataopi), .O(bus));

  
  
  fetch operation_fetch(.clk(clk),.rst(rst),.done(done),.MFC(MFC),.PCOutEn(PCOutEn),.PCsignal(PCsignal),.MARin(MARin_fetch),.EN(EN_fetch),.RW(RW_fetch),.MDR_tobusin(MDR_tobusin_fetch),.MDR_frombusin(MDR_frombusin_fetch),.MDROutEn(MDROutEn_fetch),.IRin(IRin),.done_fetch(done_fetch));

  assign r0in = (r0in_mov||r0in_movi||r0in_opi||r0in_opreg||r0in_load);
  assign r1in = (r1in_mov||r1in_movi||r1in_opi||r1in_opreg||r1in_load);
  assign r2in = (r2in_mov||r2in_movi||r2in_opi||r2in_opreg||r2in_load);
  assign r3in = (r3in_mov||r3in_movi||r3in_opi||r3in_opreg||r3in_load);
  assign P0in = (P0in_mov||P0in_movi||P0in_opi||P0in_opreg||P0in_load);
  assign done = (done_mov||done_movi||done_opi||done_opreg||done_store||done_load);
  assign Regiin = (Regiin_mov || Regiin_movi||Regiin_opi||Regiin_opreg);
  assign Regjin = (Regjin_load);
  assign Regjout = (Regjout_mov||Regjout_opreg||Regjout_store);
  assign Regiout = (Regiout_opi||Regiout_opreg||Regiout_store||Regiout_load);
  assign r0in_alu=(ALUinR1_opi||ALUinR1_opreg);
  assign r1in_alu=(ALUinR2_opi||ALUinR2_opreg);
  assign r2in_alu=(enregalu_opi||enregalu_opreg);
  assign aluOutEn=(ALUoutEn_opi||ALUoutEn_opreg);
  assign R0OutEn=(R0OutEn_mov||R0OutEn_opi||R0OutEn_opreg||R0OutEn_store||R0OutEn_load);
  assign R1OutEn=(R1OutEn_mov||R1OutEn_opi||R1OutEn_opreg||R1OutEn_store||R1OutEn_load);
  assign R2OutEn=(R2OutEn_mov||R2OutEn_opi||R2OutEn_opreg||R2OutEn_store||R2OutEn_load);
  assign R3OutEn=(R3OutEn_mov||R3OutEn_opi||R3OutEn_opreg||R3OutEn_store||R3OutEn_load);
  assign P0OutEn=(P0OutEn_mov||P0OutEn_opi||P0OutEn_opreg||P0OutEn_store||P0OutEn_load);
  assign MARin=(MARin_store||MARin_fetch||MARin_load);  
  assign MDR_frombusin=(MDR_frombusin_store||MDR_frombusin_fetch);
  assign MDROutEn=(MDROutEn_fetch);
  assign MDROutEn2=(MDROutEn_load);
  assign MDR_tobusin = (MDR_tobusin_load || MDR_tobusin_fetch);
  assign EN=(EN_store||EN_fetch||EN_load);
  assign RW=(RW_store||RW_fetch||RW_load);
endmodule