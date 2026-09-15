# Hardware Descriptive Language

A collection of beginner-friendly Verilog HDL implementations of common
combinational and sequential digital circuits. Every project includes a design module and a
testbench for simulation with Icarus Verilog and waveform viewing in GTKWave.

## Included Circuits

| Circuit | Description |
| --- | --- |
| `HalfAdder` | Adds two 1-bit inputs and produces sum and carry outputs. |
| `FullAdder` | Implements a full adder using two half adders. |
| `FullAdderDataflow` | Full adder implemented using dataflow modeling. |
| `FullSubtractor` | Subtracts two 1-bit inputs with a borrow input. |
| `ParallelAdder4bit` | 4-bit parallel adder built from full adders. |
| `AdderSubtractor4bit` | Controlled 4-bit circuit for both addition and subtraction. |
| `Mux2to1` | 2-to-1 MUX in gate-level, dataflow, and behavioral styles. |
| `Mux2to1Bufif` | 2-to-1 MUX implemented using `bufif0` and `bufif1`. |
| `Mux4to1` | 4-to-1 MUX in gate-level, dataflow, and behavioral styles. |
| `Decoder3to8` | 3-to-8 decoder with one active output for each input value. |
| `LogicDiagramDataflow` | Dataflow implementation of `E = (A OR B) AND C`. |
| `GatedSRLatch` | Gated SR latch implemented using NAND gate primitives. |
| `DFlipFlop` | D flip-flop in structural and behavioral modeling styles. |
| `JKFlipFlop` | JK flip-flop in structural and behavioral modeling styles. |
| `MasterSlaveFlipFlop` | Master-slave JK flip-flop implemented from gated SR latches. |

## Repository Structure

Each circuit is stored in its own folder:

```text
CircuitName/
├── CircuitName.v       # Verilog design module
└── CircuitName_tb.v    # Verilog testbench
```

Some multi-module circuits, such as the 4-bit adder and adder/subtractor,
also include a reusable `FullAdder.v` module.

## Simulation

### Prerequisites

