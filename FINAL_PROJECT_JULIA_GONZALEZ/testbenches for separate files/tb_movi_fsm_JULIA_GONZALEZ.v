
`timescale 10ns/1ns
module tb_FSM_moviop;
   reg clk,rst,start,donefetch;
   reg [5:0] parameter1,parameter2;
   wire r0in,r1in,r2in,r3in,buffen;
   wire [15:0] bufftobus;
   wire Regiin,done;
    
    movi moore_movi(clk,rst,donefetch,start,done,Regiin,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,buffen,bufftobus);

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
