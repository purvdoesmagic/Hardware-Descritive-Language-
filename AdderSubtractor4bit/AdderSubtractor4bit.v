module adder_subtractor_4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire M,
    output wire [3:0] Result,
    output wire Cout
);
    wire [3:0] B_modified;
    wire carry1;
    wire carry2;
    wire carry3;

    assign B_modified = B ^ {4{M}};

    full_adder FA0 (A[0], B_modified[0], M,      Result[0], carry1);
    full_adder FA1 (A[1], B_modified[1], carry1, Result[1], carry2);
    full_adder FA2 (A[2], B_modified[2], carry2, Result[2], carry3);
    full_adder FA3 (A[3], B_modified[3], carry3, Result[3], Cout);
endmodule
