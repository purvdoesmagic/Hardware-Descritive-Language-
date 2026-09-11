`timescale 1ns/1ps

module half_adder_tb;
    reg A;
    reg B;
    wire Sum;
    wire Carry;

    half_adder dut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );

    initial begin
        $dumpfile("HalfAdder.vcd");
        $dumpvars(0, half_adder_tb);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b B=%b Sum=%b Carry=%b", $time, A, B, Sum, Carry);
    end
endmodule
