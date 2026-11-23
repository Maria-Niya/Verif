`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 21:28:05
// Design Name: 
// Module Name: monitor
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


class monitor;
virtual intf vir;
mailbox mailbox2;
int count;

function new(virtual intf vir, mailbox mailbox2);
this.vir = vir;
this.mailbox2 = mailbox2;
endfunction

task main;
@(negedge vir.clk);
repeat(count) begin
transaction trans = new();
@(posedge vir.clk);
#1;
trans.d = vir.d;
trans.reset = vir.reset;
trans.q = vir.q;
trans.qbar = vir.qbar;
mailbox2.put(trans);
trans.display("monitor");
end
endtask
endclass
