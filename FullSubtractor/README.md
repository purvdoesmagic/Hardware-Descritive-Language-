# Full Subtractor

## Files
- `FullSubtractor.v` — circuit design.
- `FullSubtractor_tb.v` — tests all eight input combinations.

## Function
Subtracts `B` and borrow input `Bin` from `A`.

- `Diff` is the difference bit.
- `Bout` is `1` when a borrow is needed.

The design equations are:

```verilog
Diff = A ^ B ^ Bin
Bout = (~A & B) | (~A & Bin) | (B & Bin)
```

## Run
```powershell
iverilog -o FullSubtractor_tb.out FullSubtractor.v FullSubtractor_tb.v
vvp .\FullSubtractor_tb.out
gtkwave .\FullSubtractor.vcd
```
