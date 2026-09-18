`timescale 1ns/1ps

module encoder8to3_tb;

reg [7:0] I;
wire [2:0] Y;

encoder8to3 DUT (I, Y);

initial begin
    $dumpfile("Encoder8to3.vcd");
    $dumpvars(0, encoder8to3_tb);

    I = 8'b00000001; #10;
    I = 8'b00000010; #10;
    I = 8'b00000100; #10;
    I = 8'b00001000; #10;
    I = 8'b00010000; #10;
    I = 8'b00100000; #10;
    I = 8'b01000000; #10;
    I = 8'b10000000; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t I=%b Y=%b", $time, I, Y);
end

endmodule
