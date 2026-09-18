# D Flip-Flop

## Files
- `DFlipFlop_structural.v` — structural design using two gated SR latches.
- `DFlipFlop_structural_tb.v` — structural-model testbench.
- `DFlipFlop_behavioral.v` — behavioral design using `always @(posedge Clk)`.
- `DFlipFlop_behavioral_tb.v` — behavioral-model testbench.

## Function
At each rising edge of `Clk`, the flip-flop copies `D` to `Q`.

| Clock event | Q |
| --- | --- |
| Rising edge | `D` |
| No rising edge | Holds previous value |

`Qbar` is always the complement of `Q` after a clock edge. The structural
version uses a master latch active when the clock is low and a slave latch
active when the clock is high.

## Run

```powershell
iverilog -o DFlipFlop_structural_tb.out DFlipFlop_structural.v DFlipFlop_structural_tb.v
vvp .\DFlipFlop_structural_tb.out
gtkwave .\DFlipFlop_structural.vcd
```

```powershell
iverilog -o DFlipFlop_behavioral_tb.out DFlipFlop_behavioral.v DFlipFlop_behavioral_tb.v
vvp .\DFlipFlop_behavioral_tb.out
gtkwave .\DFlipFlop_behavioral.vcd
```
