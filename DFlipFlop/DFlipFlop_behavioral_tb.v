`timescale 1ns/1ps

module d_flip_flop_behavioral_tb;

reg D, Clk;
wire Q, Qbar;

d_flip_flop_behavioral DUT (D, Clk, Q, Qbar);

initial begin
    $dumpfile("DFlipFlop_behavioral.vcd");
    $dumpvars(0, d_flip_flop_behavioral_tb);

    D = 0; Clk = 0;
    #12 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 $finish;
end

always #5 Clk = ~Clk;

initial begin
    $monitor("Time=%0t D=%b Clk=%b Q=%b Qbar=%b", $time, D, Clk, Q, Qbar);
end

endmodule
