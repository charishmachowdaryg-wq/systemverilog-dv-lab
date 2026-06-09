# SystemVerilog Design Verification Lab

## 📌 Overview
This repository contains a SystemVerilog-based synchronous FIFO design and its functional verification environment.

The project focuses on fundamental Design Verification concepts such as self-checking testbenches, scoreboard-based verification, and read-after-write behavior validation.

---

## 📂 Project Included

### Synchronous FIFO
- Parameterized FIFO design (configurable depth and width)
- Read and write pointer-based architecture
- Full and Empty flag generation
- Read-after-write behavior verification
- Self-checking testbench using scoreboard (queue-based reference model)

## 🧪 Verification Methodology
This project follows a structured verification approach:

- Stimulus generation using testbench tasks
- Reference model using SystemVerilog queue
- Self-checking scoreboard for result comparison
- Functional verification using directed test cases
- Waveform analysis for debugging

### 📌 FIFO Behavior Note (Based on Design Specification)

- The EMPTY signal is defined based on the custom design requirement.
- EMPTY remains HIGH until all FIFO locations are filled with valid data.
- Once the FIFO is completely filled, EMPTY transitions LOW.
- The FULL signal is asserted HIGH when all FIFO memory locations are occupied.
- FULL deasserts when at least one location becomes free.

## 🛠️ Tools Used
- SystemVerilog HDL
- EDA Playground (simulation platform)

---

## 📌 Note
This project was developed and verified using EDA Playground only.
