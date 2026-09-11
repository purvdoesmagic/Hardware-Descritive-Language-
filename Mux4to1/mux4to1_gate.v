module mux4to1_gate(I0, I1, I2, I3, S1, S0, Y);

input I0, I1, I2, I3, S1, S0;
output Y;

wire S1_bar, S0_bar;
wire w0, w1, w2, w3;

not (S1_bar, S1);
not (S0_bar, S0);

and (w0, I0, S1_bar, S0_bar);
and (w1, I1, S1_bar, S0);
and (w2, I2, S1, S0_bar);
and (w3, I3, S1, S0);

or (Y, w0, w1, w2, w3);

endmodule
