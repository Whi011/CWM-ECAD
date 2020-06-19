//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module times_table_tester();

  parameter CLK_PERIOD = 10;
  reg clk;
  reg enable;
  reg err;
  reg [2:0] a;
  reg [2:0] b;
  
  wire [5:0] result;


  initial begin
  clk = 0;
  forever
    #(CLK_PERIOD/2) clk = ~clk;
  end

  times_tb top (
  .clk (clk),
  .a (a),
  .b (b),
  .enable (enable),
  .result (result)
  );


endmodule
