//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
   //No ports are defined! 
   );

   
    //Parameters    
    parameter CLK_PERIOD = 10;

    //Registers
    reg clk;
    reg rst;
    reg button;
    reg [2:0] throw;

    //Wires
    wire out;
    

    //An initial block that creates the clock
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //An initial block that drives the logic and tests output

     //An initial block that ends the simulation, and declares success (if valid)
     
     //The instantiation of the user's module

     dice top (
     .clk (clk),
     .rst (rst),
     .button (button),
     .throw (out)
     );
     

     
endmodule
