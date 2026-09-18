# Full Adder

## Files
- `FullAdder.v` — contains a half-adder module and the full-adder design.
- `FullAdder_tb.v` — tests all eight input combinations.

## Function
Adds `A`, `B`, and carry input `Cin`.

- `Sum` is the 1-bit addition result.
- `Cout` is the carry output.

The full adder is built from **two half adders**. The first adds `A` and `B`;
the second adds the first sum and `Cin`. Their carry outputs are ORed to make
`Cout`.

## Run
```powershell
iverilog -o FullAdder_tb.out FullAdder.v FullAdder_tb.v
vvp .\FullAdder_tb.out
gtkwave .\FullAdder.vcd
```
