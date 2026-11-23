`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 20:40:58
// Design Name: 
// Module Name: transaction
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


class transaction;
  rand bit d;
  rand bit reset;
  bit q;
  bit qbar;
  constraint reset_c { reset dist {1 := 5, 0 := 95}; }

  function void display(string name);
    $display("[%s] t=%0t d=%b reset=%b q=%b qbar=%b", name, $time, d, reset, q, qbar);
  endfunction
endclass
