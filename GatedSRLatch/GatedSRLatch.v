module gated_sr_latch(S, R, Enable, Q, Qbar);

input S, R, Enable;
output Q, Qbar;

wire S_bar, R_bar;

nand (S_bar, S, Enable);
nand (R_bar, R, Enable);
nand (Q, S_bar, Qbar);
nand (Qbar, R_bar, Q);

endmodule
