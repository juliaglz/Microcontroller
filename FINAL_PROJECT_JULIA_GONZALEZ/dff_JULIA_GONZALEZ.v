module Register (clk, d, ei, rst, q);  
  input clk, rst, ei; 
  input [15:0] d;  
  output [15:0] q;  
  reg [15:0] q;  
 
  always @(posedge clk or posedge rst or posedge ei)  
    begin  
      if (rst)  
        q <= 16'b0000000000000000;  
      else  
        if (ei)  
          q <= d;  
    end  
endmodule
  
  

  