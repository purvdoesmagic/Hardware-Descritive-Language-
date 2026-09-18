`timescale 1ns/1ps

module alu8bit_flags_tb;

reg [7:0] A, B;
reg [2:0] Sel;
wire [7:0] Result;
wire CarryBorrow, Zero, Sign, Parity, AuxCarry, Overflow;

alu8bit_flags DUT (A, B, Sel, Result, CarryBorrow, Zero, Sign, Parity, AuxCarry, Overflow);

initial begin
    $dumpfile("ALU8bitFlags.vcd");
    $dumpvars(0, alu8bit_flags_tb);

    A = 8'h14; B = 8'h0F; Sel = 3'b000; #10;
    Sel = 3'b001; #10;
    Sel = 3'b010; #10;
    Sel = 3'b011; #10;
    Sel = 3'b100; #10;
    Sel = 3'b101; #10;
    Sel = 3'b110; #10;
    Sel = 3'b111; #10;

    A = 8'h7F; B = 8'h01; Sel = 3'b000; #10;
    A = 8'h00; B = 8'h01; Sel = 3'b001; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t A=%h B=%h Sel=%b Result=%h C/B=%b Z=%b S=%b P=%b AC=%b V=%b",
             $time, A, B, Sel, Result, CarryBorrow, Zero, Sign, Parity, AuxCarry, Overflow);
end

endmodule
