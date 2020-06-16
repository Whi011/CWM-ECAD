//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
  parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
  reg clk;
  reg [7:0] count;
  reg rst;
  reg dir;
  reg enb;
	
  wire out;

//Todo: Clock generation
  initial
  begin
    clk = 0;
    forever
      #(CLK_PERIOD/2) clk=~clk;
  end
// check to see if reset works
  initial begin
    rst = 1;
    #(CLK_PERIOD)
    rst = 0;
  end
// check to see if enable works
  initial begin
    enb = 1;
    #(CLK_PERIOD)
    enb = 0;
    #(CLK_PERIOD)
    enb = 1;
    #(CLK_PERIOD)
  end
// check to see if direction works
//  begin
//    dir = 1;
//    #(CLK_PERIOD)
//    dir = 0;
//    #(CLK_PERIOD)
//    dir = 1;
//    #(CLK_PERIOD)
//  end
//Todo: User logic
	
//Todo: Finish test, check for success

//Todo: Instantiate counter module
  logicalunit top (
  .rst (rst),
  .enb (enb),
  .dir (dir),
  .clk (clk ),
  .count (count)
  );




endmodule 
