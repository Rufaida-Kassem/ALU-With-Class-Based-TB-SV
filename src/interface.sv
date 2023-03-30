`ifndef INTERFACE_ALU
`define INTERFACE_ALU
import alu_pkg::*;
// this is interface of the alu module
// it is used to connect the alu_top module to the classes

interface interface_alu #(parameter DATA_WIDTH = 8, localparam OUT_WIDTH = DATA_WIDTH * 2);
    logic [DATA_WIDTH-1:0] a;
    logic [DATA_WIDTH-1:0] b;
    logic [alu_pkg::OP_WIDTH-1:0] op;
    logic [OUT_WIDTH-1:0] out;
endinterface //interface_alu
`endif