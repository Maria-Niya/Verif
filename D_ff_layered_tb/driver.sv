`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 21:16:53
// Design Name: 
// Module Name: driver
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


class driver;
  virtual intf vir;
  mailbox mailbox1;
  int count;
  function new(virtual intf vir, mailbox mailbox1);
    this.vir = vir;
    this.mailbox1 = mailbox1;
  endfunction
  task main;
    repeat(count) begin
      transaction trans;
      mailbox1.get(trans);
      @(negedge vir.clk);
      vir.d     = trans.d;
      vir.reset = trans.reset;
      trans.display("driver");
    end
  endtask
endclass
