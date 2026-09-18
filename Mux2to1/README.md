# 2-to-1 Multiplexer

## Files
- `mux2to1_gate.v` and `mux2to1_gate_tb.v` — gate-level model and testbench.
- `mux2to1_dataflow.v` and `mux2to1_dataflow_tb.v` — dataflow model and testbench.
- `mux2to1_behavioral.v` and `mux2to1_behavioral_tb.v` — behavioral model and testbench.

## Function

| S | Y |
| --- | --- |
| 0 | `I0` |
| 1 | `I1` |

All three files implement the same truth table in different Verilog styles.

## Run a Model
Replace `gate` with `dataflow` or `behavioral` to run another style.

```powershell
iverilog -o mux2to1_gate_tb.out mux2to1_gate.v mux2to1_gate_tb.v
vvp .\mux2to1_gate_tb.out
gtkwave .\mux2to1_gate.vcd
```
