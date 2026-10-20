`timescale 1ns / 1ps
// Added for repository packaging. Independent widened arithmetic checks overflow.
module alu16_tb;
    reg signed [15:0] A, B;
    reg [1:0] Op;
    wire [15:0] Result;
    wire Overflow;
    integer checks = 0;
    integer i, j, k;
    reg [15:0] edges [0:7];
    reg [31:0] rng = 32'h16A1BEEF;
    reg [15:0] random_a, random_b;
    alu16 dut (.A(A), .B(B), .Op(Op), .Result(Result), .Overflow(Overflow));

    task check;
        input [15:0] a_value, b_value;
        input [1:0] operation;
        reg signed [16:0] wide;
        reg [15:0] expected;
        reg expected_overflow;
        begin
            A = a_value; B = b_value; Op = operation;
            expected_overflow = 0;
            wide = 0;
            case (operation)
                0: wide = $signed({a_value[15], a_value}) + $signed({b_value[15], b_value});
                1: wide = $signed({a_value[15], a_value}) - $signed({b_value[15], b_value});
                2: expected = a_value & b_value;
                3: expected = a_value ^ b_value;
            endcase
            if (operation < 2) begin
                expected = wide[15:0];
                expected_overflow = (wide > 17'sd32767) || (wide < -17'sd32768);
            end
            #1;
            if (Result !== expected || Overflow !== expected_overflow) begin
                $display("FAIL A=%h B=%h Op=%b Result=%h expected=%h Overflow=%b expected=%b",
                    A, B, Op, Result, expected, Overflow, expected_overflow);
                $fatal(1, "ALU mismatch");
            end
            checks = checks + 1;
        end
    endtask

    // Fixed xorshift32 sequence makes random coverage reproducible.
    task next_random;
        begin
            rng = rng ^ (rng << 13);
            rng = rng ^ (rng >> 17);
            rng = rng ^ (rng << 5);
        end
    endtask

    initial begin
        edges[0]=16'h0000; edges[1]=16'h0001; edges[2]=16'hffff; edges[3]=16'h7fff;
        edges[4]=16'h8000; edges[5]=16'h8001; edges[6]=16'haaaa; edges[7]=16'h5555;
        for (i=0; i<8; i=i+1)
            for (j=0; j<8; j=j+1)
                for (k=0; k<4; k=k+1) check(edges[i], edges[j], k);
        for (i=0; i<1000; i=i+1) begin
            next_random; random_a = rng[15:0];
            next_random; random_b = rng[15:0];
            for (k=0; k<4; k=k+1) check(random_a, random_b, k);
        end
        $display("PASS: %0d ALU checks", checks);
        $finish;
    end
endmodule
