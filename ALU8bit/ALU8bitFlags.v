module alu8bit_flags(A, B, Sel, Result, CarryBorrow, Zero, Sign, Parity, AuxCarry, Overflow);

input [7:0] A, B;
input [2:0] Sel;
output reg [7:0] Result;
output reg CarryBorrow, Zero, Sign, Parity, AuxCarry, Overflow;

reg [8:0] Temp;
reg [4:0] LowerTemp;

always @(*)
begin
    Result = 8'b00000000;
    CarryBorrow = 0;
    AuxCarry = 0;
    Overflow = 0;
    Temp = 9'b000000000;
    LowerTemp = 5'b00000;

    case (Sel)
        3'b000: begin
            Temp = A + B;
            LowerTemp = A[3:0] + B[3:0];
            Result = Temp[7:0];
            CarryBorrow = Temp[8];
            AuxCarry = LowerTemp[4];
            Overflow = (A[7] == B[7]) && (Result[7] != A[7]);
        end
        3'b001: begin
            Result = A - B;
            CarryBorrow = (A < B);
            AuxCarry = (A[3:0] < B[3:0]);
            Overflow = (A[7] != B[7]) && (Result[7] != A[7]);
        end
        3'b010: Result = A & B;
        3'b011: Result = A | B;
        3'b100: Result = A ^ B;
        3'b101: Result = ~A;
        3'b110: begin
            Result = A << 1;
            CarryBorrow = A[7];
        end
        3'b111: begin
            Result = A >> 1;
            CarryBorrow = A[0];
        end
    endcase

    Zero = (Result == 0);
    Sign = Result[7];
    Parity = ~^Result;
end

endmodule
