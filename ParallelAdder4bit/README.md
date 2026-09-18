# 4-bit Parallel Adder

## Files
- `FullAdder.v` — reusable 1-bit full adder.
- `ParallelAdder4bit.v` — connects four full adders.
- `ParallelAdder4bit_tb.v` — applies example additions.

## Function
Adds two 4-bit values, `A[3:0]` and `B[3:0]`, plus input carry `Cin`.

- `Sum[3:0]` is the 4-bit result.
- `Cout` is the final carry.

The carry from each bit is connected to the next bit, so this circuit is also
called a **ripple-carry adder**.

## Run
```powershell
iverilog -o ParallelAdder4bit_tb.out FullAdder.v ParallelAdder4bit.v ParallelAdder4bit_tb.v
vvp .\ParallelAdder4bit_tb.out
gtkwave .\ParallelAdder4bit.vcd
```
