# Logic Diagram — Dataflow Model

## Files
- `LogicDiagramDataflow.v` — design module.
- `LogicDiagramDataflow_tb.v` — tests all values of `A`, `B`, and `C`.

## Function
The first stage is an OR gate and the second stage is an AND gate:

```text
D = A OR B
E = D AND C
```

Therefore, `E` becomes `1` only when `C=1` and at least one of `A` or `B` is
`1`.

## Run
```powershell
iverilog -o LogicDiagramDataflow_tb.out LogicDiagramDataflow.v LogicDiagramDataflow_tb.v
vvp .\LogicDiagramDataflow_tb.out
gtkwave .\LogicDiagramDataflow.vcd
```
