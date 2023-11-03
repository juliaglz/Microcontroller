`timescale 10ns/1ns
module tb_pf_v1;

reg clk, rst,r0in, r1in,r2en,aluOutEn;
reg [2:0] ALU_Sel;
wire [15:0] bus, r0toalu, r1toalu,r2tobuff_alu,resulttoreg;

toplevel_ALU circ(clk,rst,r0en,r1en,r0toalu,r1toalu,ALU_Sel,resulttoreg,r2en,r2tobuff_alu,bus,aluOutEn);
 
  
initial begin 
  
             clk=0;
             r0in=0;
             r1in=0;
             r2en=0;
             ALU_Sel=3'b000;
             aluOutEn=0;
             rst=0;
             
             #7 rst = 1;
             #7 rst = 0;
             
             repeat(7)
              begin
          

             #20 
                 r1in = 1;
             #20 
                 r1in = 0;
                 r0in = 0;    
             #20 
                 r1in = 0;
                 r0in = 1;
             #20 
                 r0in = 0;
             #20 r2en=1;       
             #20
                 aluOutEn=1;
             #20  
             aluOutEn=0; 
                ALU_Sel=ALU_Sel+1;
                
                end    
           end
         
    always #5 clk=~clk;



endmodule