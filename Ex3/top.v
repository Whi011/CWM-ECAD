//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
  input rst,	// reset
  input enb,	// enable 
  input dir,	// direction
  input clk,	// clock
  output reg [7:0] count	// counter out
    );
                    
    //Todo: add registers and wires, if needed
  //wire count;

    //Todo: add user logic
  always @ (posedge clk)
  begin
  if (rst)
    begin
    count<=0;
    end
  else
    begin
    if (enb)
      begin
      if (dir)
        begin
        count <= count +1;
        end
      else
        begin
        count <= count -1;
        end
      end
    else
      begin
      count <= count;
      end
    end
  end	
endmodule
