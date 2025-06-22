#  FPGA-Based Digital System Design with Verilog HDL

This project demonstrates the design, simulation, and analysis of a 4-way traffic light controller using **Verilog HDL** and **Xilinx Vivado**. The system controls traffic lights for **North**, **South**, **East**, and **West** directions using a **Finite State Machine (FSM)**. The project is simulated with behavioral and structural analysis in Vivado, and the results are validated using waveform outputs and schematic visualizations.

---

## 🧠 Project Summary

-  **Design Type:** FSM-based traffic light controller  
-  **Platform:** Xilinx Vivado  
-  **Hardware Target:** Artix-7 FPGA  
-  **HDL:** Verilog  
-  **Simulation:** Behavioral + RTL + Synthesis schematic  

---

##  Simulation & Analysis Results

- **Behavioral Simulation:** Verifies light status (Green, Yellow, Red) for each direction using decimal outputs (`2`, `1`, `4`).
- **RTL View:** Displays the module structure and connections.
- **Device View:** Shows logic resource usage on the FPGA fabric.
- **Post-Synthesis Schematic:** Validates the final logic implementation.

---

##  System Behavior

- Only **one direction** is green at a time.
- Each green light is followed by **yellow**, then transitions to the next direction.
- Light encoding:
  - Green = `2`
  - Yellow = `1`
  - Red = `4`

- Clock frequency: 100 MHz  
- Green duration: 10,000,000 cycles  
- Yellow duration: 3,000,000 cycles  

---

##  Project Report

A detailed project report (`traffic_light_report.docx`) is included. It covers:
- Introduction to Verilog and Vivado  
- FSM state design  
- Simulation setup  
- Waveform analysis  
- RTL & schematic views  
- Conclusion and future improvements  

---

##  How to Run

1. Open **Xilinx Vivado**  
2. Create a new project  
3. Add the Verilog source files (`traffic_light_controller.v`, `traffic_tb.v`)  
4. Run simulation using the testbench  
5. Analyze waveforms and design schematics
