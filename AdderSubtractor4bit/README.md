# Controlled 4-bit Adder/Subtractor

## Files
- `FullAdder.v` — reusable 1-bit full adder.
- `AdderSubtractor4bit.v` — controlled 4-bit design.
- `AdderSubtractor4bit_tb.v` — tests addition and subtraction.

## Inputs and Outputs
- `A[3:0]`, `B[3:0]` — 4-bit operands.
- `M` — operation control.
- `Result[3:0]` — output result.
- `Cout` — carry output.

| M | Operation |
| --- | --- |
| 0 | `A + B` |
| 1 | `A - B` |

For subtraction, the circuit inverts `B` with XOR gates and adds `1` through
the initial carry input. This is two's-complement subtraction.

## Run
```powershell
iverilog -o AdderSubtractor4bit_tb.out FullAdder.v AdderSubtractor4bit.v AdderSubtractor4bit_tb.v
vvp .\AdderSubtractor4bit_tb.out
gtkwave .\AdderSubtractor4bit.vcd
```
