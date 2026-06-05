module control_unit_tb;

logic [6:0] opcode;
logic reg_write, mem_write, alu_src, mem_to_reg, branch;
logic [1:0] alu_op;

control_unit dut (
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .mem_to_reg(mem_to_reg),
    .branch(branch),
    .alu_op(alu_op)
);

initial begin

    opcode = 7'b0110011; #1; // R-type
    if (reg_write && !alu_src && alu_op == 2'b10)
        $display("R-type PASS");
    else
        $display("R-type FAIL");

    opcode = 7'b0010011; #1; // I-type addi
    if (reg_write && alu_src && alu_op == 2'b10)
        $display("I-type PASS");
    else
        $display("I-type FAIL");

    opcode = 7'b0000011; #1; // Load
    if (reg_write && alu_src && mem_to_reg && alu_op == 2'b00)
        $display("Load PASS");
    else
        $display("Load FAIL");

    opcode = 7'b0100011; #1; // Store
    if (mem_write && alu_src && alu_op == 2'b00)
        $display("Store PASS");
    else
        $display("Store FAIL");

    opcode = 7'b1100011; #1; // Branch
    if (branch && alu_op == 2'b01)
        $display("Branch PASS");
    else
        $display("Branch FAIL");

    $finish;
end

endmodule