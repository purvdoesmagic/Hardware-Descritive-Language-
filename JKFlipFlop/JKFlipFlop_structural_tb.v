`timescale 1ns/1ps

module jk_flip_flop_structural_tb;

reg J, K, Clk, Reset;
wire Q, Qbar;

jk_flip_flop_structural DUT (J, K, Clk, Reset, Q, Qbar);

initial begin
    $dumpfile("JKFlipFlop_structural.vcd");
    $dumpvars(0, jk_flip_flop_structural_tb);

    J = 0; K = 0; Clk = 0; Reset = 1;
    #2 Reset = 0;
    #10 J = 1; K = 0;
    #10 J = 0; K = 0;
    #10 J = 1; K = 1;
    #10 J = 1; K = 1;
    #10 $finish;
end

always #5 Clk = ~Clk;

initial begin
    $monitor("Time=%0t J=%b K=%b Clk=%b Reset=%b Q=%b Qbar=%b", $time, J, K, Clk, Reset, Q, Qbar);
end

endmodule
