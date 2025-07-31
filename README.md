# FPGA Implementation of 1101 Sequence Detector

This project implements a sequence detector for the binary pattern **1101** on the Nexys DDR FPGA board.  
The design includes **Finite State Machines (FSMs)** using **both Mealy and Moore models**, covering **overlapping and non-overlapping detection**.  
The project also compares **Binary, Gray, and One-Hot state encodings** to evaluate performance, power, and switching activity.

## Features
- **Sequence**: Detects `1101` pattern in real-time
- **FSM Variants**: Mealy & Moore (Overlapping and Non-Overlapping)
- **Encodings Compared**:
  - Binary
  - Gray
  - One-Hot
- **Hardware Visualization**:
  - LEDs indicate detection outputs
  - 7-segment display shows FSM states in real time
- **Optimized Clock Divider** for human-visible state transitions

## Results
- Gray encoding reduced switching activity by ~40%
- One-Hot encoding reduced dynamic power by ~30%
- Achieved 100% detection accuracy across all implementations

