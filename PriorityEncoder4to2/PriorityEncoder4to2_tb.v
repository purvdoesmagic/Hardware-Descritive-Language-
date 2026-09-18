`timescale 1ns/1ps

module priority_encoder4to2_tb;

reg [3:0] I;
wire [1:0] Y;
wire Valid;

priority_encoder4to2 DUT (I, Y, Valid);

initial begin
    $dumpfile("PriorityEncoder4to2.vcd");
    $dumpvars(0, priority_encoder4to2_tb);

    I = 4'b0000; #10;
    I = 4'b0001; #10;
    I = 4'b0010; #10;
    I = 4'b0100; #10;
    I = 4'b1000; #10;
    I = 4'b0011; #10;
    I = 4'b0110; #10;
    I = 4'b1101; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t I=%b Y=%b Valid=%b", $time, I, Y, Valid);
end

endmodule
