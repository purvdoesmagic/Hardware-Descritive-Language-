module gated_sr_latch(S, R, Enable, Q, Qbar);

input S, R, Enable;
output Q, Qbar;

wire S_bar, R_bar;

nand (S_bar, S, Enable);
nand (R_bar, R, Enable);
nand (Q, S_bar, Qbar);
nand (Qbar, R_bar, Q);

endmodule

module d_flip_flop_structural(D, Clk, Q, Qbar);

input D, Clk;
output Q, Qbar;

wire D_bar, Clk_bar, Q_master, Qbar_master;

not (D_bar, D);
not (Clk_bar, Clk);

gated_sr_latch Master (D, D_bar, Clk_bar, Q_master, Qbar_master);
gated_sr_latch Slave (Q_master, Qbar_master, Clk, Q, Qbar);

endmodule
