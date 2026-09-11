module parallel_adder_4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] Sum,
    output wire Cout
);
    wire carry1;
    wire carry2;
    wire carry3;

    full_adder FA0 (A[0], B[0], Cin,    Sum[0], carry1);
    full_adder FA1 (A[1], B[1], carry1, Sum[1], carry2);
    full_adder FA2 (A[2], B[2], carry2, Sum[2], carry3);
    full_adder FA3 (A[3], B[3], carry3, Sum[3], Cout);
endmodule
