`timescale 10ns/1ns
module tb_Fdecoder;
    reg IRin;
    reg [15:0] instruction;
    wire start1,start2,start3,start4,start5,start6;
    wire [5:0] parameter1,parameter2;
    wire [2:0] ALU_Sel;
    
    decoder tbdecoder(IRin,start1,start2,start3,start4,start5,start6,start7,instruction,parameter1,parameter2,ALU_Sel);
initial begin 
             IRin=0;
             #7 IRin = 1;
             #7 IRin=0;  
             #20 instruction = 16'b0001000000000010;
             #7 IRin = 1;
             #7 IRin=0;
             #20 instruction = 16'b0101001000111111;
             #7 IRin = 1;
             #7 IRin=0;
             #20 instruction = 16'b0011000000000101;
           end
    
  
endmodule

