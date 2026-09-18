# 2-to-1 MUX Using `bufif0` and `bufif1`

## Files
- `Mux2to1Bufif.v` — MUX design using tri-state buffer primitives.
- `Mux2to1Bufif_tb.v` — testbench.

## Function
The MUX has the normal 2-to-1 behavior:

| S | Y |
| --- | --- |
| 0 | `I0` |
| 1 | `I1` |

`bufif0 (Y, I0, S)` drives `I0` only when `S=0`. `bufif1 (Y, I1, S)` drives
`I1` only when `S=1`. The disabled buffer outputs high impedance (`Z`).

## Run
```powershell
iverilog -o Mux2to1Bufif_tb.out Mux2to1Bufif.v Mux2to1Bufif_tb.v
vvp .\Mux2to1Bufif_tb.out
gtkwave .\Mux2to1Bufif.vcd
```
