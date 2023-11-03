module tristate_buffer(T, I, O);
  input T;
  input [15:0] I; 
  output [15:0] O; 
  reg [15:0] O; 
 
  always @(T or I) 
    begin 
      if (T) 
        O <= I; 
      else 
        O <= 16'bzzzzzzzzzzzzzzzz; 
    end 
endmodule 

