`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:38:48 AM
// Design Name: 
// Module Name: mux4to1_16
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


module mux4to1_16(
    input [15:0] D0,D1,D2,D3,
    input [1:0] S,
    output reg [15:0] Y
);

always @(*) begin
    case(S)
        2'b00: Y=D0;
        2'b01: Y=D1;
        2'b10: Y=D2;
        2'b11: Y=D3;
    endcase
end

endmodule
