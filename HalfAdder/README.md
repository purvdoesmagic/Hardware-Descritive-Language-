# Half Adder

## Files
- `HalfAdder.v` — circuit design.
- `HalfAdder_tb.v` — testbench.

## Function
Adds two 1-bit inputs, `A` and `B`.

| A | B | Sum | Carry |
| --- | --- | --- | --- |
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

The design uses `Sum = A ^ B` and `Carry = A & B`.

## Run
```powershell
iverilog -o HalfAdder_tb.out HalfAdder.v HalfAdder_tb.v
vvp .\HalfAdder_tb.out
gtkwave .\HalfAdder.vcd
```
