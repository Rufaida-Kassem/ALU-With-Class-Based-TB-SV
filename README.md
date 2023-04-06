# ALU-With-Class-Based-TB-SV
A verification environment for an ALU using class-based testbench in `Systemverilog`
The focus is on the *verification environment*

#### Supported ALU operations:
- NOP (0)
- ADD (1)
- SUB (2)
- MUL (3)
- DIV (4)
- SL  (5)
- SR  (6)
- AND (7)
- OR  (8)
- NOT (9)
- XOR (a)

![image](https://user-images.githubusercontent.com/68002137/228682038-42de6d50-ec8f-4082-950b-a1286ccc121a.png)

We have 
- `ALU`, `ALU testbench`, `ALU top` modules.
- `monitor`, `score board`, `transactions`, `driver` classes.
- `alu interface` interface.

### Note: all numbers in output file are in hexa-decimal format

#### Number of test cases here are 100, you can change the repeat(100) in driver.sv
#### and change the "counter = 100" in score_board.sv
