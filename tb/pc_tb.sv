module pc_tb;

logic        clk;
logic        reset;
logic [31:0] next_pc;
logic [31:0] pc_out;

pc dut (
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

task check;
    input [31:0] expected;
    input string test_name;
    begin
        #1;
        if (pc_out == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h", test_name, expected, pc_out);
    end
endtask

initial begin
    clk = 0;
    reset = 1;
    next_pc = 32'd0;
    #10;
    check(32'd0, "Reset PC");

    reset = 0;

    next_pc = 32'd4;
    #10;
    check(32'd4, "PC = 4");

    next_pc = 32'd8;
    #10;
    check(32'd8, "PC = 8");

    next_pc = 32'd100;
    #10;
    check(32'd100, "Branch/Jump PC");

    reset = 1;
    #10;
    check(32'd0, "Reset again");

    $finish;
end

endmodule