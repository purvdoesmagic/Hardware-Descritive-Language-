# 4-to-2 Priority Encoder

## Files
- `PriorityEncoder4to2.v` — priority encoder design.
- `PriorityEncoder4to2_tb.v` — testbench.

## Function
Encodes the highest active input from `I[3:0]` into `Y[1:0]`.

```text
Priority: I3 > I2 > I1 > I0
```

| Highest active input | Y | Valid |
| --- | --- | --- |
| none | 00 | 0 |
| `I[0]` | 00 | 1 |
| `I[1]` | 01 | 1 |
| `I[2]` | 10 | 1 |
| `I[3]` | 11 | 1 |

For example, input `0110` produces `Y=10` because `I2` has higher priority
than `I1`.

## Run
```powershell
iverilog -o PriorityEncoder4to2_tb.out PriorityEncoder4to2.v PriorityEncoder4to2_tb.v
vvp .\PriorityEncoder4to2_tb.out
gtkwave .\PriorityEncoder4to2.vcd
```
