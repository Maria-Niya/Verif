`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2026 08:27:07
// Design Name: 
// Module Name: scoreboard
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


class scoreboard;
  mailbox mailbox2;
  int count;
  function new(mailbox mailbox2);
    this.mailbox2 = mailbox2;
  endfunction
  task main;
    repeat(count) begin
      transaction trans;
      bit exp_q;
      mailbox2.get(trans);
      exp_q = trans.reset ? 1'b0 : trans.d; 
      if (trans.q === exp_q && trans.qbar === ~exp_q)
        $display("[scoreboard] PASS");
      else
        $display("[scoreboard] ERROR: exp q=%b, got q=%b qbar=%b", exp_q, trans.q, trans.qbar);
      trans.display("scoreboard");
    end
  endtask
endclass
