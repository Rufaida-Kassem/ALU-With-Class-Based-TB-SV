`ifndef TRANSACTIONS
`define TRANSACTIONS

// import the alu package from alu.sv
import alu_pkg::*;

// transactions class
    class transaction_alu #(parameter int DATA_WIDTH = 8, parameter OUT_WIDTH = DATA_WIDTH * 2);
        rand bit [DATA_WIDTH-1:0] a;
        rand bit [DATA_WIDTH-1:0] b;
        rand bit [alu_pkg::OP_WIDTH-1:0] op;
        bit [OUT_WIDTH-1:0] out;
        // constraint on the random value of op
        constraint op_c {op inside {[0:10]};}

    endclass //transaction_alu
`endif