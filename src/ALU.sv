// the ALU module
// in1, in2: input data
// sel: select the operation
// out: output data
package alu_pkg;
localparam SELSIZE=4;
typedef enum logic[SELSIZE-1:0] {NOP,ADD,SUB,MUL,DIV,SL,SR,AND,OR,NOT,XOR}
opt_t;
endpackage
module alu
#(
parameter DATASIZE=8
,localparam OUTSIZE = DATASIZE * 2
)
(
input wire logic [DATASIZE-1:0]
in1,
input wire logic [DATASIZE-1:0]
in2,
input wire logic [alu_pkg::SELSIZE-1:0] sel,
output wire logic [OUTSIZE-1:0]
out
);

// local variables


// alu operations

always_comb begin
case (sel)
alu_pkg::NOP: out = 0;  // no operation
alu_pkg::ADD: out = in1 + in2;  // add
alu_pkg::SUB: out = in1 - in2;  // subtract
alu_pkg::MUL: out = in1 * in2;  // multiply
alu_pkg::DIV: out = in1 / in2;  // divide
alu_pkg::SL: out = in1 << 1;  // shift left
alu_pkg::SR: out = in1 >> 1;  // shift right
alu_pkg::AND: out = in1 & in2;  // and
alu_pkg::OR: out = in1 | in2;   // or
alu_pkg::NOT: out = ~in1;    // not
alu_pkg::XOR: out = in1 ^ in2;  // xor
endcase
end