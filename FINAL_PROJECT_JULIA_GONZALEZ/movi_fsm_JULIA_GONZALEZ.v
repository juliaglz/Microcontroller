module movi(clk,rst,donefetch,start,done,Regiin,parameter1,parameter2,r0in,r1in,r2in,r3in,P0in,buffen,bufftobus);
input clk,rst,start,donefetch;
input [5:0] parameter1,parameter2;
output r0in,r1in,r2in,r3in,P0in,buffen;
output [15:0] bufftobus;
reg [15:0] bufftobus;
reg r0in,r1in,r2in,r3in,P0in,buffen;
output Regiin,done;
//wire zeros [9:0];
reg Regiin,done;
parameter st0=3'b000, st1=3'b001, st2=3'b010, st3=3'b011,st4=3'b100,st5=3'b101;
reg[2:0] state_reg, state_next; 
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
          state_next<=st5;
    else 
         state_next<=st4;

end
st5: begin
      if(start) 
          state_next<=st5;
    else 
         state_next<=st5;

end



endcase
end


always @(state_reg) begin
        //zeros <= 10'b0000000000;
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=0;
        
   case(state_reg)
     st0 : 
        begin
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=0;
     end
     st1 : 
        begin
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=0;
  
     end
     st2 : 
        begin
        buffen<=1;
        bufftobus<=parameter2;
        Regiin<=1;
        done<=0;
  
     end
     st3 : 
        begin
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=0;
  
     end
     st4 : 
        begin
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=1;
  
     end
    st5 : 
        begin
        buffen<=0;
        bufftobus<=16'bz;
        Regiin<=0;
        done<=0;
  
     end
     
endcase

end
endmodule
