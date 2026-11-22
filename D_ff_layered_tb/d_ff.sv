`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 20:29:50
// Design Name: 
// Module Name: d_ff
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


module d_ff(d, q, qbar, clk, reset);
input logic d,clk,reset;
output logic q, qbar;
always_ff @(posedge clk)
 begin
  if (reset)
   q<=1'b0;
  else
   q<=d;
 end 
 assign qbar = ~q;
endmodule
