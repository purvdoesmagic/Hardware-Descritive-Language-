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

## Waveforms

Each testbench creates a VCD waveform file. Waveform screenshots for the
individual experiments can be added here as they become available.

## License

This project is available under the [MIT License](LICENSE).
