// the ALU module
// a, b: input data
// op: select the operation
// out: output data
package alu_pkg;
localparam OP_WIDTH=4;
typedef enum logic[OP_WIDTH-1:0] {NOP,ADD,SUB,MUL,DIV,SL,SR,AND,OR,NOT,XOR}
opt_t;
endpackage
module alu
#( parameter DATA_WIDTH = 8,localparam OUT_WIDTH = DATA_WIDTH * 2)
(
input wire logic [DATA_WIDTH-1:0]
a,
input wire logic [DATA_WIDTH-1:0]
b,
input wire logic [alu_pkg::OP_WIDTH-1:0] op,
output logic [OUT_WIDTH-1:0]
out
);

// alu operations

always_comb begin
case (op)
alu_pkg::NOP: out = 0;  // no operation
alu_pkg::ADD: out = a + b;  // add
alu_pkg::SUB: out = a - b;  // subtract
alu_pkg::MUL: out = a * b;  // multiply
alu_pkg::DIV: out = a / b;  // divide
alu_pkg::SL: out = a << 1;  // shift left
alu_pkg::SR: out = a >> 1;  // shift right
alu_pkg::AND: out = a & b;  // and
alu_pkg::OR: out = a | b;   // or
alu_pkg::NOT: out = ~a;    // not
alu_pkg::XOR: out = a ^ b;  // xor
endcase
end
endmodule
