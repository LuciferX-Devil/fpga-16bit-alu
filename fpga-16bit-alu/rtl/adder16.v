`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:35:41 AM
// Design Name: 
// Module Name: adder16
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


module adder16(
    input signed [15:0] A,B,
    output signed [15:0] Y,
    output Overflow
);

assign Y = A + B;
assign Overflow = (A[15]==B[15]) && (Y[15]!=A[15]);

endmodule
