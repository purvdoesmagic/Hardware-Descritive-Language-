# Full Adder — Dataflow Model

## Files
- `FullAdderDataflow.v` — dataflow full-adder design.
- `FullAdderDataflow_tb.v` — tests all eight inputs.

## Function
This version uses continuous `assign` statements:

```verilog
Sum  = A ^ B ^ Cin
Cout = (A & B) | (B & Cin) | (A & Cin)
```

`Sum` is the addition bit and `Cout` is the carry bit.

## Run
```powershell
iverilog -o FullAdderDataflow_tb.out FullAdderDataflow.v FullAdderDataflow_tb.v
vvp .\FullAdderDataflow_tb.out
gtkwave .\FullAdderDataflow.vcd
```
