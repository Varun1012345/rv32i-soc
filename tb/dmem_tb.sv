module dmem_tb;

logic        clk;
logic        mem_write;
logic [31:0] addr;
logic [31:0] write_data;
logic [31:0] read_data;

dmem dut (
    .clk(clk),
    .mem_write(mem_write),
    .addr(addr),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

task check;
    input [31:0] expected;
    input string test_name;
    begin
        #1;
        if (read_data == expected)
            $display("%s PASS", test_name);
        else
            $display("%s FAIL: expected=%h got=%h",
                     test_name, expected, read_data);
    end
endtask

initial begin
    clk = 0;
    mem_write = 0;
    addr = 0;
    write_data = 0;

    // write to address 0
    addr = 32'd0;
    write_data = 32'h1234_5678;
    mem_write = 1;
    #10;

    // read from address 0
    mem_write = 0;
    addr = 32'd0;
    check(32'h1234_5678, "Read address 0");

    // write to address 4
    addr = 32'd4;
    write_data = 32'hAAAA_5555;
    mem_write = 1;
    #10;

    // read from address 4
    mem_write = 0;
    addr = 32'd4;
    check(32'hAAAA_5555, "Read address 4");

    $finish;
end

endmodule