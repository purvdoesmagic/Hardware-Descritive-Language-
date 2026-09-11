module mux4to1_dataflow(I0, I1, I2, I3, S1, S0, Y);

input I0, I1, I2, I3, S1, S0;
output Y;

assign Y = (~S1 & ~S0 & I0) | (~S1 & S0 & I1) |
           (S1 & ~S0 & I2) | (S1 & S0 & I3);

endmodule
