//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Roland Whiteley
// Date: 17-06-2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module traffic(
    //Todo: add ports 
  input clk,	// clock
  output wire red,// counter out
  output wire amb,// counter out
  output wire gre// counter out
    );

  reg [2:0] state;
  
  initial begin
    state<=3'b000;
  end

  always @ (posedge clk)
    begin
  // state 110 == red=1, amb=1, gre=0
    state<=(state==3'b100)?3'b110:
           (state==3'b110)?3'b001:
           (state==3'b001)?3'b010:
           (state==3'b010)?3'b100:
           3'b100;
    red<=state[2];
    amb<=state[1];
    gre<=state[0];
    end
endmodule
