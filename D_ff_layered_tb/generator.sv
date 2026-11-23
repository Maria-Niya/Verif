`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 20:51:32
// Design Name: 
// Module Name: generator
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


class generator;
  mailbox mailbox1;
  int count;
  function new(mailbox mailbox1);
    this.mailbox1 = mailbox1;
  endfunction
  task main();
    repeat(count) begin
      transaction trans = new();
      if (!trans.randomize()) $error("randomize failed");
      trans.display("generator");
      mailbox1.put(trans);
    end
  endtask
endclass
