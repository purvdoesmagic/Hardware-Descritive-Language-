`timescale 1ns/1ps

module gated_sr_latch_tb;

reg S, R, Enable;
wire Q, Qbar;

gated_sr_latch DUT (S, R, Enable, Q, Qbar);

initial begin
    $dumpfile("GatedSRLatch.vcd");
    $dumpvars(0, gated_sr_latch_tb);

    $monitor("Time=%0t | S=%b R=%b Enable=%b | Q=%b Qbar=%b", $time, S, R, Enable, Q, Qbar);

    S = 0; R = 0; Enable = 0; #10;
    S = 1; R = 0; Enable = 1; #10;
    S = 0; R = 0; Enable = 1; #10;
    S = 0; R = 1; Enable = 1; #10;
    S = 0; R = 0; Enable = 1; #10;
    S = 1; R = 0; Enable = 0; #10;

    $finish;
end

endmodule
