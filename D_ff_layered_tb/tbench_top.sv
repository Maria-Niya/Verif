`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2026 13:50:59
// Design Name: 
// Module Name: tbench_top
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


`include "interface.sv"
`include "test.sv"

module tbench_top;
  bit clk;
  always #5 clk = ~clk;
  intf i_intf(clk);
  test t1(i_intf);

  d_ff dut (.d(i_intf.d),
    .q (i_intf.q),
    .qbar (i_intf.qbar),
    .clk (i_intf.clk),
    .reset(i_intf.reset));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
