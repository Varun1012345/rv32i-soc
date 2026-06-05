module imem_tb;

logic [31:0] addr;
logic [31:0] instr;

imem dut (
    .addr(addr),
    .instr(instr)
);

task check;
    input [31:0] expected;
    input string test_name;
    begin
        #1;
        if (instr == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h",
                     test_name, expected, instr);
    end
endtask

initial begin

    addr = 32'd0;
    check(32'h002082B3, "Instruction 0");

    addr = 32'd4;
    check(32'h40318333, "Instruction 1");

    addr = 32'd8;
    check(32'h00502023, "Instruction 2");

    addr = 32'd12;
    check(32'h00000063, "Instruction 3");

    $finish;
end

endmodule