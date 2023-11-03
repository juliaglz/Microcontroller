`timescale 10ns/1ns
module tb_FSM_store;
    reg clk,rst,start,donefetch;
    reg [5:0] parameter1, parameter2;
    wire R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,Regiout,Regjout,MARin,MDR_frombusin,EN,RW,done;
    
    store store_moore(clk,rst,donefetch,start,parameter1, parameter2,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,Regiout,Regjout,MARin,MDR_frombusin,EN,RW,done);
  initial begin 
             clk=0;
             start=0;
             rst=0;
             #7 rst = 1;
             #7 rst=0;   
             #20 start = 1;
             parameter1=6'b000100;
             parameter2=6'b000010;
             
           end
    always #5 clk=~clk;
    
  
endmodule






