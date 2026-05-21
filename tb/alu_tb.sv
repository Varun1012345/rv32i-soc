module alu_tb;

logic [31:0] a;
logic [31:0] b;
logic [3:0] alu_op;
logic [31:0] result;
alu dut (
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result)
);
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    a = 32'd10;
    b = 32'd5;
    alu_op = 4'b0000;   // ADD
    #10;

    a = 32'd10;
    b = 32'd5;
    alu_op = 4'b0001;   // SUB
    #10;

    a = 32'hF0F0_F0F0;
    b = 32'h0F0F_0F0F;
    alu_op = 4'b0010;   // AND
    #10;

    a = 32'hF0F0_F0F0;
    b = 32'h0F0F_0F0F;
    alu_op = 4'b0011;   // OR
    #10;

    a = 32'hAAAA_5555;
    b = 32'hFFFF_0000;
    alu_op = 4'b0100;   // XOR
    #10;

    $finish;
end

endmodule