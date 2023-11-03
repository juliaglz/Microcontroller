module store(clk,rst,donefetch,start,parameter1, parameter2,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,Regiout,Regjout,MARin,MDR_frombusin,EN,RW,done);
input clk,rst,start,donefetch;
input [5:0] parameter1, parameter2;
output R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,Regiout,Regjout,MARin,MDR_frombusin,EN,RW,done;
reg R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,Regiout,Regjout,MARin,MDR_frombusin,EN,RW,done;
parameter st0=3'b000, st1=3'b001, st2=3'b010, st3=3'b011,st4=3'b100,st5=3'b101,st6=3'b111;
reg[2:0] state_reg, state_next; 

always @(rst,posedge(Regjout))
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
always @(Regiout)
begin
  case(parameter1)
      6'b000000: begin
        R0OutEn<=Regiout;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=0; 
      end
      6'b000001: begin
        R0OutEn<=0;
        R1OutEn<=Regiout;
        R2OutEn<=0;
        R3OutEn<=0;  
        P0OutEn<=0; 
      end
      6'b000010: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=Regiout;
        R3OutEn<=0; 
        P0OutEn<=0;
      end
      6'b000011: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=Regiout; 
        P0OutEn<=0; 
      end
      6'b000100: begin
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0; 
        P0OutEn<=Regiout; 
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
          state_next<=st5;
    else 
         state_next<=st4; 

end
    st5: begin
      if(start) 
          state_next<=st6;
    else 
         state_next<=st5; 

end
st6: begin
      if(start) 
          state_next<=st6;
    else 
         state_next<=st6; 

end


endcase
end


always @(state_reg) begin
  
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=0;
  
   
   case(state_reg)
     st0 : 
        begin
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=0;
      end
     st1 : 
        begin
        Regiout<=0;
        Regjout<=1;
        MARin<=1;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=0;
     end
     st2 : 
        begin
       
        Regiout<=1;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=1;
        EN<=1;
        RW<=0;
        done<=0;
     end
     st3 : begin
        
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=1;
        RW<=0;
        done<=0;
     end
     st4 : begin
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=0;
        
     end
     st5 : begin
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=1;
        
     end
     st6 : begin
        Regiout<=0;
        Regjout<=0;
        MARin<=0;
        MDR_frombusin<=0;
        EN<=0;
        RW<=0;
        done<=0;
        
     end
     
endcase

end

endmodule
  


