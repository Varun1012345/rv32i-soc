module dmem (
    input  logic        clk,
    input  logic        mem_write,
    input  logic [31:0] addr,
    input  logic [31:0] write_data,
    output logic [31:0] read_data
);

logic [31:0] memory [0:255];

assign read_data = memory[addr[31:2]];

always_ff @(posedge clk) begin
    if (mem_write)
        memory[addr[31:2]] <= write_data;
end

endmodule