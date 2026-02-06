`timescale 1ns/1ps

module simd_tb;

reg [1:0] opcode;
reg [7:0] a0,b0,a1,b1,a2,b2,a3,b3;
wire [15:0] r0,r1,r2,r3;

simd_core dut (
    .opcode(opcode),

    .a0(a0), .b0(b0),
    .a1(a1), .b1(b1),
    .a2(a2), .b2(b2),
    .a3(a3), .b3(b3),

    .r0(r0),
    .r1(r1),
    .r2(r2),
    .r3(r3)
);

initial begin
    // ---------- ADD ----------
    opcode = 2'b00;
    a0=5;  b0=2;
    a1=10; b1=3;
    a2=7;  b2=1;
    a3=8;  b3=4;
    #10;

    // ---------- MUL ----------
    opcode = 2'b10;
    #10;

    // ---------- SUB ----------
    opcode = 2'b01;
    #10;

    $stop;
end

endmodule
