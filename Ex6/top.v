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
  
  output [2:0] result
  );
  reg red;
  reg amb;
  reg gre;


    always @ (posedge clk)
    begin
      if (sel)
        begin
        lights(clk,result[2],result[1],result[0]);
        end
      else
        begin
        dice(clk,rst,button,result);
        end
    end




endmodule
