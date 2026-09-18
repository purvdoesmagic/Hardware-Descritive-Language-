`timescale 1ns/1ps

module alu8bit_tb;

reg [7:0] A, B;
reg [2:0] Sel;
wire [7:0] Result;

alu8bit DUT (A, B, Sel, Result);

initial begin
    $dumpfile("ALU8bit.vcd");
    $dumpvars(0, alu8bit_tb);

    A = 8'h14; B = 8'h0F; Sel = 3'b000; #10;
    Sel = 3'b001; #10;
    Sel = 3'b010; #10;
    Sel = 3'b011; #10;
    Sel = 3'b100; #10;
    Sel = 3'b101; #10;
    Sel = 3'b110; #10;
    Sel = 3'b111; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t A=%h B=%h Sel=%b Result=%h", $time, A, B, Sel, Result);
end

endmodule
