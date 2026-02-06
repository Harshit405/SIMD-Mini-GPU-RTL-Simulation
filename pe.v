module pe (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [1:0] opcode,
    output reg  [15:0] result
);

always @(*) begin
    case (opcode)
        2'b00: result = a + b;   // ADD
        2'b01: result = a - b;   // SUB
        2'b10: result = a * b;   // MUL
        default: result = 16'd0;
    endcase
end

endmodule
