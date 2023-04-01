`ifndef SCORE_BOARD_ALU
`define SCORE_BOARD_ALU
`include "transactions.sv"
import alu_pkg::*;
// score board class
    class score_board_alu;
        task post_input(transaction_alu trans_a);
        logic [15:0] expected_out;
        // case statement to check alu operations
        case (trans_a.op)
        alu_pkg::NOP:
            expected_out = 16'b0;
        alu_pkg::ADD:
            expected_out = trans_a.a + trans_a.b;
        alu_pkg::SUB:
            expected_out = trans_a.a - trans_a.b;
        alu_pkg::AND:
            expected_out = trans_a.a & trans_a.b;
        alu_pkg::OR:
            expected_out = trans_a.a | trans_a.b;
        alu_pkg::XOR:
            expected_out = trans_a.a ^ trans_a.b;
        alu_pkg::MUL:
            expected_out = trans_a.a * trans_a.b;
        alu_pkg::DIV:
            begin
                if (trans_a.b == 'b0)
                    $error("Division by zero");
                else
                    expected_out = trans_a.a / trans_a.b;
                end
        alu_pkg::SL:
            expected_out = trans_a.a << 1;
        alu_pkg::SR:
            expected_out = trans_a.a >> 1;
        alu_pkg::NOT:
            expected_out = ~trans_a.a;   
        default:
            expected_out = 16'b0;
        endcase

    // compare the expected output expected_out with the actual output from the trans_a.out and display the result
    if (expected_out == trans_a.out)
        $display("TEST CASE PASSED: %0h, %0h, EXPECTED OUTPUT: \
                %0h EQUALES output %0h", trans_a.a, trans_a.b, expected_out, trans_a.out);
    else 
        $display("ERROR IN ALU: %0h, %0h, %0h, EXPECTED OUTPUT: \
        %0h while output is %0h", trans_a.a, trans_a.b,trans_a.op, expected_out, trans_a.out);
    endtask // post_input

    endclass // score_board_alu
`endif