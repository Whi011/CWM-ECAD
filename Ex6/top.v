//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Roland Whiteley
// Date: 17-06-2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module multi(
  input rst,
  input clk,
  input button,
  input sel,

  output wire [2:0] result
  );

  wire [2:0] throw;
  wire red;
  wire amb;
  wire gre;
  wire [2:0] state;

  traffic traffic (
    .clk (clk),
    .red (red),
    .amb (amb),
    .gre (gre)
    );

  dice dice (
    .clk (clk),
    .rst (rst),
    .button (button),
    .throw (throw)
    );


  assign state[2] = red;
  assign state[1] = amb;
  assign state[0] = gre;

  assign result = (sel==0)?throw : state;

endmodule
