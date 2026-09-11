`timescale 1ns/1ps

module adder_subtractor_4bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg M;
    wire [3:0] Result;
    wire Cout;

    adder_subtractor_4bit dut (
        .A(A),
        .B(B),
        .M(M),
        .Result(Result),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("AdderSubtractor4bit.vcd");
        $dumpvars(0, adder_subtractor_4bit_tb);

        M = 0; A = 4'b0011; B = 4'b0101; #10;
        M = 0; A = 4'b1111; B = 4'b0001; #10;
        M = 1; A = 4'b1001; B = 4'b0011; #10;
        M = 1; A = 4'b0011; B = 4'b0101; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t M=%b A=%b B=%b Result=%b Cout=%b", $time, M, A, B, Result, Cout);
    end
endmodule
