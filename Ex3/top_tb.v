//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Roland Whiteley
// Date: 16-06-2020
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
  reg err;
	
  wire [7:0] out;

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
  end
// check to see if direction works
  initial begin
    dir = 1;
    #(CLK_PERIOD)
    dir = 0;
    #(CLK_PERIOD)
    dir = 1;
  end
/////////////////////////////////////////////////
//Todo: User logic
  initial begin
    err=0;
    count = out;
    #(CLK_PERIOD)
    forever
    begin
      
// rst = 1, enb = 0
      rst = 1;
      enb = 0;
      #(CLK_PERIOD)
      if (out!=0)
      begin
        $display("***TEST FAIL! did not reset when rst = 1, enb = 0");
        err = 1;
      end
// rst = 1, enb = 1
      rst = 1;
      enb = 1;
      #(CLK_PERIOD)
      if (out!=0)
      begin
        $display("***TEST FAIL! did not reset when rst = 1, enb = 1");
        err = 1;
      end
// rst = 0, enb = 1, dir = 0
      rst = 0;
      enb = 1;
      dir = 0;
      #(CLK_PERIOD)
      if (out!=count-1)
      begin
        $display("***TEST FAIL! did not decrease");
        err = 1;
      end
// rst = 0, enb = 1, dir = 1
      rst = 0;
      enb = 1;
      dir = 1;
      #(CLK_PERIOD)
      if (out!=count+1)
      begin
        $display("***TEST FAIL! did not increase");
        err = 1;
      end





    end
  end
//Todo: Finish test, check for success
  initial begin
    #100
    if (!err)
      $display("TEST PASSED!");
    $finish;
  end
//Todo: Instantiate counter module
  counter top (
  .rst (rst),
  .enb (enb),
  .dir (dir),
  .clk (clk),
  .count (out)
  );




endmodule 
