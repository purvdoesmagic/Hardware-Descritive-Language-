# Gated SR Latch

## Files
- `GatedSRLatch.v` — NAND-gate latch design.
- `GatedSRLatch_tb.v` — set, hold, reset, and disabled-latch testbench.

## Inputs and Outputs
- `S` — set input.
- `R` — reset input.
- `Enable` — allows the latch to respond to inputs when `1`.
- `Q`, `Qbar` — stored output and its complement.

| Enable | S | R | Q action |
| --- | --- | --- | --- |
| 0 | X | X | Hold previous value |
| 1 | 0 | 0 | Hold previous value |
| 1 | 1 | 0 | Set `Q=1` |
| 1 | 0 | 1 | Reset `Q=0` |

`S=1` and `R=1` is invalid for an SR latch and is intentionally not tested.
At time zero, `Q` may appear as `x` until a set or reset input establishes a
known state.

## Run
```powershell
iverilog -o GatedSRLatch_tb.out GatedSRLatch.v GatedSRLatch_tb.v
vvp .\GatedSRLatch_tb.out
gtkwave .\GatedSRLatch.vcd
```
