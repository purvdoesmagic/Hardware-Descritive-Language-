`timescale 1ns/1ps

module full_subtractor_tb;
    reg A;
    reg B;
    reg Bin;
    wire Diff;
    wire Bout;

    full_subtractor dut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    initial begin
        $dumpfile("FullSubtractor.vcd");
        $dumpvars(0, full_subtractor_tb);

        A = 0; B = 0; Bin = 0; #10;
        A = 0; B = 0; Bin = 1; #10;
        A = 0; B = 1; Bin = 0; #10;
        A = 0; B = 1; Bin = 1; #10;
        A = 1; B = 0; Bin = 0; #10;
        A = 1; B = 0; Bin = 1; #10;
        A = 1; B = 1; Bin = 0; #10;
        A = 1; B = 1; Bin = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b B=%b Bin=%b Diff=%b Bout=%b", $time, A, B, Bin, Diff, Bout);
    end
endmodule
