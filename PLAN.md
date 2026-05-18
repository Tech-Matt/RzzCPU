# RISC-V CPU Architecture Planning

This document contains key architectural questions to help guide the design of your 32-bit RISC-V CPU. Answering these will help establish the fundamental structure of your hardware before you write the RTL.

## 1. Memory Architecture
*   **Harvard vs. Von Neumann:**
    *   *Harvard:* Separate instruction memory and data memory. Easier to design for single-cycle or basic pipelined processors because you can fetch an instruction and read/write data in the exact same clock cycle without contention.
    *   *Von Neumann:* Shared memory for instructions and data. More realistic for a full system, but requires a memory controller to arbitrate between instruction fetches and data accesses, often introducing stalls or requiring caches.
    *   *Question:* Will you start with separate IMEM and DMEM for simplicity (Harvard-style microarchitecture), or immediately tackle a unified memory bus (Von Neumann)?

## 2. Microarchitecture & Execution Strategy
*   **Single-Cycle, Multi-Cycle, or Pipelined?**
    *   *Single-Cycle:* Executes one instruction per clock cycle. Very low clock frequency (CPI = 1, long critical path). Easiest to build and debug.
    *   *Multi-Cycle:* Breaks instruction execution into steps. Can share hardware (e.g., using one ALU for both PC calculation and arithmetic). Higher clock frequency, but complex control state machine.
    *   *Pipelined (Classic 5-Stage):* Overlaps instructions (Fetch, Decode, Execute, Memory, Writeback). High performance, but requires handling data hazards (forwarding) and control hazards (branch prediction/flushes).
    *   *Question:* Which execution strategy will you implement first? (A common path is to build single-cycle first, verify it, and then convert it to a pipeline).

## 3. Privilege and Operating System Support
*   **Target OS Requirements:**
    *   To run an OS (like Linux or a simpler RTOS), you need Privileged modes (Machine, Supervisor, User).
    *   *Question:* What is the ultimate goal? A simple RTOS (might only need Machine and User modes, no MMU) or a full OS like Linux (requires Supervisor mode and an MMU for virtual memory)?

## 4. Busses and Interconnects
*   **How will the CPU talk to the outside world?**
    *   A CPU isn't very useful without peripherals (UART, Timers, external RAM).
    *   *Question:* Will you design a custom, simple memory interface, or adopt an industry-standard bus protocol like AXI4-Lite or Wishbone from the start? Standard buses make it easier to integrate open-source peripherals later.

## 5. Branch Prediction
*   **Handling Control Hazards:**
    *   If you choose a pipelined design, branch instructions will cause delays if you have to wait to evaluate the condition.
    *   *Question:* Will you assume branches are always not taken (simplest), or implement a basic static/dynamic branch predictor to improve performance?

## 6. Implementation and Verification Strategy
*   **Hardware and Tools:**
    *   *Question:* Are you targeting a specific FPGA (e.g., Xilinx Artix-7 via Vivado)? Does this influence your use of Block RAMs for memory?
    *   *Question:* How will you verify the CPU? Will you write SystemVerilog testbenches for individual modules, use RISC-V compliance test suites, or perhaps use a framework like Verilator?
