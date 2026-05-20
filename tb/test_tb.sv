module test_tb;

logic a, b;
logic y;

test dut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test_tb);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule