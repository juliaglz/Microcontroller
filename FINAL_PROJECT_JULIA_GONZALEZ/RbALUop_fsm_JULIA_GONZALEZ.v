
module ALUoperations(clk,rst,donefetch,start,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,ALUinR1,ALUinR2,enregalu,ALUoutEn,Regiout,Regjout,Regiin,done);
input clk,rst,start,donefetch;
input [5:0] parameter1, parameter2;
output r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,ALUinR1,ALUinR2,enregalu,ALUoutEn,Regiout,Regjout,Regiin,done;
reg r0in,r1in,r2in,r3in,P0in,R0OutEn,R1OutEn,R2OutEn,R3OutEn,P0OutEn,ALUinR1,ALUinR2,enregalu,ALUoutEn,Regiout,Regjout,Regiin,done;
parameter st0=4'b0000, st1=4'b0001, st2=4'b0010, st3=4'b0011, st4=4'b0100, st5=4'b0101,st6=4'b0111, st7=4'b1000, st8=4'b1001;
reg[3:0] state_reg, state_next; 

always @(Regjout) 
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
always @(rst,Regiin,Regiout)  
begin
    case(parameter1)
      6'b000000: begin
        r0in<=Regiin;
        r1in<=0;
        r2in<=0;
        r3in<=0;
        P0in<=0;
        R0OutEn<=Regiout;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=0;
      end
      6'b000001: begin
        r0in<=0;
        r1in<=Regiin;
        r2in<=0;
        r3in<=0;
        P0in<=0;
        R0OutEn<=0;
        R1OutEn<=Regiout;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=0;
      end 
      6'b000010: begin
        r0in<=0;
        r1in<=0;
        r2in<=Regiin;
        r3in<=0;
        P0in<=0;
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=Regiout;
        R3OutEn<=0;
        P0OutEn<=0;
      end
      6'b000011: begin
        r0in<=0;
        r1in<=0;
        r2in<=0;
        r3in<=Regiin;
        P0in<=0; 
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=Regiout;
        P0OutEn<=0;
      end   
      6'b000100: begin
        r0in<=0;
        r1in<=0;
        r2in<=0;
        r3in<=0;
        P0in<=Regiin;
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=Regiout;
      end  
      default:
        begin
        r0in<=0;
        r1in<=0;
        r2in<=0;
        r3in<=0;
        P0in<=0;
        R0OutEn<=0;
        R1OutEn<=0;
        R2OutEn<=0;
        R3OutEn<=0;
        P0OutEn<=0;
      end
   endcase 
 end

 
always @(posedge(clk), posedge(rst), posedge(donefetch) )
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
          state_next<=st7;
    else 
         state_next<=st6; 

end
st7: begin
      if(start) 
          state_next<=st8;
    else 
         state_next<=st7; 

end
st8: begin
      if(start) 
          state_next<=st8;
    else 
         state_next<=st8; 

end


endcase
end


always @(state_reg) begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
       
   
   case(state_reg)
     st0 : 
        begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
     end
     st1 : 
        begin
        enregalu<=0;  
        ALUinR1<=1;
        ALUinR2<=0;
        Regiout<=1;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
     end
     st2 : 
        begin
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0; 
     end
     st3 : begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=1;
        Regiout<=0;
        Regjout<=1;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
     end
     st4 : begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
        
     end
     st5 :  begin
        enregalu<=1;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
     end
     st6 :  begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=1;
        Regiin<=1;
        done<=0;
     end
     st7 : 
        begin
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=1;
     end
     st8 : 
        begin
        enregalu<=0;
        ALUinR1<=0;
        ALUinR2<=0;
        Regiout<=0;
        Regjout<=0;
        ALUoutEn<=0;
        Regiin<=0;
        done<=0;
     end
endcase

end

endmodule
  
