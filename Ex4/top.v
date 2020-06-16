//////////////////////////////////////////////////////////////////////////////////
// Exercise #4
// Student Name: Roland Whiteley
// Date: 16-06-2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
  input clk,	// reset
  input rst,	// enable 
  input button,	// direction
  output reg [2:0] throw	// counter out
    );

  always @ (posedge clk)
  begin
    
  end
endmodule
