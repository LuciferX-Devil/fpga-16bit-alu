`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 04:06:06 AM
// Design Name: 
// Module Name: alu16_tb
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


`timescale 1ns / 1ps

module alu16_demo_tb;

reg signed [15:0] A, B;
reg [1:0] Op;

wire signed [15:0] Result;
wire Overflow;

alu16 uut (
    .A(A),
    .B(B),
    .Op(Op),
    .Result(Result),
    .Overflow(Overflow)
);

initial begin

// Addition
A = 16'd10; B = 16'd5; Op = 2'b00;
#10;

// Subtraction
A = 16'd20; B = 16'd8; Op = 2'b01;
#10;

// AND
A = 16'h00FF; B = 16'h0F0F; Op = 2'b10;
#10;

// XOR
A = 16'hAAAA; B = 16'h5555; Op = 2'b11;
#10;

// Overflow Test
A = 16'd32767;
B = 16'd1;
Op = 2'b00;
#10;

$finish;

end

endmodule
