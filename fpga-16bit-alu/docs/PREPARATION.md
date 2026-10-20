# Preparation notes

Source: user-supplied `ALU1.zip`, containing `ALU16/`.

- All six original RTL modules were copied without changes.
- Original stimulus bench retained; only its module name changed to `alu16_demo_tb`.
- Added README, self-checking testbench, Tcl scripts, GitHub Actions workflow, and ignore rules.
- Retained four original text reports; redacted the report host identity.
- Excluded generated Vivado caches, executables, compiled simulation databases, checkpoints, logs, telemetry, machine-specific XPR metadata, and binary report databases.
- Resume is context only and is not included in the public package.
- No board constraints, bitstream, hardware demonstration, timing target, or unsupported performance claims were invented.
- No license was selected on the owner's behalf.
- Simulation and new Tcl script execution remain pending on a machine with the required EDA tools.

Suggested repository name: `fpga-16bit-alu`.

Suggested GitHub description: Modular 16-bit Verilog ALU with signed overflow detection, Vivado project scripts, and self-checking simulation.

Suggested topics: `verilog`, `fpga`, `alu`, `vivado`, `digital-design`, `rtl`.

Accurate portfolio description: Designed a modular 16-bit combinational ALU in Verilog with parallel addition, subtraction, AND and XOR datapaths, result selection, and signed overflow detection; synthesized and routed the design in Vivado.

Only describe physical FPGA testing or verified timing performance after separately completing and documenting those steps.
