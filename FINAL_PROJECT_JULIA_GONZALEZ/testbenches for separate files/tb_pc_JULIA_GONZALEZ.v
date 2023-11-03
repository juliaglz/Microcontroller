`timescale 10ns/1ns
module tb_PC;
    reg pcsignal;
    reg rst;
    wire [15:0] pc;

    pc_counter programcounter(rst,pc,pcsignal);
    initial begin
      rst=0;
      pcsignal=0;
      #7 rst = 1;
             
      #7 rst = 0;
      #10 pcsignal=1;
      #10 pcsignal=0;
      #10 pcsignal=1;
      #10 pcsignal=0;
    end
endmodule
