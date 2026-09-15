module jk_flip_flop_behavioral(J, K, Clk, Reset, Q, Qbar);

input J, K, Clk, Reset;
output reg Q;
output reg Qbar;

always @(posedge Clk or posedge Reset)
begin
    if (Reset == 1)
        Q = 0;
    else if (J == 0 && K == 0)
        Q = Q;
    else if (J == 0 && K == 1)
        Q = 0;
    else if (J == 1 && K == 0)
        Q = 1;
    else
        Q = ~Q;

    Qbar = ~Q;
end

endmodule
