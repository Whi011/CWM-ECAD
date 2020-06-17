//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Roland Whiteley
// Date: 17-06-2020
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
    reg [2:0] OLD_throw;
    reg [2:0] NEW_throw;
    reg err;

    //Wires
    wire [2:0] out;
    

    //An initial block that creates the clock
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
// check to see if reset works
    initial begin
      rst = 1;
      #(CLK_PERIOD)
      rst = 0;
    end
// check to see if button works
    initial begin
      button = 1;
      #(CLK_PERIOD)
      button = 0;
    end
     //An initial block that drives the logic and tests output
    initial begin
      err=0;
      rst=1;
      #(CLK_PERIOD)
      rst=0;
      #(CLK_PERIOD)
      forever
        begin
// test button =1
        OLD_throw=out;
        button=1;
        #(CLK_PERIOD)
        NEW_throw=out;


        if (button==1 & OLD_throw!=6 & NEW_throw-OLD_throw!=1)
          begin
          $display("***FAILED! OLD_throw = %d NEW_throw = %d***",OLD_throw,NEW_throw);
          err=1;
          end

        if (button==1 & OLD_throw==6 & NEW_throw!=1)
          begin
          $display("***FAILED! OLD_throw = %d NEW_throw = %d***",OLD_throw,NEW_throw);
          err=1;
          end

// test button =0
        OLD_throw=out;
        button=0;
        #(CLK_PERIOD)
        NEW_throw=out;

        if (button==0 & OLD_throw!==NEW_throw)
          begin
          $display("***FAILED! OLD_throw = %d NEW_throw = %d***",OLD_throw,NEW_throw);
          err=1;
          end
        end
    end

     //An initial block that ends the simulation, and declares success (if valid)
     initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     //The instantiation of the user's module

     dice top (
     .clk (clk),
     .rst (rst),
     .button (button),
     .throw (out)
     );
     

     
endmodule
