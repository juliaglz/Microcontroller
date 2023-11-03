module decoder(IRin,start1,start2,start3,start4,start5,start6,start7,instruction,parameter1,parameter2,ALU_Sel);
  input IRin;
  input [15:0] instruction;
  output start1,start2,start3,start4,start5,start6,start7;
  reg start1,start2,start3,start4,start5,start6,start7;
  output [5:0] parameter1,parameter2;
  reg [5:0] parameter1,parameter2;
  output [2:0] ALU_Sel;
  reg [2:0] ALU_Sel;
  
  
always @(negedge (IRin)) begin
 case(instruction[15:12])
   4'b0000: 
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
    end
    4'b0001: //add ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b000;//addition
    end
    4'b0010: //addi ri #
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=1;//ALU inmediate operation fsm activated
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b000;//addition
    end
    4'b0011: //sub ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b001;//subtraction
    end
    4'b0100: //subi ri #
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      ALU_Sel<=3'b001;//subtraction
      start1<=0; 
      start2<=0;
      start3<=1;//ALU inmediate operation fsm activated
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
    end
    4'b0101: //not ri
    begin
      parameter1<=instruction[5:0];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b010;//not
    end
    4'b0111: //and ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b011; //Logical and
    end
    4'b1000: //or ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b100; //logical or
    end
    4'b1001: //xor ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
      ALU_Sel<=3'b101; //logical xor
    end
    4'b1010: //xnor ri
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=1;//ALU operation fsm activated
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      ALU_Sel<=3'b110; //logical xnor
    end
    4'b1011: //movi ri #
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=1;//movi fsm activated
      start5<=0;
      start6<=0;
      start7<=0;
    end
    4'b1100: //load ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=0;
      start5<=1;//load fsm activated
      start6<=0;
      start7<=0;
    end
    4'b1101: //store ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=1;//store fsm activated
      start7<=0;
    end
    4'b1111: //mov ri rj
    begin
      parameter1<=instruction[11:6];
      parameter2<=instruction[5:0];
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=1; //mov fsm actiated
    end
    default:
    begin
      parameter1<=0;
      parameter2<=0;
      start1<=0; 
      start2<=0;
      start3<=0;
      start4<=0;
      start5<=0;
      start6<=0;
      start7<=0;
    end
  endcase
end
endmodule