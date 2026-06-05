module imm_gen_tb;

logic [31:0] instr;
logic [31:0] imm;

imm_gen dut (
    .instr(instr),
    .imm(imm)
);

task check;
    input [31:0] expected;
    input string test_name;
    begin
        #1;
        if (imm == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h",
                     test_name, expected, imm);
    end
endtask

initial begin

    // addi x5, x1, 10
    instr = 32'h00A08293;
    check(32'd10, "I-type addi immediate");

    // lw x5, 4(x1)
    instr = 32'h0040A283;
    check(32'd4, "I-type lw immediate");

    // sw x5, 8(x1)
    instr = 32'h0050A423;
    check(32'd8, "S-type sw immediate");

    // addi x5, x1, -1
    instr = 32'hFFF08293;
    check(32'hFFFF_FFFF, "I-type negative immediate");

    $finish;
end

endmodule