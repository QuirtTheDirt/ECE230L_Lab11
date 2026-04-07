

module tff(
    input T,
    input clk,
    input rst,
    output Q,
    output Qn
);

    wire d_in;
    wire qInternal;
    wire qnInternal;

    assign d_in = T ^ qInternal;

    dff dff_inst (
        .D(d_in),
        .clk(clk),
        .rst(rst),
        .Q(qInternal),
        .Qn(qnInternal)
    );

    assign Q = qInternal;
    assign Qn = qnInternal;

endmodule
