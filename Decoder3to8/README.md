# 3-to-8 Decoder

## Files
- `Decoder3to8.v` — decoder design.
- `Decoder3to8_tb.v` — testbench for all eight input values.

## Function
Converts a 3-bit binary input `A[2:0]` into one active output in `Y[7:0]`.

| A | Active output |
| --- | --- |
| 000 | `Y[0]` |
| 001 | `Y[1]` |
| 010 | `Y[2]` |
| 011 | `Y[3]` |
| 100 | `Y[4]` |
| 101 | `Y[5]` |
| 110 | `Y[6]` |
| 111 | `Y[7]` |

Only one output is `1` at a time. This is called a **one-hot output**.

## Run
```powershell
iverilog -o Decoder3to8_tb.out Decoder3to8.v Decoder3to8_tb.v
vvp .\Decoder3to8_tb.out
gtkwave .\Decoder3to8.vcd
```
