module mux2_tb;

logic [31:0] in0, in1;
logic sel;
logic [31:0] out;

mux2 dut (
    .in0(in0),
    .in1(in1),
    .sel(sel),
    .out(out)
);

initial begin
    in0 = 32'hAAAA_AAAA;
    in1 = 32'h5555_5555;

    sel = 0; #1;
    if (out == in0) $display("MUX sel=0 PASS");
    else $display("MUX sel=0 FAIL");

    sel = 1; #1;
    if (out == in1) $display("MUX sel=1 PASS");
    else $display("MUX sel=1 FAIL");

    $finish;
end

endmodule