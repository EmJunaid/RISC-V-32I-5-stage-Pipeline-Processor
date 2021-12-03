# RISC-V-32I-5-stage-Pipelined-Processor
5 stage pipeline implementation of RISC-V 32I Processor.

In this repository I have implemented 5 stage Pipelined processor which is actually the conversion of my previous single cycle implementation of processor into pipeline.
Link to Previous single cycle implementation is given as: https://github.com/EmJunaid/RiscV-Single-Cycle-Processor.git.

In case of pipelined implementation what we do is that we divide our instruction into multiple stages and in case of 5 stage pipelined implementation we will offcourse divide the instruction into 5 different stages. Five different stages are given as:
- Instruction Fetch
- Instruction Decode
- Instruction Execution
- Memory Read/Write
- Write Back

This pipelined implementation of processor supports six basic instructions:
- R-Type
- I-Type
- S-Type
- B-Type
- J-Type
- U-Type

Just to mention here that in case of pipelined Implementation we face a problem know as hazards. And in this implementation I have also taken care of that and hazard unit is implemented to handle all types of hazards (Data and Control Hazards).

# Implementation
Implementation is such that we will add four registers in between the complete datapath and these registers are responsible to keep track of instructions or diiferent parts of instructions which is needed by differet modules. Basically we need to propagate our instructions into all five stages so that our instructions can execute properly and these intermediate four registers are responsible to propagate corresponding instructions or diiferent parts of instructions accordindgly. The datapath which have been followed is given below and it's just the extended version of same single cycle implemted datapath as I have metioned above.  

![Screenshot (177)](https://user-images.githubusercontent.com/93525537/142857413-25d2e95d-9e7f-4c11-bea5-3d4780df8b09.png)

# Source Codes:
Source codes of all different modules are provided in the folder named as source_codes. Basic Modules and their short description is given as:
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

- Hazart Unit:

In order to resolve different types of hazards(data and control) we need to implement a hazard unit which is keeping track of different hazards and when any hazard occurs, appropraite action is taken by this unit. 
- Main:

This module is simply a top level module where I'm calling all above mentioned modules in order to join them so that they can be bring into working.
# Note:

I have not mention some simple modules above which are present in source_code folder such as muxes but they are being used.

# Test Bench
In order to test above implemented pipelined processor I have written a test bench which is available in the test bench folder. I have used a code which basically is a very simple code but it checks all data hazards and in test bench I have declared outputs accordingly (But you can also use scope to check I/O of any module and this option is available in vivado simulation). And even if you want to declare some outputs in order to check your own code, you just need to declare that varible as output in test bench and similarly declare that variable as output in main.v file and remove it from below where it has been declare as wire(if its defined prevoiusly as wire).

# Simulation and Results:
Simulation is done using Vivado and the test code which have been used and it's simulation result as provided in Test_Code_and_Simulation_Result folder. Just to show some outputs in simulation, some files include some extra variables(I/O) but you can simply comment out or remove those variables for general use. The working is verified by below provided simulation result:

![Screenshot (178)](https://user-images.githubusercontent.com/93525537/142864319-9a452ce4-e340-4576-ad35-4d6f647436ff.png)

# References:
Part of this material and understanding is taken from book " Digital Design and Computer Architecture RISC-V Edition " by Sarah L Harris and David M Harris.








