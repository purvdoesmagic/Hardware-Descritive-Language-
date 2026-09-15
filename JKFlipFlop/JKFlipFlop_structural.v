module gated_sr_latch_reset(S, R, Enable, Reset, Q, Qbar);

input S, R, Enable, Reset;
output Q, Qbar;

wire S_bar, R_temp, R_bar, Reset_bar;

nand (S_bar, S, Enable);
nand (R_temp, R, Enable);
not (Reset_bar, Reset);
and (R_bar, R_temp, Reset_bar);
nand (Q, S_bar, Qbar);
nand (Qbar, R_bar, Q);

endmodule

module jk_flip_flop_structural(J, K, Clk, Reset, Q, Qbar);

input J, K, Clk, Reset;
output Q, Qbar;

wire Clk_bar, S_master, R_master, Q_master, Qbar_master;

not (Clk_bar, Clk);
and (S_master, J, Qbar);
and (R_master, K, Q);

gated_sr_latch_reset Master (S_master, R_master, Clk_bar, Reset, Q_master, Qbar_master);
gated_sr_latch_reset Slave (Q_master, Qbar_master, Clk, Reset, Q, Qbar);

endmodule
