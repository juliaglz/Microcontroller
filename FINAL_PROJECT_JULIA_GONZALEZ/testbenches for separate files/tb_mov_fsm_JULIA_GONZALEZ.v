`timescale 10ns/1ns
module tb_FSM_movop;
    reg clk,rst,start,donefetch;
    reg [5:0] parameter1, parameter2;  
    wire r0in,r1in,r2in,r3in,R0OutEn,R1OutEn,R2OutEn,R3OutEn;
    wire Regjout,Regiin,done;

    
    mov moore_mov(clk,rst,donefetch,start,done,Regjout,Regiin,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn);
    initial begin 
             clk=0;
             start=0;
             donefetch=0;
             rst=0;
             #7 rst = 1;
             #7 rst=0;   
             #20 start = 1;
                 parameter1=6'b000000;
                 parameter2=6'b000010;
                 
           end
    always #5 clk=~clk;
    
  
endmodule
