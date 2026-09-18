# 8-to-3 Encoder

## Files
- `Encoder8to3.v` — encoder design.
- `Encoder8to3_tb.v` — testbench.

## Function
Converts one active input from `I[7:0]` into a 3-bit binary output `Y[2:0]`.

| Active input | Y |
| --- | --- |
| `I[0]` | 000 |
| `I[1]` | 001 |
| `I[2]` | 010 |
| `I[3]` | 011 |
| `I[4]` | 100 |
| `I[5]` | 101 |
| `I[6]` | 110 |
| `I[7]` | 111 |

This is a standard encoder, so the input must be **one-hot**: only one input
should be `1` at a time. It is not a priority encoder.

## Run
```powershell
iverilog -o Encoder8to3_tb.out Encoder8to3.v Encoder8to3_tb.v
vvp .\Encoder8to3_tb.out
gtkwave .\Encoder8to3.vcd
```
