# RISC-V-32I-Pipelined-Processor
5 stage pipeline implementation of RISC-V 32I Processor.

In this repository I have implemented 5 stage Pipelined processor which is actually the conversion of my previous single cycle implementation of processor into pipeline.
Link to Previous single cycle implementation is given as: https://github.com/EmJunaid/RiscV-Single-Cycle-Processor.git.

In case of pipeline implementation what we do is that we divide our instruction into multiple stages and in case of 5 stage pipeline implementation we will offcourse divide the instruction into 5 different stages. Five different stages are given as:
- Instruction Fetch
- Instruction Decode
- Instruction Execution
- Memory Read/Write
- Write Back

This pipeline implementation of processor supports six basic instructions:
- R-Type
- I-Type
- S-Type
- B-Type
- J-Type
- U-Type

Just to mention here that in case of pipeline Implementation we face a problem know as hazards. Uptill now I have implemented the processor which can't handle hazards.
But I'm also working on that part so as soon as that part will get completed I will also share that part as well.
As hazard unit is not implemented uptill now, B-Type and J-Type are not supported.

# Implementation
Implementation of pipeline is such that we will add four registers in between the complete datapath and these registers are responsible to keep track of instructions or diiferent parts of instructions which is needed by differet modules. Basically we need to propagate our instructions into all five stages so that our instructions can execute properly and these intermediate four registers are responsible to propagate corresponding instructions or diiferent parts of instructions accordindgly. The datapath which have been followed is given below and it's just the extended version of same single cycle implemted datapath as I have metioned above.  

![Screenshot (145)](https://user-images.githubusercontent.com/93525537/140507957-13360c2d-7322-4911-a261-8cd23206a818.png)

# Source Codes:
Source codes of all different modules are provided in the folder named as source codes. Basic Modules and their short description is given as:
- Adress Generator:

This module is generating adress for the next instruction which needs to be executed. Then this adress will behave as an input to instruction memory and instruction memory outputs that instruction.
- Register File:

This module consist of 32 general purpose registers which are used while doing different sort of computations. This module is same as in case of single cycle but the only difference is that in piprline it's write operation is set at negative edge of clock ( This can help us avoid some types of Data Hazards ).
- Data Memory:

This Module is responsible to store/Provide data. In case of actuall processor behaviour of data memory is much different than this one but just for simplicity we are implemented data memory as array of registers.
- Instruction Memory:

This module is responsible to store all the instruction of a particular program to be executed.
- Instruction fetch:

This module is breaking down a single instruction into multiple parts which are needed by different modules.
- ALU:

This module is responsible to do different computations.
- Extend:

This module is generating 32 bit immigiate value depending upon the type of instruction.
- Fisrt, Second, Third and Fourth Register:

These modules are behaving as a buffer or bypassing registers which are doing nothing but just passing the inputs as outputs in order to keep track of instructions in different stages of pipeline.
- Controller:

This module is the most critical path of processor which is driving the whole data path. It will produce control signals which are responsible to control the flow of different instructions.
- Main:

This module is simply a top level module where I'm calling all above mentioned modules in order to join them so that they can be bring into working.

# Test Bench
In order to test above implemented pipelined processor I have written a test bench which is available in the test bench folder. Just for simplicity I have not declared any output in that test bench because I have access to check the inputs and outputs of all modules through scope option (Available in vivado simulation). But if you want to declare some outputs in that test bench you can simply declare that varible as output and similarly declare that variable as output in main.v file and remove it from below where it has been declare as wire.

# Simulation and Results:
Simulation is done using Vivado and the test code which have been used and it's simulation result as provided in 







