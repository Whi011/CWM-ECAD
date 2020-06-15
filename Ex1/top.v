//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 
// Student Name: Roland Whiteley
// Date: 15-06-2020
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  output acts according to the following truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0]
//  0 | 1 | func [1]
//  1 | 0 | func [2]
//  1 | 1 | func [3]
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module logicalunit(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    parameter x=0;
    wire   out;
         
      //Todo: add you logic here

begin

	if (a==0) && (b==0)
		x = func[0];

	if (a==0) && (b==1)
		x = func[1];

	if (a==1) && (b==0)
		x = func[2];
	else
		x = func[3];
	assign out = x;

end
endmodule
