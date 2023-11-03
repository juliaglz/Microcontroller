module fetch(clk,rst,done,MFC,PCOutEn,PCsignal,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,IRin,done_fetch);
input clk,rst,done,MFC;
output PCOutEn,PCsignal,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,IRin,done_fetch;
reg PCOutEn,PCsignal,MARin,EN,RW,MDR_tobusin,MDR_frombusin,MDROutEn,IRin,done_fetch;
parameter st0=4'b0000, st1=4'b0001, st2=4'b0010, st3=4'b0011, st4=4'b0100, st5=4'b0101,st6=4'b0111,st7=4'b1000;
reg[3:0] state_reg, state_next; 
 
always @(posedge(clk), posedge(rst),posedge(done)) 
  begin
    if (rst) 
      state_reg<=st0;
    else if (done)
      state_reg<=st0;
    else
      state_reg <= state_next;
  end

always @(MFC, state_reg)
  begin
  state_next<=state_reg;
  case(state_reg) 
     
    st0: begin
        if(!MFC)
          state_next<=st1; 
      else
          state_next<=st0;
    end    
    
    st1: begin
      if(!MFC) 
          state_next<=st2;
    else 
         state_next<=st1;

end

    st2: begin
      if(MFC) 
          state_next<=st3;
    else 
         state_next<=st2;
end

    st3: begin
      if(MFC) 
          state_next<=st4;
    else 
         state_next<=st3; 

end

    st4: begin
      if(!MFC) 
          state_next<=st5;
    else 
         state_next<=st4; 

end
st5: begin
      if(!MFC) 
          state_next<=st6;
    else 
         state_next<=st5; 

end
st6: begin
      if(!MFC) 
          state_next<=st7;
    else 
         state_next<=st6; 

end
st7: begin
      if(!MFC) 
          state_next<=st7;
    else 
         state_next<=st7; 

end


endcase
end


always @(state_reg) begin
  
        PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=0;
   
   case(state_reg)
     st0 : 
        begin
        PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=0;
     end
     st1 : 
        begin
        PCOutEn<=1;
        MARin<=1;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0; 
        done_fetch<=0;  
     end
     st2 : begin
        PCOutEn<=0;
        MARin<=0;
        EN<=1;  
        RW<=1;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=0;
     end
     st3 : begin
       PCOutEn<=0;
        MARin<=0;
        EN<=1;  
        RW<=1;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=0;
        
     end
     st4 :  begin
       PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=1;
        MDR_frombusin<=0;
        MDROutEn<=1;
        IRin<=1;
        PCsignal<=0;
        done_fetch<=0;
     end
     
     st5 :  begin
       PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=1;
        done_fetch<=0;
     end
     st6 :  begin
       PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=1;
     end
     st7 :  begin
       PCOutEn<=0;
        MARin<=0;
        EN<=0;  
        RW<=0;
        MDR_tobusin<=0;
        MDR_frombusin<=0;
        MDROutEn<=0;
        IRin<=0;
        PCsignal<=0;
        done_fetch<=0;
     end
endcase

end

endmodule
  