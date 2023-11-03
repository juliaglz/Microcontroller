`timescale 10ns/1ns
module tb_FSM_inmALUop;
    reg clk,rst,start,donefetch;
    reg [5:0] parameter1, parameter2;
    wire r0in,r1in,r2in,r3in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,ALUinR1,ALUinR2,ALUoutEn,Regiout,Regiin,done,inmtobuff,inmtoalu;

    ALUinmediate moore_inmALUop(clk,rst,donefetch,start,parameter1,parameter2,r0in,r1in,r2in,r3in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,ALUinR1,ALUinR2,ALUoutEn,Regiout,Regiin,done,inmtobuff,inmtoalu);

    initial begin 
              clk=0;
             start=0;
             donefetch=0;
             rst=0;
             #7 rst = 1;
             #7 rst=0;   
             #20 start = 1;
             parameter1=6'b000000;
             parameter2=6'b000011;
           end
    always #5 clk=~clk;
    
    
  
endmodule
