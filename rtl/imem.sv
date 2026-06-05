module imem (
    input  logic [31:0] addr,
    output logic [31:0] instr
);

logic [31:0] memory [0:255];

initial begin
    memory[0] = 32'h002082B3; // add x5,x1,x2
    memory[1] = 32'h40318333; // sub x6,x3,x4
    memory[2] = 32'h00502023; // sw x5,0(x0)
    memory[3] = 32'h00000063; // beq placeholder
end

assign instr = memory[addr[31:2]];

endmodule