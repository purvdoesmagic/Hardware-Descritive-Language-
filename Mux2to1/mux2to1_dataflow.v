module mux2to1_dataflow(I0, I1, S, Y);

input I0, I1, S;
output Y;

assign Y = (I0 & ~S) | (I1 & S);

endmodule
