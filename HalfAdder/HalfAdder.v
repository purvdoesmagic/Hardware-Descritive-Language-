module half_adder (
    input wire A,
    input wire B,
    output wire Sum,
    output wire Carry
);
    assign Sum = A ^ B;      // Sum is the XOR of A and B
    assign Carry = A & B;    // Carry is the AND of A and B
endmodule