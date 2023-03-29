`include "transactions.sv"
`include "score_board.sv"
`ifndef DRIVER
`define DRIVER

// create driver class
    class driver_alu;
        transaction_all trans_alu;
        virtual interface_alu vif;

        function new(virtual interface_alu vif);
            this.vif = vif;

        endfunction //new()

        // drive the inputs task
            task driver();
                trans_alu = new();
                repeat(100) begin
                    #10
                    trans_alu.randomize();
                    vif.a <= trans_alu.a;


                    $display("A = %d, C = %d, ALU_FUN = %d",vif.a, vif.b, vif.op);
                end
    endclass //driver_alu