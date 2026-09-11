module mux4to1_behavioral(I0, I1, I2, I3, S1, S0, Y);

input I0, I1, I2, I3, S1, S0;
output reg Y;

always @(I0 or I1 or I2 or I3 or S1 or S0)
begin
    if (S1 == 0 && S0 == 0)
        Y = I0;
    else if (S1 == 0 && S0 == 1)
        Y = I1;
    else if (S1 == 1 && S0 == 0)
        Y = I2;
    else
        Y = I3;
end

endmodule
