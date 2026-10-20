# 16-Bit ALU in Verilog

I built this project to explore how a small arithmetic logic unit can be broken into clear, reusable hardware blocks. It brings together four operations and selects the result with a 4-to-1 multiplexer.

The design is written in Verilog and was implemented in Vivado for the Artix-7 part `xa7a12tcpg238-2I`. The ALU is combinational, so it has no clock, reset, or pipeline.

## What it does

| Op | Operation | Result |
| --- | --- | --- |
| `00` | Add | `A + B` |
| `01` | Subtract | `A - B` |
| `10` | Bitwise AND | `A & B` |
| `11` | Bitwise XOR | `A ^ B` |

For addition and subtraction, the design also raises an overflow flag when the signed 16-bit result falls outside the range -32,768 to 32,767. The result keeps its lower 16 bits.

## Explore the project

The source and project files are in [`fpga-16bit-alu/`](fpga-16bit-alu/). That folder contains the Verilog modules, two testbenches, Vivado Tcl scripts, selected implementation reports, and a more detailed setup guide.

To recreate the Vivado project, open a terminal at the project folder and run:

```sh
vivado -mode batch -source scripts/create_project.tcl
```

The project was created with Vivado 2026.1. You may need a Vivado installation that supports the target part, or set `FPGA_PART` to a part available in your installation.

## A note about the implementation reports

The reports show that Vivado completed routing for the supplied design. They do not show a measured clock speed or a test on a physical FPGA board. The supplied project has no board pin assignments or timing constraints, so those need to be added for a specific board before hardware deployment.

The self-checking testbench and GitHub Actions workflow are included in the project, but I haven't run them in this environment yet.

---

This repository is a learning project and a work in progress. I plan to keep building on it as I learn more about RTL design and FPGA implementation.
