`timescale 1ns/1ps

module master_slave_flip_flop_tb;

reg J, K, Clk, Reset;
wire Q, Qbar;

master_slave_flip_flop DUT (J, K, Clk, Reset, Q, Qbar);

initial begin
    $dumpfile("MasterSlaveFlipFlop.vcd");
    $dumpvars(0, master_slave_flip_flop_tb);

    J = 0; K = 0; Clk = 0; Reset = 1;
    #2 Reset = 0;
    #10 J = 1; K = 0;
    #5 J = 0; K = 1;
    #10 J = 1; K = 1;
    #10 J = 0; K = 0;
    #10 $finish;
end

always #5 Clk = ~Clk;

initial begin
    $monitor("Time=%0t J=%b K=%b Clk=%b Reset=%b Q=%b Qbar=%b", $time, J, K, Clk, Reset, Q, Qbar);
end

endmodule
