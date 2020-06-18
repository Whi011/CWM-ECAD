//////////////////////////////////////////////////////////////////////////////////
// Exercise #4
// Student Name: Roland Whiteley
// Date: 17-06-2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice throws as long as
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

module dice(
    //Todo: add ports 
  input clk,	// reset
  input rst,	// enable 
  input button,	// direction
  output [2:0] throw	// counter out
    );


  initial begin
  assign throw =3'b000;
  end


  always @ (posedge clk)
  begin
// if rst set throw to 0
  if (rst)
    begin
    assign throw=0;
    end
  else
    begin
    if (button)
      begin
      assign throw=(throw==3'b000)?3'b001:
             (throw==3'b001)?3'b010:
             (throw==3'b010)?3'b011:
             (throw==3'b011)?3'b100:
             (throw==3'b100)?3'b101:
             (throw==3'b101)?3'b110:
             (throw==3'b110)?3'b001:
             3'b001;
      end
    else
      begin
      assign throw=(throw==3'b000)?3'b001:
             (throw==3'b111)?3'b001:
             throw;
      end
    end


  end
endmodule
