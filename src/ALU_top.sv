`include "driver.sv"
`include "score_board.sv"
`include "monitor.sv"
module top_alu (interface_alu infc);
    driver_alu driver_a;
    monitor_alu monitor_a;
    score_board_alu score_board_a;

    initial begin
        driver_a = new(infc);
        monitor_a = new(infc);
        score_board_a = new();
        fork
        monitor_a.monitor();
        driver_a.driver();
        join_none
    end
endmodule