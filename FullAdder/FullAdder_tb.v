`timescale 1ns/1ps

module full_adder_tb;
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

    full_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("FullAdder.vcd");
        $dumpvars(0, full_adder_tb);

        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);
    end
endmodule
