### Summary, 4-Bit-CLA 
VLSI (EC2.201) Project for Monsoon 2024.
## Function
Adds 2 4-Bit Numbers and gives corresponding output. 
Pre-Layout schematics are tested using ngspice, Post-Layout build and extraction is done using MAGIC.
Design Analysis/Synthesis was done using Verilog, GTKWave and Vivado.
## Installation Guide
Recommended to install on Linux. Run the following commands in terminal (if not installed yet):
```bash
sudo apt-get install iverilog​
sudo apt-get install gtkwave
sudo apt-get install ngspice
sudo apt-get install magic
```

## Usage
The logical veracity of gates/modules can be tested by changing the *Input Pulses* present in each netlist. 

For opening MAGIC layouts, open the 'tech manager' setting and change the technology file to SCN6M_DEEP.09.tech27.
To extract parasitic capacitances, run the following commands in the MAGIC terminal after labelling nodes appropriately (ensure I/O port names match with those used in your netlist).
```bash
extract all
ext2spice -C f
```
Copy paste the parasitics file into corresponding circuit netlists to account for post layout parasitics analysis. 
Keep in mind that some terms (such as CMOS and NMOS names) may need to be updated in the spice file.
