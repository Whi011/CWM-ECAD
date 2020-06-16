//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Roladn Whiteley
// Date: 16-06-2020
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
	input a,
	input b,
	input sel,
	output out
    );
    
    //Todo: define registers and wires here
	wire out;
	


    //Todo: define your logic here    
	assign #5 out = (a & !sel) | (b & sel);             


endmodule
