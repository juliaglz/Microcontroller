module pc_counter (rst,pc,pcsignal);
    input pcsignal, rst;
    output [15:0] pc;
    reg [15:0] pc;
    
always @ (posedge(pcsignal), posedge(rst))
begin
    if (rst)
      pc<=16'b0000000000000000;
    else
      pc<=pc+1;  
end
endmodule
