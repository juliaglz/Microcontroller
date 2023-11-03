`timescale 10ns/1ns
module tb_toplevel;
  reg clk, rst;
  reg [15:0] datatb;
  reg P1in,P1OutEn;
  wire [15:0] p0tobuff;
  
  
toplevelv5 juju (clk,rst,datatb,P1in,P1OutEn,p0tobuff);
initial begin 
  
             clk=0;
             rst=0;
             datatb=16'b0;
             P1in=0;
             P1OutEn=0;
             #7 rst = 1;
             #7 rst=0;
           end
         
    always #5 clk=~clk;



endmodule