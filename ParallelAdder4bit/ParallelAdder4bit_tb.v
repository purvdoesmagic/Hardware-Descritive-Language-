`timescale 1ns/1ps

module parallel_adder_4bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    parallel_adder_4bit dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("ParallelAdder4bit.vcd");
        $dumpvars(0, parallel_adder_4bit_tb);

        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 0; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        A = 4'b1010; B = 4'b0101; Cin = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);
    end
endmodule
