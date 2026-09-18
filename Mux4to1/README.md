# 4-to-1 Multiplexer

## Files
- `mux4to1_gate.v` and `mux4to1_gate_tb.v` — gate-level model and testbench.
- `mux4to1_dataflow.v` and `mux4to1_dataflow_tb.v` — dataflow model and testbench.
- `mux4to1_behavioral.v` and `mux4to1_behavioral_tb.v` — behavioral model and testbench.

## Function
Two select bits choose one of four inputs.

| S1 | S0 | Y |
| --- | --- | --- |
| 0 | 0 | `I0` |
| 0 | 1 | `I1` |
| 1 | 0 | `I2` |
| 1 | 1 | `I3` |

## Modeling Styles
- The gate model uses `not`, `and`, and `or` primitives.
- The dataflow model uses the conditional `?:` operator.
- The behavioral model uses `if-else` statements.

## Run a Model
Replace `dataflow` with `gate` or `behavioral` to run another style.

```powershell
iverilog -o mux4to1_dataflow_tb.out mux4to1_dataflow.v mux4to1_dataflow_tb.v
vvp .\mux4to1_dataflow_tb.out
gtkwave .\mux4to1_dataflow.vcd
```
