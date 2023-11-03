module mov(clk,rst,donefetch,start,done,Regjout,Regiin,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn);
input clk,rst,start,donefetch;
input [5:0] parameter1, parameter2;  
output r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn;
reg r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn;
output Regjout,Regiin,done;
reg Regjout,Regiin,done;
parameter st0=3'b000, st1=3'b001, st2=3'b010,st3=3'b011,st4=3'b100;
reg[2:0] state_reg, state_next; 

always @(clk,Regjout)
begin
  case(parameter2)
      6'b000000: begin
        R0OutEn<=Regjout;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=0; 
      end
      6'b000001: begin
        R0OutEn<=0;
        R1OutEn<=Regjout;
        R2OutEn<=0;
        R3OutEn<=0;  
        P0OutEn<=0; 
      end
      6'b000010: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=Regjout;
        R3OutEn<=0; 
        P0OutEn<=0;
      end
      6'b000011: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=Regjout; 
        P0OutEn<=0; 
      end
      6'b000100: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0; 
        P0OutEn<=Regjout; 
      end
    endcase 
end 
always @(clk,Regiin)
begin
  case(parameter1)
      6'b000000: begin
        r0in<=Regiin;
        r1in<=0;
        r2in<=0;
        r3in<=0;
        P0in<=0;
      end
      6'b000001: begin
        r0in<=0;
        r1in<=Regiin;
        r2in<=0;
        r3in<=0; 
        P0in<=0;
      end 
      6'b000010: begin
        r0in<=0;
        r1in<=0;
        r2in<=Regiin;
        r3in<=0;
        P0in<=0;
      end
      6'b000011: begin
        r0in<=0;
        r1in<=0;
        r2in<=0;
        r3in<=Regiin;
        P0in<=0;
      end  
      6'b000100: begin
        r0in<=0;
        r1in<=0;
        r2in<=0;
        r3in<=0;
        P0in<=Regiin;
      end    
   endcase 
end 
always @(posedge(clk), posedge(rst),posedge(donefetch)) 
  begin     
    if (rst) 
    state_reg<=st0;
  else if (donefetch)
    state_reg<=st0;
    else
      state_reg <= state_next;
  end

always @(start, state_reg)
  begin
  state_next<=state_reg;
  case(state_reg) 
     
    st0: begin
        if(start)
          state_next<=st1; 
      else
          state_next<=st0;
    end    
    
    st1: begin
      if(start) 
          state_next<=st2;
    else 
         state_next<=st1;

end
    st2: begin
      if(start) 
          state_next<=st3;
    else 
         state_next<=st2;

end
    st3: begin
      if(start) 
          state_next<=st4;
    else 
         state_next<=st3;

end
st4: begin
      if(start) 
          state_next<=st4;
    else 
         state_next<=st4;

end


endcase
end


always @(state_reg) begin
  
        Regjout<=0;
        Regiin<=0;
        done<=0;
  
   case(state_reg)
     st0 : 
        begin
        
        Regjout<=0;
        Regiin<=0;
        done<=0;
  
     end
     st1 : 
        begin
        
        Regjout<=1;
        Regiin<=1;
        done<=0;
  
     end
    
     st2 : 
        begin
       
        Regjout<=0;
        Regiin<=0;
        done<=0;
  
     end
     st3 : 
        begin
        
        Regjout<=0;
        Regiin<=0;
        done<=1;
  
     end
     st4 : 
        begin
        
        Regjout<=0;
        Regiin<=0;
        done<=0;
  
     end
    
     
endcase

end

endmodule
  



