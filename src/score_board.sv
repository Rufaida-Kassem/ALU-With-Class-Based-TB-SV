`ifndef SCORE_BOARD_ALU
`define SCORE_BOARD_ALU
`include "transactions.sv"
import alu_pkg::*;
// score board class
    class score_board_alu;
        // define output.txt as an output file
        int output_file;
        // declare a static counter to count the number of transactions
        static int counter = 0;
        function new();
            output_file = $fopen("..\\output\\output.txt", "w");
            if (output_file == 0)
                $error("Unable to open output.txt");
        endfunction

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

        // increment the counter
        counter = counter + 1;
    // if the output file is open
    if (counter <= 100)
    begin
        // compare the expected output expected_out with the actual output from the trans_a.out and display the result
        if (expected_out == trans_a.out)
            // write the result to output_file
            $fwrite(output_file, "TEST CASE no %0h PASSED:\n--> inputs: %0h, %0h,\toperation_code: %0h,\tEXPECTED OUTPUT: \
            %0h\tEQUALES\toutput %0h\n", counter, trans_a.a, trans_a.b, trans_a.op, expected_out, trans_a.out);
        else 
            $fwrite(output_file, "!!:::ERROR IN ALU:::!! TEST CASE no %0h FAILED:\n--> inputs: %0h, %0h,\toperation_code: %0h,\tEXPECTED OUTPUT: \
            %0h\twhile output is %0h\n", counter, trans_a.a, trans_a.b, trans_a.op, expected_out, trans_a.out);

        // close the output file if the counter reaches 100
        if (counter == 100)
            close_file();
    end
    endtask // post_input
    function void close_file();
        $fclose(output_file);
    endfunction // close_file

    endclass // score_board_alu
`endif