# JK Flip-Flop

## Files
- `JKFlipFlop_structural.v` — structural master-slave JK design.
- `JKFlipFlop_structural_tb.v` — structural-model testbench.
- `JKFlipFlop_behavioral.v` — behavioral JK design.
- `JKFlipFlop_behavioral_tb.v` — behavioral-model testbench.

## Inputs and Outputs
- `J`, `K` — JK control inputs.
- `Clk` — clock input.
- `Reset` — active-high reset; it sets `Q=0`.
- `Q`, `Qbar` — output and complement.

| J | K | Q on rising clock edge |
| --- | --- | --- |
| 0 | 0 | Hold |
| 0 | 1 | Reset to 0 |
| 1 | 0 | Set to 1 |
| 1 | 1 | Toggle |

The testbench verifies reset, set, hold, and two toggle operations. The reset
is needed so the structural feedback circuit starts from a known state.

## Run

```powershell
iverilog -o JKFlipFlop_structural_tb.out JKFlipFlop_structural.v JKFlipFlop_structural_tb.v
vvp .\JKFlipFlop_structural_tb.out
gtkwave .\JKFlipFlop_structural.vcd
```

```powershell
iverilog -o JKFlipFlop_behavioral_tb.out JKFlipFlop_behavioral.v JKFlipFlop_behavioral_tb.v
vvp .\JKFlipFlop_behavioral_tb.out
gtkwave .\JKFlipFlop_behavioral.vcd
```
