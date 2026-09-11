# Hardware Description Language

Simple Verilog HDL implementations of basic combinational digital circuits.
Each circuit folder contains a design module and a testbench. Testbenches print
the output in the terminal and generate a VCD waveform for GTKWave.

## Requirements

Install [Icarus Verilog](https://bleyer.org/icarus/) and GTKWave. Check that
these commands work in PowerShell:

```powershell
iverilog -V
vvp -V
gtkwave --version
```

## How to Run

1. Open PowerShell in this repository.
2. Go to a circuit folder with `cd .\FolderName`.
3. Compile the design and testbench using the command in the table.
4. Run the simulation using `vvp .\simulation.out`.
5. Open the waveform using `gtkwave .\waveform.vcd`.

Example for the half adder:

```powershell
cd .\HalfAdder
iverilog -o HalfAdder_tb.out HalfAdder.v HalfAdder_tb.v
vvp .\HalfAdder_tb.out
gtkwave .\HalfAdder.vcd
```

## Circuit Guide

| Folder | Circuit | Compile command | Waveform |
| --- | --- | --- | --- |
| `HalfAdder` | Half adder | `iverilog -o HalfAdder_tb.out HalfAdder.v HalfAdder_tb.v` | `HalfAdder.vcd` |
| `FullAdder` | Full adder using two half adders | `iverilog -o FullAdder_tb.out FullAdder.v FullAdder_tb.v` | `FullAdder.vcd` |
| `FullSubtractor` | Full subtractor | `iverilog -o FullSubtractor_tb.out FullSubtractor.v FullSubtractor_tb.v` | `FullSubtractor.vcd` |
| `LogicDiagramDataflow` | Logic diagram: `D=A OR B`, `E=D AND C` | `iverilog -o LogicDiagramDataflow_tb.out LogicDiagramDataflow.v LogicDiagramDataflow_tb.v` | `LogicDiagramDataflow.vcd` |
| `FullAdderDataflow` | Full adder in dataflow style | `iverilog -o FullAdderDataflow_tb.out FullAdderDataflow.v FullAdderDataflow_tb.v` | `FullAdderDataflow.vcd` |
| `ParallelAdder4bit` | 4-bit parallel adder | `iverilog -o ParallelAdder4bit_tb.out FullAdder.v ParallelAdder4bit.v ParallelAdder4bit_tb.v` | `ParallelAdder4bit.vcd` |
| `AdderSubtractor4bit` | Controlled 4-bit adder/subtractor | `iverilog -o AdderSubtractor4bit_tb.out FullAdder.v AdderSubtractor4bit.v AdderSubtractor4bit_tb.v` | `AdderSubtractor4bit.vcd` |
| `Mux2to1Bufif` | 2-to-1 MUX using `bufif0` and `bufif1` | `iverilog -o Mux2to1Bufif_tb.out Mux2to1Bufif.v Mux2to1Bufif_tb.v` | `Mux2to1Bufif.vcd` |
| `Mux2to1` | Gate-level 2-to-1 MUX | `iverilog -o mux2to1_gate_tb.out mux2to1_gate.v mux2to1_gate_tb.v` | `mux2to1_gate.vcd` |
| `Mux4to1` | Gate-level 4-to-1 MUX | `iverilog -o mux4to1_gate_tb.out mux4to1_gate.v mux4to1_gate_tb.v` | `mux4to1_gate.vcd` |
| `Decoder3to8` | 3-to-8 decoder | `iverilog -o Decoder3to8_tb.out Decoder3to8.v Decoder3to8_tb.v` | `Decoder3to8.vcd` |

## MUX Modeling Styles

`Mux2to1` and `Mux4to1` contain three modeling styles:

- `*_gate.v` — uses logic-gate primitives.
- `*_dataflow.v` — uses Boolean expressions with `assign`.
- `*_behavioral.v` — uses `always` with `if-else` logic.

To run dataflow or behavioral MUX files, replace `gate` in the command with
`dataflow` or `behavioral`.

## Adder/Subtractor Control

In `AdderSubtractor4bit`, control input `M` selects the operation:

| `M` | Operation |
| --- | --- |
| `0` | `A + B` |
| `1` | `A - B` |

## License

This repository uses the existing MIT License. You do not need to make a
license change unless your college specifically requires a different license.
