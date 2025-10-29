# 32-Bit Serial Adder - Verilog Implementation

A fully functional 32-bit serial adder implemented in Verilog, designed for AMD Vivado and tested on Zynq-7000 family FPGA.

## 📋 Project Overview

This project implements a 32-bit serial adder that processes binary numbers one bit at a time, using a single full adder circuit with carry storage between clock cycles. The design emphasizes area efficiency over speed, making it suitable for resource-constrained FPGA applications.

### 🎯 Key Features
- **32-bit parallel input, serial processing**
- **Single full adder reuse** for all bit positions
- **Sequential control with finite state machine**
- **Carry propagation handling**
- **AMD Vivado compatible**
- **Zynq-7000 FPGA optimized**

## 🏗️ Architecture

### Core Components
1. **PISO Registers** (2x) - Parallel-In-Serial-Out for operands
2. **SIPO Register** - Serial-In-Parallel-Out for sum result
3. **Full Adder** - 1-bit addition with carry
4. **Carry Flip-Flop** - Stores carry between bit operations
5. **Bit Counter** - Tracks processed bits (0-31)
6. **Control FSM** - Coordinates entire operation

## 📁 File Structure

### Source Files (`/src/verilog/`)
- `d_flip_flop.v` - Basic D flip-flop with reset
- `full_adder.v` - 1-bit full adder logic
- `PISOreg.v` - Parallel-In-Serial-Out shift register
- `SIPOreg.v` - Serial-In-Parallel-Out shift register  
- `bit_counter.v` - 6-bit counter for operation tracking
- `Control.v` - Finite State Machine controller
- `Serial_adder.v` - Top-level module integration

### Testbench (`/src/testbench/`)
- `Serial_adder_tb.v` - Comprehensive test suite

## ⚙️ Specifications

### Performance
- **Operation Time**: 49 clock cycles per addition
- **Maximum Frequency**: Limited by single full adder delay
- **Latency**: 49 cycles from start to done
- **Throughput**: 1 operation per 49 cycles

### Resource Utilization (Estimated)
- **Flip-Flops**: ~100 DFFs
- **LUTs**: ~50 LUTs
- **Full Adders**: 1
- **Control Logic**: Minimal FSM

### Block Diagram
[Operand A] → PISO Reg →─┐
                        
[Operand B] → PISO Reg →─┼→ Full Adder → SIPO Reg → [Sum Output]

│ │

Carry FF ←┘ ↑

│ │

Control FSM ← Bit Counter

↑

[Start Signal]
