module mux2to1_gate(I0, I1, S, Y);

input I0, I1, S;
output Y;

wire S_bar;
wire w0, w1;

not (S_bar, S);
and (w0, I0, S_bar);
and (w1, I1, S);
or (Y, w0, w1);

endmodule
