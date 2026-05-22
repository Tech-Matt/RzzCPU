# The Memory architecture

It is technically a Von Neumann architecture, cause I will use just one memory for both the instruction memory and the data memory.

I am going to use BRAMs, with dual access ports:

- Instruction memory will be using PORT A which is **read only**
- Data Memory will be using PORT B, which has **read/write accesses**

## Features

| Property | Description |
|----------|-------------|
|**Total Available Memory**| 225 KB.|
|**Memory size**| 32 KB|
|**Width**| 32 bits|
|**Depth**| 8192 word lines|
|**Target Algorithm**| Minimum Area. |
|**Single Byte Writable**| Yes, cause RISC-V requires it. |
|**AXI or Native** | Native for simplicity |
|**True Dual port Mode** | Both ports can read and write. Port A always reads (IMEM), Port B can do both (DMEM) |
|**Parity Bits** | No |
|**Error Correction Code (ECC)** | No |
|**Common Clock** | Yes |
|**Write Mode**| Read First|
|**Enable pins**| Yes|
|**Primitive and core output registers**| Disabled|
|**REGCEA**| No|
|**RST Pins**| No|



## Pros
  - No structural hazards (I guess). Because both the IMEM and DMEM will always have separate hardware to access the memory. 
  - There can't be no **Write-Write** collisions, cause the IMEM is inherently read only.

## Cons
- We need to be careful to **Read-Write** collisions
- The memory is bigger compared to a single port memory


## Considerations about the Operating Mode
Using **Read First** (Read before Write), grants that if the CPU reads and writes to the same address at the exact same time, the read port returns the value that was in the memory before the write started. This is the standard behaviour expected by most CPU pipelines.
