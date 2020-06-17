//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
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
    reg r_new;
    reg a_new;
    reg g_new;
    reg r_old;
    reg a_old;
    reg g_old;
    reg err;

    //Wires
    wire r_out;
    wire a_out;
    wire g_out;
    

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
      #(CLK_PERIOD)
      forever
      begin
        r_old=r_out;
        a_old=a_out;
        g_old=g_out;
        #(CLK_PERIOD)
        r_new=r_out;
        a_new=a_out;
        g_new=g_out;
        if (r_old==1 & a_old==0 & g_old==0 & r_new!=1 & a_new!=1 & g_new!=0 |
            r_old==1 & a_old==1 & g_old==0 & r_new!=0 & a_new!=0 & g_new!=1 |
            r_old==0 & a_old==0 & g_old==1 & r_new!=0 & a_new!=1 & g_new!=0 |
            r_old==0 & a_old==1 & g_old==0 & r_new!=1 & a_new!=0 & g_new!=0)
        begin
          $display("***TEST FAILED! old = %d%d%d new = %d%d%d***",r_old,a_old,g_old,r_new,a_new,g_new);
          err=1;
        end
      end
    end

     //An initial block that ends the simulation, and declares success (if valid)
     initial begin
        #100 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     //The instantiation of the user's module

     lights top (
     .clk (clk),
     .red (r_out),
     .amb (a_out),
     .gre (g_out)
     );
     

     
endmodule
