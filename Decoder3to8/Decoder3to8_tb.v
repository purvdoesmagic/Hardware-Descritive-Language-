`timescale 1ns/1ps

module decoder3to8_tb;
    reg [2:0] A;
    wire [7:0] Y;

    decoder3to8 dut (
        .A(A),
        .Y(Y)
    );

    initial begin
        $dumpfile("Decoder3to8.vcd");
        $dumpvars(0, decoder3to8_tb);

        A = 3'b000; #10;
        A = 3'b001; #10;
        A = 3'b010; #10;
        A = 3'b011; #10;
        A = 3'b100; #10;
        A = 3'b101; #10;
        A = 3'b110; #10;
        A = 3'b111; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b Y=%b", $time, A, Y);
    end
endmodule
