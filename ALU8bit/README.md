# 8-bit ALU

## Files
- `ALU8bit.v` — ALU that produces only `Result`.
- `ALU8bit_tb.v` — testbench for the basic ALU.
- `ALU8bitFlags.v` — ALU with result-status flags.
- `ALU8bitFlags_tb.v` — testbench for the flagged ALU.

## Inputs and Outputs
- `A[7:0]`, `B[7:0]` — 8-bit input operands.
- `Sel[2:0]` — selects one of eight operations.
- `Result[7:0]` — 8-bit result.

| Sel | Operation |
| --- | --- |
| 000 | `A + B` |
| 001 | `A - B` |
| 010 | `A & B` |
| 011 | `A | B` |
| 100 | `A ^ B` |
| 101 | `~A` |
| 110 | `A << 1` |
| 111 | `A >> 1` |

## Flags Version
`ALU8bitFlags.v` also produces these flags:

| Flag | Meaning |
| --- | --- |
| `CarryBorrow` | Carry for addition, borrow for subtraction, shifted-out bit for shifts. |
| `Zero` | `1` when `Result` is zero. |
| `Sign` | Most-significant bit of `Result`. |
| `Parity` | `1` when `Result` has an even number of `1` bits. |
| `AuxCarry` | Carry or borrow between bit 3 and bit 4. |
| `Overflow` | Signed arithmetic overflow for addition or subtraction. |

The flags testbench includes `7F + 01 = 80` to demonstrate signed overflow
and `00 - 01 = FF` to demonstrate a borrow.

## Run
```powershell
iverilog -o ALU8bit_tb.out ALU8bit.v ALU8bit_tb.v
vvp .\ALU8bit_tb.out
gtkwave .\ALU8bit.vcd
```

```powershell
iverilog -o ALU8bitFlags_tb.out ALU8bitFlags.v ALU8bitFlags_tb.v
vvp .\ALU8bitFlags_tb.out
gtkwave .\ALU8bitFlags.vcd
```
