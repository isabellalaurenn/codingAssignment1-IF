# Coding Assignment 1 - Fetch Stage
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->

## Design Scope and Assumptions
- **In scope:** The purpose of this lab is to begin our MIPS pipeline with the first stage - fetch.
- **Out of scope:** The remaining stages of the MIPS pipeline will be implemented in future labs.
- **Assumptions:** [Clock frequency, reset behavior, data width, memory model, or
other assumptions]
- **Limitations:** [Known limitations or simplified behaviors]
- 
## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| Latch | Passes the data through on the clock cycle | [Test case, waveform, calculation, or
inspection] |
| Instruction Memory | Holds 2^32 words, For now populate the first 10 addresses with Dummy Data, and Returns the instruction at a given address | [Test case, waveform, calculation, or
inspection] |
| PC | Passes the input as the output on the clock cycle | [Test case, waveform, calculation, or
inspection] |
| Mux | Selects source of the next PC address | [Test case, waveform, calculation, or
inspection] |
| Adder | Calculates the address of the next sequential instruction by adding 4 to the current PC | [Test case, waveform, calculation, or
inspection] |
| Final IF Stage | Module with all 5 components | [Test case, waveform, calculation, or
inspection] |

## Architecture
### Timing or Behavioral Summary
Save diagrams in the repository's `images/` folder. Use relative paths so they
display on GitHub.
![Timing Diagram](images/[timing-diagram-filename].png)

## Implementation
### Source Code
| File | Description |
|---|---|
| [`ifIdLatch.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/ifIdLatch.v) | Dictates when to move to the next instruction on clock edge. |
| [`mem.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/mem.v) | Reads instruction memory data at a specific location. |
| [`pc.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/pc.v) | Holds current state at clock edge. |
| [`mux.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/mux.v) | Decides where the processor will continue. |
| [`adder.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/adder.v) | Combinational logic calculating next sequential instruction address. |
| [`[FINALIFSTAGE].v`](LINK_TO_CODE) | [Verification testbench] |
| [`[TESTBENCH].v`](LINK_TO_TESTBENCH_CODE) | [Verification testbench] |

### Implementation Notes
- [Explain one important design decision.]
- [Identify any parameterization, reusable module, or interface convention.]
- [Document any deliberate simplification made for this lab.]
- 
## Verification
### Verification Strategy
The design is verified using **[simulation, formal checks, hardware testing, or
another method]**.
Verification covers:
- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]
### Testbench and Waveform
Save screenshots and waveform images in the repository's `images/` folder.
![Testbench or waveform](images/[testbench-screenshot-filename].png)
The testbench source is available [*here*](LINK_TO_TESTBENCH_CODE).
### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |

## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** [Name and version]
- **Language / standard:** [Verilog/SystemVerilog version]
- **Operating system:** [macOS, Windows, Linux, or other]
- **Additional dependencies:** [List any required tools or libraries]
### Build and Run
```bash
# Replace these commands with the commands required for this lab.
[compile-command]
[run-command]
```
Expected output:
```text
[Paste a short representative output or result here.]
```

## Repository Organization
```text
.
├── README.md
├── images/
│ ├── [timing-diagram-filename].png
│ └── [testbench-screenshot-filename].png
├── [source-files]
└── [testbench-files]
```

## Known Issues and Future Improvements
- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic improvement or extension.]
