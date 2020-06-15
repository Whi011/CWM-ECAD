//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
	input A,
	input B,
	input sel,
	output out
    );
    
    //Todo: define registers and wires here
	wire = out
	

	parameter CLK_PERIOD = 10; //set the clock period
		initial
			begin
				parameter clk = 1'b0;
				forever
					#(CLK_PERIOD/2) clk=~clk; //happens every delay of CLK_PERIOD/2
			end

    //Todo: define your logic here    
	always @(posedge clk) begin
		assign out = (a & !sel) | (b & sel)             
      	end
endmodule
