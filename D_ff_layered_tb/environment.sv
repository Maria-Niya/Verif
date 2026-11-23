`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2026 22:21:18
// Design Name: 
// Module Name: environment
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

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  mailbox m1, m2;
  virtual intf vif;
  int num = 20;

  function new(virtual intf vif);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen= new(m1);
    driv =new(vif,m1);
    mon = new(vif,m2);
    scb = new(m2);
  endfunction

  task test();
    gen.count = num; driv.count = num; mon.count = num; scb.count = num;
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask

  task run;
    test();
    $finish;
  endtask
endclass

