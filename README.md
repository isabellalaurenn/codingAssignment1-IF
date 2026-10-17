# Coding Assignment 1 - Fetch Stage
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->

## Design Scope and Assumptions
- **In scope:** The purpose of this lab is to begin our MIPS pipeline with the first stage - fetch.
- **Out of scope:** The remaining stages of the MIPS pipeline will be implemented in future labs.
- **Assumptions:** Memory is byte-addressed, so each 32-bit instruction is 4 bytes and the PC advances by 4. The testbench clock toggles every 1 ns, and all clocked modules update on the rising edge.
- **Limitations:** Vivado cannot build a real 2^32 word array, so mem.v store only the first 64 byte addresses. The first 10 instructions hold dummy data, and every other address returns 0. Additionally, there is no stall or flush logic, os hazards are not handled in this stage.

## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| Latch | Passes the data through on the clock cycle | Waveform: if_id_npc and if_id_instr change only on the rising clock edges and reset to 0 when rst is high |
| Instruction Memory | Holds 2^32 words, For now populate the first 10 addresses with Dummy Data, and Returns the instruction at a given address | Waveform: if_id_instr shows the HEX values for the PC values|
| PC | Passes the input as the output on the clock cycle | Waveform: pc_out takes the value of pc_in on each rising edge|
| Mux | Selects source of the next PC address | Waveform: with mem_pc_src = 1 the PC loads mem_mpc0 and with mem_pc_src = 0 it follows the adder |
| Adder | Calculates the address of the next sequential instruction by adding 4 to the current PC | Waveform: if_id_npc is always the current address and steps up each clock|
| Final IF Stage | Module with all 5 components | Incoporating all of the above in the full-stage testbench fetch-tb.v|

## Architecture
### Timing or Behavioral Summary
The PC holds the address of the instruction being fetched. The adder computes PC+4 and the mux chooses between that value and the jump target from a later pipeline stage. The chosen value is loaded into the PC on the next rising clock edge. The PC address is sent to the instruction memory, and the adder value and the fetched instruction are captured by the if/id latch on the rising clock edge, so the next stage sees them in the next clock.

## Implementation
### Source Code
| File | Description |
|---|---|
| [`if_id_latch.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/if_id_latch.v) | Dictates when to move to the next instruction on clock edge |
| [`mem.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/mem.v) | Reads instruction memory data at a specific location |
| [`pc.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/pc.v) | Holds current state at clock edge |
| [`mux.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/mux.v) | Decides where the processor will continue |
| [`adder.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/adder.v) | Combinational logic calculating next sequential instruction address |
| [`fetch.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/fetch.v) | Top level fetch stage that connects all of the above modules |
| [`fetch_tb.v`](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/fetch_tb.v) | Verification testbench for the full fetch stage |

### Implementation Notes
- The memory is byte addressed, so the adder adds 4 instead of 1, and the dummy instructions are stored at the corresponding addresses.
- Every clocked module uses the same interface convention, a clk input and rst input. The adder and memory don't require but still keep these (since they are combinational) but keep consistency.
- Because Vivado cannot build a 2^32 word array, we deliberately simplified mem.v to store 64 words and return 0 for addresses outside that range.
  
## Verification
### Verification Strategy
The design is verified using **timing diagrams**.
Verification covers:
- Normal operating case: the PC counts up by 4 each clock and matching instructions are fetched.
- Boundary case: fetching the last populated instruction (90000099) and branches back to address 0.
- Initialization case: all are set to 32'h00000000; 

### Testbench and Waveform
![fetch_tb Waveform](images/waveform.png)
The testbench source is available [*here*](https://github.com/isabellalaurenn/codingAssignment1-IF/blob/main/fetch_tb.v).

### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — Reset | For the first few clock cycles, while rst is high, pc_out, if_id_npc, and if_id_instr are 0 | [Observed behavior] | Pass / Fail |
| TC-02 — Sequential Taken| [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — Branch Taken | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-04 — Resume After Branch  | [Expected behavior] | [Observed behavior] | Pass / Fail |

## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** Vivado
- **Language / standard:** Verilog
- **Operating system:** Windows
- **Additional dependencies:** n/a
### Build and Run
```bash
In Vivado,
1) Create an RTL project and add adder.v, fetch.v, if_id_latch.v, mem.v, mux.v, and pc.v as Design Sources.
2) Add fetch_tb.v as a Simulation Source and set it to the top module.
3) Run a Behavioural Simulation
4) Open the waveform window :)
```
Expected output:
```text
pc_out should increment by 4
if_id_npc should incremeber by 4 as well
if_id_instr should display the corresponding address
```

## Repository Organization
```text
.
├── README.md
├── images/
│ └── waveform.png
├── adder.v
├── fetch.v
├── fetch_tb.v
├── if_id_latch.v
├── mem.v
├── mux.v
└── pc.v
```

## Known Issues and Future Improvements
- The instruction memory can only store 64 words because of Vivado's limits, so to fully implement the 2^32 words a different software perhaps is needed.
- In future labs, we could enable a flush signal to handle pipeline hazards.
