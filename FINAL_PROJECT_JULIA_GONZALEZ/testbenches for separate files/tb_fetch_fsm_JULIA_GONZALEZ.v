`timescale 10ns/1ns
module tb_FSM_fetch;
    reg clk;
    reg rst;
    reg done,MFC;
    wire PCOutEn,PCsignal,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,IRin,done_fetch;
    
    fetch moore_fetch(clk,rst,done,MFC,PCOutEn,PCsignal,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,IRin,done_fetch);
    initial begin 
             clk=0;
             MFC=0;
             done=0;
             rst=0;
             #7 rst = 1;
             #7 rst=0;   
             #20 MFC = 1;
             #20 MFC = 0;
           end
    always #5 clk=~clk;
    
  
endmodule

 