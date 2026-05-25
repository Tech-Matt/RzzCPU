# RISC-V CPU Architecture Planning

This document contains key architectural questions to help guide the design of a 32-bit RISC-V CPU. 

The goal is to build a **Minimum Viable Processor**.

## 1. Memory Architecture
*   **Harvard vs. Von Neumann:**
Von Neumann architecture, with BRAM with dual access memory (2 ports). IMEM will use read only port, while DMEM will have read/write accesses.

## 2. Microarchitecture & Execution Strategy
*   **Single-Cycle, Multi-Cycle, or Pipelined?**
I am going to go for a 5 stages RISC pipelined architecture. I am going to focus later on possible optimizations, like superscalar or super-pipelining.

## 3. Privilege and Operating System Support
*   **Target OS Requirements:**
I am not gonna concern myself with Priviliged modes right now. I am going to implement only the Unprivileged RISC ISA. Gonna focus on the priviliged mode later on.

## 4. Busses and Interconnects
*   **How will the CPU talk to the outside world?**
Probably AXI but this is a problem of my future me. 

## 5. Branch Prediction
*   **Handling Control Hazards:**
Going to support speculative execution in a later stage. For now I am going to go with the default standard of **Predict not taken**

## 6. Implementation and Verification Strategy
*   **Hardware and Tools:**
I am going to target (for now) the Basys 3 with the Artix 7. 
For verification I will use(for now) simple SystemVerilog testvbenches.

## 7. ISA
Going to start with RV32I.

## 8. Register File
I am going to use the DRAMs here, cause I need async reads.

## 9. How to handle hazards?
