`ifndef MONITOR_ALU
`define MONITOR_ALU
`include "score_board.sv"

// monitor class
class monitor_alu;
    virtual interface_alu vif;
    transaction_alu trans_a;
    score_board_alu sb_a;
    function new(virtual interface_alu vif, score_board_alu sb_a);
        this.vif = vif;
        this.sb_a = sb_a;
    endfunction //new()

    // monitor task
    task monitor();
        while (1) begin
            #10
            trans_a = new();
            trans_a.a = vif.a;
            trans_a.b = vif.b;
            trans_a.op = vif.op;
            trans_a.out = vif.out;
            sb_a.post_input(trans_a);
        end
    endtask //monitor()
endclass //monitor_alu

`endif