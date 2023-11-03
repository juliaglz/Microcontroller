`timescale 10ns/1ns
module mainmemory(Dataout, MFC, EN, addr, datain, RW);

input EN, RW;
input[15:0] addr, datain;
output [15:0] Dataout;
output MFC;
reg [15:0] Dataout, memorycell;
reg MFC;
always@(posedge EN)

begin 

if(RW==1) begin 
  case(addr)
16'b0000000000000000: Dataout = 16'b1011000010001100;//MOVI  R2, #C 

16'b0000000000000001: Dataout = 16'b0100000010000101;//SUBI  R2, #5

16'b0000000000000010: Dataout = 16'b1011000100111010;//MOVI  P0, #3A

16'b0000000000000011: Dataout = 16'b0111000010000100;//AND  R2, P0 

16'b0000000000000100: Dataout = 16'b1001000100000010;//XOR  P0, R2

16'b0000000000000101: Dataout = 16'b0101000000000010;//NOT  R2 

16'b0000000000000110: Dataout = 16'b1101000100000010;//STORE  P0, (R2) 

16'b0000000000000111: Dataout = 16'b1100000010000011;//LOAD  (R2), R3

default: Dataout = memorycell;

endcase

end

else memorycell = datain;

#5 MFC = 1;

end

always@(negedge (EN))
MFC = 0;
endmodule
