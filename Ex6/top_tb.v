//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Roland Whiteley
// Date: 17-06-2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
   //No ports are defined! 
   );

   
    //Parameters    
    parameter CLK_PERIOD = 10;

    //Registers
    reg rst;
    reg clk;
    reg button;
    reg sel;
    reg [2:0] result;
    reg err;

    //Wires
    

    //An initial block that creates the clock
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
//An initial block that drives the logic and tests output
    initial
    begin
      err=0;
      rst=0;//dice
      button=0;//dice
      sel=0; // 0:dice 1:lights
      #(CLK_PERIOD)
      $display("***FAILED! result = %b***",result);
//The instantiation of the user's module
    end


     multi top (
     .rst (rst),
     .clk (clk),
     .button (button),
     .sel (sel)
     );

     lights top5 (
     .clk (clk),
     .red (result[2]),
     .amb (result[1]),
     .gre (result[0])
     );

     dice top4 (
     .clk (clk),
     .rst (rst),
     .button (button),
     .throw (result)
     );
     
endmodule
