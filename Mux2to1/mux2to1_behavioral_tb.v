`timescale 1ns/1ps

module tb_mux2to1_behavioral;

reg I0;
reg I1;
reg S;
wire Y;

mux2to1_behavioral DUT (I0, I1, S, Y);

initial begin
    $dumpfile("mux2to1_behavioral.vcd");
    $dumpvars(0, tb_mux2to1_behavioral);

    $monitor("Time=%0t | I0=%b I1=%b S=%b | Y=%b", $time, I0, I1, S, Y);

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

endmodule
