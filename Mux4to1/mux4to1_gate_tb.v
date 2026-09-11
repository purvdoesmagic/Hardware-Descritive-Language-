`timescale 1ns/1ps

module tb_mux4to1_gate;

reg I0, I1, I2, I3, S1, S0;
wire Y;

mux4to1_gate DUT (I0, I1, I2, I3, S1, S0, Y);

initial begin
    $dumpfile("mux4to1_gate.vcd");
    $dumpvars(0, tb_mux4to1_gate);

    $monitor("Time=%0t | S1=%b S0=%b | Y=%b", $time, S1, S0, Y);

    I0 = 0; I1 = 1; I2 = 0; I3 = 1; S1 = 0; S0 = 0; #10;
    I0 = 0; I1 = 1; I2 = 0; I3 = 1; S1 = 0; S0 = 1; #10;
    I0 = 0; I1 = 1; I2 = 0; I3 = 1; S1 = 1; S0 = 0; #10;
    I0 = 0; I1 = 1; I2 = 0; I3 = 1; S1 = 1; S0 = 1; #10;

    $finish;
end

endmodule