- [Icarus Verilog](https://bleyer.org/icarus/) for compiling and simulating Verilog.
- [GTKWave](https://gtkwave.sourceforge.net/) for viewing waveform files.

### Steps

1. Open a terminal in the required circuit folder.
2. Compile the design module and its testbench with `iverilog`.
3. Run the compiled simulation with `vvp`.
4. Open the generated `.vcd` waveform file with GTKWave.

Example: Half Adder

```powershell
cd HalfAdder
iverilog -o HalfAdder_tb.out HalfAdder.v HalfAdder_tb.v
vvp .\HalfAdder_tb.out
gtkwave .\HalfAdder.vcd
```

Example: 4-bit Parallel Adder

```powershell
cd ParallelAdder4bit
iverilog -o ParallelAdder4bit_tb.out FullAdder.v ParallelAdder4bit.v ParallelAdder4bit_tb.v
vvp .\ParallelAdder4bit_tb.out
gtkwave .\ParallelAdder4bit.vcd
```

## Modeling Styles

The MUX examples demonstrate three common Verilog modeling styles:

- **Gate-level modeling** uses Verilog gate primitives such as `and`, `or`, and `not`.
- **Dataflow modeling** uses Boolean equations with `assign` statements.
- **Behavioral modeling** uses procedural logic such as `always` and `if-else`.

## Verilog Concepts Used in This Repository

### Design Modules and Testbenches

- A **design module** describes the actual digital circuit.
- A **testbench** applies input values, generates clocks when needed, displays
  results with `$monitor`, generates VCD files with `$dumpfile` and `$dumpvars`,
  and stops simulation with `$finish`.
- `reg` is used in testbenches for signals whose values are assigned by the
  testbench.
- `wire` is used for signals driven by modules, continuous assignments, or gate
  primitives.
- `input`, `output`, `module`, and `endmodule` define a Verilog module interface.

### Continuous Assignment

Dataflow modules use `assign` to continuously drive an output from a Boolean
expression. Examples in this repository include:

```verilog
assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);
```

The output automatically changes whenever an input in the expression changes.

### Procedural Blocks and Clock Edges

Behavioral modules use `always` blocks.

```verilog
always @(posedge Clk)
```

means that the statements inside the block run only when `Clk` changes from
`0` to `1`. This is used by the behavioral D flip-flop. The behavioral JK
flip-flop also uses an asynchronous active-high reset:

```verilog
always @(posedge Clk or posedge Reset)
```

### Gate Primitives

Structural designs connect Verilog's built-in gate primitives. This repository
uses the following primitives:

| Primitive | Meaning | Used in |
| --- | --- | --- |
| `and` | AND gate | MUXes and master-slave circuits |
| `or` | OR gate | Gate-level MUXes |
| `not` | Inverter | Gate-level MUXes and flip-flops |
| `nand` | NAND gate | Gated SR latch and structural flip-flops |
| `bufif0` | Tri-state buffer enabled when control is `0` | `Mux2to1Bufif` |
| `bufif1` | Tri-state buffer enabled when control is `1` | `Mux2to1Bufif` |

## Verilog Operator Reference

The table below lists the main operator groups in Verilog. “Used here” refers
to this repository's design code, not merely to Verilog as a language.

| Group | Operators | Purpose | Used here? |
| --- | --- | --- | --- |
| Bitwise | `~`, `&`, `|`, `^`, `^~`, `~^` | Operate bit by bit on vectors or single bits | `~`, `&`, `|`, and `^` are used |
| Logical | `!`, `&&`, `||` | Produce one true/false result from expressions | `&&` is used in 4:1 MUX selection |
| Equality | `==`, `!=`, `===`, `!==` | Compare two values | `==` is used in behavioral and conditional MUX logic |
| Relational | `<`, `<=`, `>`, `>=` | Compare numeric magnitude | Not used in the design modules |
| Arithmetic | `+`, `-`, `*`, `/`, `%`, `**` | Perform numeric calculations | Not used; adders are built from logic equations and full adders |
| Shift | `<<`, `>>`, `<<<`, `>>>` | Shift bits left or right | Not used |
| Conditional | `condition ? value_if_true : value_if_false` | Select one of two values | Used in `Mux4to1/mux4to1_dataflow.v` |
| Concatenation | `{a, b}` | Join signals into one vector | Used as part of replication |
| Replication | `{N{signal}}` | Repeat a signal or bit pattern | `{4{M}}` is used in `AdderSubtractor4bit` |

### Operators Used in the Circuit Designs

| Operator | Meaning | Example use in this repository |
| --- | --- | --- |
| `~` | Bitwise NOT | Inverts `S` in the 2:1 dataflow MUX and inverts `B` terms in the full subtractor. |
| `&` | Bitwise AND | Forms carry and borrow terms, for example `A & B`. |
| `|` | Bitwise OR | Combines carry, borrow, and logic terms. |
| `^` | Bitwise XOR | Produces sum and difference bits. |
| `&&` | Logical AND | Checks two select-bit conditions in the 4:1 conditional MUX. |
| `==` | Equality comparison | Tests whether a select or flip-flop input is `0` or `1`. |
| `?:` | Conditional operator | Selects `I0`, `I1`, `I2`, or `I3` in the 4:1 dataflow MUX. |
| `{4{M}}` | Replication operator | Copies control bit `M` four times to conditionally invert `B` for subtraction. |

### Conditional Operator in the 4-to-1 MUX

`Mux4to1/mux4to1_dataflow.v` uses nested conditional operators:

```verilog
assign Y = (S1 == 0 && S0 == 0) ? I0 :
           (S1 == 0 && S0 == 1) ? I1 :
           (S1 == 1 && S0 == 0) ? I2 : I3;
```

This implements the standard 4-to-1 MUX truth table:

| `S1` | `S0` | `Y` |
| --- | --- | --- |
| `0` | `0` | `I0` |
| `0` | `1` | `I1` |
| `1` | `0` | `I2` |
| `1` | `1` | `I3` |

## Sequential Circuit Notes

### Gated SR Latch

The gated SR latch stores one bit when `Enable = 1`.

| `Enable` | `S` | `R` | Result |
| --- | --- | --- | --- |
| `0` | X | X | Holds its previous state |
| `1` | `0` | `0` | Holds its previous state |
| `1` | `1` | `0` | Sets `Q` to `1` |
| `1` | `0` | `1` | Resets `Q` to `0` |

The input combination `S = 1` and `R = 1` is not applied in the testbench
because it is an invalid state for an SR latch.

### D Flip-Flop

The D flip-flop copies `D` to `Q` at the rising edge of `Clk`.

| Clock event | Output |
| --- | --- |
| `posedge Clk` | `Q = D` |

The structural version contains two gated SR latches: a master latch enabled
when the clock is low, and a slave latch enabled when the clock is high.

### JK and Master-Slave JK Flip-Flops

The JK flip-flop avoids the invalid SR latch input combination.

| `J` | `K` | Result on rising clock edge |
| --- | --- | --- |
| `0` | `0` | Hold current `Q` |
| `0` | `1` | Reset `Q` to `0` |
| `1` | `0` | Set `Q` to `1` |
| `1` | `1` | Toggle `Q` |

The structural JK and master-slave implementations use an active-high `Reset`
to establish `Q = 0` at the start of simulation. The master latch samples the
inputs while the clock is low; the slave latch updates `Q` when the clock rises.

## Arithmetic Circuit Notes

### 4-bit Parallel Adder

The 4-bit parallel adder instantiates four 1-bit full adders. The carry output
of each bit connects to the carry input of the next bit; this is also called a
ripple-carry adder.

### Controlled 4-bit Adder/Subtractor

Control input `M` selects the operation:

| `M` | `B_modified` | Operation |
| --- | --- | --- |
| `0` | `B` | `A + B` |
| `1` | `~B` | `A + ~B + 1`, which equals `A - B` in two's complement |

The expression `B ^ {4{M}}` passes `B` unchanged when `M = 0` and inverts all
four bits of `B` when `M = 1`.

## Waveforms

Each testbench creates a VCD waveform file. Waveform screenshots for the
individual experiments can be added here as they become available.

## License

This project is available under the [MIT License](LICENSE).
