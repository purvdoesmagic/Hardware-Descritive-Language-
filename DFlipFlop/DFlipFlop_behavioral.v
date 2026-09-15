module d_flip_flop_behavioral(D, Clk, Q, Qbar);

input D, Clk;
output reg Q;
output reg Qbar;

always @(posedge Clk)
begin
    Q = D;
    Qbar = ~D;
end

endmodule
