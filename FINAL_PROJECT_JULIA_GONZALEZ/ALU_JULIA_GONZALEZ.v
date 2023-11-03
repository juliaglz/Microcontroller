module alu(A, B, ALU_Sel, ALU_Result);
    input [15:0] A,B;  // ALU 16-bit Inputs                 
    input [2:0] ALU_Sel;// ALU Selection
    output [15:0] ALU_Result; // ALU 16-bit Output
    reg [15:0] ALU_Result;
    always @(A, B, ALU_Sel, ALU_Result)
    begin
        case(ALU_Sel)
        3'b000: // Addition
           ALU_Result = A + B ; 
        3'b001: // Subtraction
           ALU_Result = A - B ;
        3'b010: //nottttttttttttt
           ALU_Result = ~A;
        3'b011: //  Logical and 
           ALU_Result = A & B;
        3'b100: //  Logical or
           ALU_Result = A | B;
        3'b101: //  Logical xor 
           ALU_Result = A ^ B;
        3'b110: // Logical xnor
           ALU_Result = ~(A ^ B);
          default: ALU_Result = 16'b0000000000000000; 
        endcase
    end

endmodule
