# Master-Slave JK Flip-Flop

## Files
- `MasterSlaveFlipFlop.v` — structural master-slave JK design.
- `MasterSlaveFlipFlop_tb.v` — testbench.

## Function
The circuit uses two gated SR latches:

1. The **master** latch accepts JK input information while `Clk=0`.
2. The **slave** latch transfers the master's stored value to `Q` when `Clk=1`.

This arrangement makes the output change once per clock cycle and prevents the
race-around problem of a simple level-sensitive JK latch.

| J | K | Q on rising clock edge |
| --- | --- | --- |
| 0 | 0 | Hold |
| 0 | 1 | Reset to 0 |
| 1 | 0 | Set to 1 |
| 1 | 1 | Toggle |

`Reset=1` initializes `Q=0`. The testbench demonstrates reset, set, reset,
toggle, and hold operations.

## Run
```powershell
iverilog -o MasterSlaveFlipFlop_tb.out MasterSlaveFlipFlop.v MasterSlaveFlipFlop_tb.v
vvp .\MasterSlaveFlipFlop_tb.out
gtkwave .\MasterSlaveFlipFlop.vcd
```
