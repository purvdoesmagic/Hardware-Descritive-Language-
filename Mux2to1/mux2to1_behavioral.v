module mux2to1_behavioral(I0, I1, S, Y);

input I0, I1, S;
output reg Y;

always @(I0 or I1 or S)
begin
    if (S == 0)
        Y = I0;
    else
        Y = I1;
end

endmodule
