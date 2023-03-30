// this is the testbench module in the verificaiton environment

module alu_tb ();
    // this is the interface module
    interface_alu infc();    
    // this is the top module
    top_alu top(infc);
    // this is the DUT module
    alu alu_dut
    (
        .a(infc.a),
        .b(infc.b),
        .op(infc.op),
        .out(infc.out)
    );
endmodule