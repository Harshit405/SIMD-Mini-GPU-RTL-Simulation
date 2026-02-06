module simd_core (
    input  wire [1:0] opcode,

    input  wire [7:0] a0, b0,
    input  wire [7:0] a1, b1,
    input  wire [7:0] a2, b2,
    input  wire [7:0] a3, b3,

    output wire [15:0] r0,
    output wire [15:0] r1,
    output wire [15:0] r2,
    output wire [15:0] r3
);

pe pe0 (.a(a0), .b(b0), .opcode(opcode), .result(r0));
pe pe1 (.a(a1), .b(b1), .opcode(opcode), .result(r1));
pe pe2 (.a(a2), .b(b2), .opcode(opcode), .result(r2));
pe pe3 (.a(a3), .b(b3), .opcode(opcode), .result(r3));

endmodule
