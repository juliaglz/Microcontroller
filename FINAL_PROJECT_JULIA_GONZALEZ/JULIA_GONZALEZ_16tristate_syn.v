
module tristate_buffer ( T, I, O );
  input [15:0] I;
  output [15:0] O;
  input T;

  tri   [15:0] O;

  TNBUFFHX4 \O_tri[0]  ( .IN(I[0]), .ENB(T), .Q(O[0]) );
  TNBUFFHX4 \O_tri[1]  ( .IN(I[1]), .ENB(T), .Q(O[1]) );
  TNBUFFHX4 \O_tri[2]  ( .IN(I[2]), .ENB(T), .Q(O[2]) );
  TNBUFFHX4 \O_tri[3]  ( .IN(I[3]), .ENB(T), .Q(O[3]) );
  TNBUFFHX4 \O_tri[4]  ( .IN(I[4]), .ENB(T), .Q(O[4]) );
  TNBUFFHX4 \O_tri[5]  ( .IN(I[5]), .ENB(T), .Q(O[5]) );
  TNBUFFHX4 \O_tri[6]  ( .IN(I[6]), .ENB(T), .Q(O[6]) );
  TNBUFFHX4 \O_tri[7]  ( .IN(I[7]), .ENB(T), .Q(O[7]) );
  TNBUFFHX4 \O_tri[8]  ( .IN(I[8]), .ENB(T), .Q(O[8]) );
  TNBUFFHX4 \O_tri[9]  ( .IN(I[9]), .ENB(T), .Q(O[9]) );
  TNBUFFHX4 \O_tri[10]  ( .IN(I[10]), .ENB(T), .Q(O[10]) );
  TNBUFFHX4 \O_tri[11]  ( .IN(I[11]), .ENB(T), .Q(O[11]) );
  TNBUFFHX4 \O_tri[12]  ( .IN(I[12]), .ENB(T), .Q(O[12]) );
  TNBUFFHX4 \O_tri[13]  ( .IN(I[13]), .ENB(T), .Q(O[13]) );
  TNBUFFHX4 \O_tri[14]  ( .IN(I[14]), .ENB(T), .Q(O[14]) );
  TNBUFFHX4 \O_tri[15]  ( .IN(I[15]), .ENB(T), .Q(O[15]) );
endmodule

