`timescale 1ns/1ps

module mux2to1_bufif_tb;
    reg I0;
    reg I1;
    reg S;
    wire Y;

    mux2to1_bufif dut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin
        $dumpfile("Mux2to1Bufif.vcd");
        $dumpvars(0, mux2to1_bufif_tb);

        I0 = 0; I1 = 0; S = 0; #10;
        I0 = 0; I1 = 1; S = 0; #10;
        I0 = 1; I1 = 0; S = 0; #10;
        I0 = 1; I1 = 1; S = 0; #10;
        I0 = 0; I1 = 0; S = 1; #10;
        I0 = 0; I1 = 1; S = 1; #10;
        I0 = 1; I1 = 0; S = 1; #10;
        I0 = 1; I1 = 1; S = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t I0=%b I1=%b S=%b Y=%b", $time, I0, I1, S, Y);
    end
endmodule
