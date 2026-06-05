module adder_tb;

logic [31:0] a, b;
logic [31:0] sum;

adder dut (
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin
    a = 32'd0; b = 32'd4; #1;
    if (sum == 32'd4) $display("PC+4 PASS");
    else $display("PC+4 FAIL");

    a = 32'd8; b = 32'd4; #1;
    if (sum == 32'd12) $display("8+4 PASS");
    else $display("8+4 FAIL");

    a = 32'd100; b = 32'd20; #1;
    if (sum == 32'd120) $display("100+20 PASS");
    else $display("100+20 FAIL");

    $finish;
end

endmodule