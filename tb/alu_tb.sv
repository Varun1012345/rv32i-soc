module alu_tb;

logic [31:0] a;
logic [31:0] b;
logic [3:0]  alu_op;
logic [31:0] result;

alu dut (
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result)
);

task check;
    input [31:0] expected;
    input string test_name;
    begin
        #1;
        if (result == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h", test_name, expected, result);
    end
endtask

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    a = 32'd10; b = 32'd5; alu_op = 4'b0000; #10;
    check(32'd15, "ADD");

    a = 32'd10; b = 32'd5; alu_op = 4'b0001; #10;
    check(32'd5, "SUB");

    a = 32'hF0F0_F0F0; b = 32'h0F0F_0F0F; alu_op = 4'b0010; #10;
    check(32'h0000_0000, "AND");

    a = 32'hF0F0_F0F0; b = 32'h0F0F_0F0F; alu_op = 4'b0011; #10;
    check(32'hFFFF_FFFF, "OR");

    a = 32'hAAAA_5555; b = 32'hFFFF_0000; alu_op = 4'b0100; #10;
    check(32'h5555_5555, "XOR");

    a = 32'hFFFF_FFFF; b = 32'd1; alu_op = 4'b0101; #10;
    check(32'd1, "SLT signed");

    a = 32'hFFFF_FFFF; b = 32'd1; alu_op = 4'b0110; #10;
    check(32'd0, "SLTU unsigned");

    a = 32'd1; b = 32'd4; alu_op = 4'b0111; #10;
    check(32'd16, "SLL");

    a = 32'h8000_0000; b = 32'd4; alu_op = 4'b1000; #10;
    check(32'h0800_0000, "SRL");

    a = 32'h8000_0000; b = 32'd4; alu_op = 4'b1001; #10;
    check(32'hF800_0000, "SRA");

    $finish;
end

endmodule