module regfile_tb;

logic        clk;
logic        we;
logic [4:0]  rs1;
logic [4:0]  rs2;
logic [4:0]  rd;
logic [31:0] wd;
logic [31:0] rd1;
logic [31:0] rd2;

regfile dut (
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

always #5 clk = ~clk;

task check;
    input [31:0] expected;
    input [31:0] actual;
    input string test_name;
    begin
        if (actual == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h", test_name, expected, actual);
    end
endtask

initial begin
    clk = 0;
    we  = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    wd  = 0;

    // write 0x12345678 to x5
    we = 1;
    rd = 5'd5;
    wd = 32'h1234_5678;
    #10;

    // read x5 from rs1
    we = 0;
    rs1 = 5'd5;
    #1;
    check(32'h1234_5678, rd1, "Read x5");

    // write 0xAAAA5555 to x10
    we = 1;
    rd = 5'd10;
    wd = 32'hAAAA_5555;
    #10;

    // read x5 and x10 at same time
    we = 0;
    rs1 = 5'd5;
    rs2 = 5'd10;
    #1;
    check(32'h1234_5678, rd1, "Read port 1 x5");
    check(32'hAAAA_5555, rd2, "Read port 2 x10");

    // try writing to x0
    we = 1;
    rd = 5'd0;
    wd = 32'hFFFF_FFFF;
    #10;

    // x0 must remain zero
    we = 0;
    rs1 = 5'd0;
    #1;
    check(32'd0, rd1, "x0 always zero");

    // write disabled test
    we = 0;
    rd = 5'd7;
    wd = 32'hDEAD_BEEF;
    #10;

    rs1 = 5'd7;
    #1;
    check(32'd0, rd1, "Write disabled");

    $finish;
end

endmodule