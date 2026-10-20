`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:30:00 AM
// Design Name: 
// Module Name: alu16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu16(
    input signed [15:0] A,
    input signed [15:0] B,
    input [1:0] Op,
    output [15:0] Result,
    output Overflow
);

wire [15:0] add_out;
wire [15:0] sub_out;
wire [15:0] and_out;
wire [15:0] xor_out;

wire ov_add;
wire ov_sub;

adder16 U1(
    .A(A),
    .B(B),
    .Y(add_out),
    .Overflow(ov_add)
);

subtractor16 U2(
    .A(A),
    .B(B),
    .Y(sub_out),
    .Overflow(ov_sub)
);

and16 U3(
    .A(A),
    .B(B),
    .Y(and_out)
);

xor16 U4(
    .A(A),
    .B(B),
    .Y(xor_out)
);

mux4to1_16 U5(
    .D0(add_out),
    .D1(sub_out),
    .D2(and_out),
    .D3(xor_out),
    .S(Op),
    .Y(Result)
);

assign Overflow = (Op==2'b00)?ov_add:
                  (Op==2'b01)?ov_sub:0;

endmodule
