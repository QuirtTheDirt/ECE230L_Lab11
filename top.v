module top(
    input btnC,
    input btnU,
    output [6:0] led
);


    wire rc0, rc1, rc2;
    wire rc0n, rc1n, rc2n;


    wire [2:0] mc_q;
    wire [2:0] mc_qn;
    wire mc_out_q;
    wire mc_out_qn;

    wire [2:0] sum;
    wire c1, c2, c3;

    wire is_five;
    wire [2:0] mc_next;
    wire mc_out_next;


    tff tff0 (
        .T(1'b1),
        .clk(btnC),
        .rst(btnU),
        .Q(rc0),
        .Qn(rc0n)
    );

    tff tff1 (
        .T(1'b1),
        .clk(rc0),
        .rst(btnU),
        .Q(rc1),
        .Qn(rc1n)
    );

    tff tff2 (
        .T(1'b1),
        .clk(rc1),
        .rst(btnU),
        .Q(rc2),
        .Qn(rc2n)
    );


    full_adder fa0 (
        .A(mc_q[0]),
        .B(1'b1),
        .Cin(1'b0),
        .Y(sum[0]),
        .Cout(c1)
    );

    full_adder fa1 (
        .A(mc_q[1]),
        .B(1'b0),
        .Cin(c1),
        .Y(sum[1]),
        .Cout(c2)
    );

    full_adder fa2 (
        .A(mc_q[2]),
        .B(1'b0),
        .Cin(c2),
        .Y(sum[2]),
        .Cout(c3)
    );


    assign is_five = mc_q[2] & ~mc_q[1] & mc_q[0];


    assign mc_next[0] = is_five ? 1'b0 : sum[0];
    assign mc_next[1] = is_five ? 1'b0 : sum[1];
    assign mc_next[2] = is_five ? 1'b0 : sum[2];


    assign mc_out_next = is_five ? ~mc_out_q : mc_out_q;


    dff dff0 (
        .D(mc_next[0]),
        .clk(btnC),
        .rst(btnU),
        .Q(mc_q[0]),
        .Qn(mc_qn[0])
    );

    dff dff1 (
        .D(mc_next[1]),
        .clk(btnC),
        .rst(btnU),
        .Q(mc_q[1]),
        .Qn(mc_qn[1])
    );

    dff dff2 (
        .D(mc_next[2]),
        .clk(btnC),
        .rst(btnU),
        .Q(mc_q[2]),
        .Qn(mc_qn[2])
    );

    dff dff3 (
        .D(mc_out_next),
        .clk(btnC),
        .rst(btnU),
        .Q(mc_out_q),
        .Qn(mc_out_qn)
    );

    assign led[0] = rc0;
    assign led[1] = rc1;
    assign led[2] = rc2;

    assign led[3] = mc_q[0];
    assign led[4] = mc_q[1];
    assign led[5] = mc_q[2];
    assign led[6] = mc_out_q;

endmodule

