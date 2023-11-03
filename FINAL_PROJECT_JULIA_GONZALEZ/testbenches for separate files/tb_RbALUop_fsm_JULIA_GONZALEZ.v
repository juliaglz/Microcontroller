`timescale 10ns/1ns
module tb_FSM_RbALUop;
    reg clk,rst,start,done_fetch;
    reg [5:0] parameter1, parameter2;
    wire r0in,r1in,r2in,r3in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,ALUinR1,ALUinR2,ALUoutEn,Regiout,Regjout,Regiin,done;

    
    ALUoperations moore_ALUoperations(clk,rst,donefetch,start,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,ALUinR1,ALUinR2,enregalu,ALUoutEn,Regiout,Regjout,Regiin,done);

    initial begin 
             clk=0;
             start=0;
             rst=0;
             #7 rst = 1;
             #7 rst=0;   
             #20 start = 1;
             parameter1=6'b000000;
             parameter2=6'b000011;
           end
    always #5 clk=~clk;
    
  
endmodule

