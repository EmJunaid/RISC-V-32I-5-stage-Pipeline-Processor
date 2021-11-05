# RISC-V-32I-Pipelined-Processor
5 stage pipeline implementation of RISC-V 32I Processor.

In this repository I have implemented 5 stage Pipelined processor which is actually the conversion of my previous single cycle implementation of processor into pipeline.
Link to Previous single cycle implementation is given as: https://github.com/EmJunaid/RiscV-Single-Cycle-Processor.git

In case of pipeline implementation what we do is that we divide our instruction into multiple stages and in case of 5 stage pipeline implementation we will offcourse divide the instruction into 5 different stages. Five different stages are given as:
- Instruction Fetch
- Instruction Decode
- Instruction Execution
- Memory Read/Write
- Write Back

# Implementation
Implementation of pipeline is such that we will add four registers in between the complete datapath and these registers are responsible to keep track of instructions or diiferent parts of instructions which is needed by differet modules. Basically we need to propagate our instructions into all five stages so that our instructions can execute properly and these intermediate four registers are responsible to propagate corresponding instructions or diiferent parts of instructions accordindgly. The datapath which have been followed is given below and it's just the extended version of same single cycle implemted datapath as I have metioned above.  

